From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ocfs2 tree
Date: Fri, 16 Jan 2009 13:36:08 +1100
Message-ID: <20090116133608.8dc3c7a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58686 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753071AbZAPCgQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 21:36:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Fasheh <mfasheh@suse.com>
Cc: linux-next@vger.kernel.org, Jan Kara <jack@suse.cz>, Mingming Cao <cmm@us.ibm.com>

Hi Mark,

Today's linux-next merge of the ocfs2 tree got a conflict in fs/dquot.c
between commit 04279f0aebb68d1eccd8957a5f24347df604ebd3 ("quota: Move
EXPORT_SYMBOL immediatlely next to the functions/varibles") from the
quota tree and commit 8dcbb6b822aeb5d50592aa4e9aed06ccf87ab2df ("quota:
Improve locking") from the ocfs2 tree.

I fixed it up (see below) and can carry the fix as necessary.  Though if
the quota patch above is added to the quota tree, the conflicts should go
away.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/dquot.c
index 1a3a5d8,bca3cac..0000000
--- a/fs/dquot.c
+++ b/fs/dquot.c
@@@ -126,8 -130,8 +130,9 @@@
   */
  
  static DEFINE_SPINLOCK(dq_list_lock);
+ static DEFINE_SPINLOCK(dq_state_lock);
  DEFINE_SPINLOCK(dq_data_lock);
 +EXPORT_SYMBOL(dq_data_lock);
  
  static char *quotatypes[] = INITQFNAMES;
  static struct quota_format_type *quota_formats;	/* List of registered formats */
@@@ -1273,37 -1245,32 +1288,34 @@@ int dquot_initialize(struct inode *inod
  		}
  	}
  out_err:
- 	up_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
+ 	up_write(&sb_dqopt(sb)->dqptr_sem);
+ 	/* Drop unused references */
+ 	for (cnt = 0; cnt < MAXQUOTAS; cnt++)
+ 		dqput(got[cnt]);
  	return ret;
  }
 +EXPORT_SYMBOL(dquot_initialize);
  
  /*
   * 	Release all quotas referenced by inode
-  *	Transaction must be started at an entry
   */
- int dquot_drop_locked(struct inode *inode)
+ int dquot_drop(struct inode *inode)
  {
  	int cnt;
+ 	struct dquot *put[MAXQUOTAS];
  
+ 	down_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
  	for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
- 		if (inode->i_dquot[cnt] != NODQUOT) {
- 			dqput(inode->i_dquot[cnt]);
- 			inode->i_dquot[cnt] = NODQUOT;
- 		}
+ 		put[cnt] = inode->i_dquot[cnt];
+ 		inode->i_dquot[cnt] = NODQUOT;
  	}
- 	return 0;
- }
- EXPORT_SYMBOL(dquot_drop_locked);
- 
- int dquot_drop(struct inode *inode)
- {
- 	down_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
- 	dquot_drop_locked(inode);
  	up_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
+ 
+ 	for (cnt = 0; cnt < MAXQUOTAS; cnt++)
+ 		dqput(put[cnt]);
  	return 0;
  }
 +EXPORT_SYMBOL(dquot_drop);
  
  /* Wrapper to remove references to quota structures from inode */
  void vfs_dq_drop(struct inode *inode)
@@@ -1639,12 -1481,12 +1651,13 @@@ qsize_t dquot_get_reserved_space(struc
   */
  int dquot_transfer(struct inode *inode, struct iattr *iattr)
  {
 -	qsize_t space;
 +	qsize_t space, cur_space;
 +	qsize_t rsv_space = 0;
  	struct dquot *transfer_from[MAXQUOTAS];
  	struct dquot *transfer_to[MAXQUOTAS];
- 	int cnt, ret = NO_QUOTA, chuid = (iattr->ia_valid & ATTR_UID) && inode->i_uid != iattr->ia_uid,
- 	    chgid = (iattr->ia_valid & ATTR_GID) && inode->i_gid != iattr->ia_gid;
+ 	int cnt, ret = QUOTA_OK;
+ 	int chuid = iattr->ia_valid & ATTR_UID && inode->i_uid != iattr->ia_uid,
+ 	    chgid = iattr->ia_valid & ATTR_GID && inode->i_gid != iattr->ia_gid;
  	char warntype_to[MAXQUOTAS];
  	char warntype_from_inodes[MAXQUOTAS], warntype_from_space[MAXQUOTAS];
  
@@@ -1680,10 -1512,15 +1683,17 @@@
  				break;
  		}
  	}
+ 
+ 	down_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
+ 	/* Now recheck reliably when holding dqptr_sem */
+ 	if (IS_NOQUOTA(inode)) {	/* File without quota accounting? */
+ 		up_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
+ 		goto put_all;
+ 	}
  	spin_lock(&dq_data_lock);
 -	space = inode_get_bytes(inode);
 +	cur_space = inode_get_bytes(inode);
 +	rsv_space = dquot_get_reserved_space(inode);
 +	space = cur_space + rsv_space;
  	/* Build the transfer_from list and check the limits */
  	for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
  		if (transfer_to[cnt] == NODQUOT)
@@@ -1736,17 -1574,21 +1750,22 @@@ warn_put_all
  	flush_warnings(transfer_to, warntype_to);
  	flush_warnings(transfer_from, warntype_from_inodes);
  	flush_warnings(transfer_from, warntype_from_space);
- 	
+ put_all:
  	for (cnt = 0; cnt < MAXQUOTAS; cnt++) {
- 		if (ret == QUOTA_OK && transfer_from[cnt] != NODQUOT)
- 			dqput(transfer_from[cnt]);
- 		if (ret == NO_QUOTA && transfer_to[cnt] != NODQUOT)
- 			dqput(transfer_to[cnt]);
+ 		dqput(transfer_from[cnt]);
+ 		dqput(transfer_to[cnt]);
  	}
- 	up_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
  	return ret;
+ over_quota:
+ 	spin_unlock(&dq_data_lock);
+ 	up_write(&sb_dqopt(inode->i_sb)->dqptr_sem);
+ 	/* Clear dquot pointers we don't want to dqput() */
+ 	for (cnt = 0; cnt < MAXQUOTAS; cnt++)
+ 		transfer_from[cnt] = NODQUOT;
+ 	ret = NO_QUOTA;
+ 	goto warn_put_all;
  }
 +EXPORT_SYMBOL(dquot_transfer);
  
  /* Wrapper for transferring ownership of an inode */
  int vfs_dq_transfer(struct inode *inode, struct iattr *iattr)
@@@ -2225,17 -2071,14 +2255,15 @@@ int vfs_get_dqblk(struct super_block *s
  {
  	struct dquot *dquot;
  
- 	mutex_lock(&sb_dqopt(sb)->dqonoff_mutex);
- 	if (!(dquot = dqget(sb, id, type))) {
- 		mutex_unlock(&sb_dqopt(sb)->dqonoff_mutex);
+ 	dquot = dqget(sb, id, type);
+ 	if (dquot == NODQUOT)
  		return -ESRCH;
- 	}
  	do_get_dqblk(dquot, di);
  	dqput(dquot);
- 	mutex_unlock(&sb_dqopt(sb)->dqonoff_mutex);
+ 
  	return 0;
  }
 +EXPORT_SYMBOL(vfs_get_dqblk);
  
  /* Generic routine for setting common part of quota structure */
  static int do_set_dqblk(struct dquot *dquot, struct if_dqblk *di)
@@@ -2326,10 -2168,8 +2353,9 @@@ int vfs_set_dqblk(struct super_block *s
  	rc = do_set_dqblk(dquot, di);
  	dqput(dquot);
  out:
- 	mutex_unlock(&sb_dqopt(sb)->dqonoff_mutex);
  	return rc;
  }
 +EXPORT_SYMBOL(vfs_set_dqblk);
  
  /* Generic routine for getting common part of quota file information */
  int vfs_get_dqinfo(struct super_block *sb, int type, struct if_dqinfo *ii)
