From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ext4 tree with the  tree
Date: Fri, 27 Feb 2009 13:03:40 +1100
Message-ID: <20090227130340.ad238eb8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59863 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752490AbZB0CDp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Feb 2009 21:03:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Theodore Tso <tytso@MIT.EDU>
Cc: linux-next@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Mingming Cao <cmm@us.ibm.com>, Jan Kara <jack@suse.cz>

Hi Ted,

Today's linux-next merge of the ext4 tree got a conflict in
fs/ext4/inode.c between commit ext4_da_update_reserve_space ("ext4: quota
reservation for delayed allocation") from the quota tree and commit
ext4_da_update_reserve_space ("ext4: Fix discard of inode prealloc space
with delayed allocation") from the ext4 tree.

I think this is just overlapping additions.  I fixed it up by taking both
changes (see below) but it is worth a look.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/ext4/inode.c
index a2845b5,8815b9c..0000000
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@@ -1050,11 -1054,13 +1065,19 @@@ static void ext4_da_update_reserve_spac
  	spin_unlock(&EXT4_I(inode)->i_block_reservation_lock);
  
  	/*
 +	 * free those over-booking quota for metadata blocks
 +	 */
 +
 +	if (mdb_free)
 +		vfs_dq_release_reservation_block(inode, mdb_free);
++
++	/*
+ 	 * If have done all the pending block allocation and if the we
+ 	 * don't have any writer on the inode, we can discard the
+ 	 * inode's preallocations.
+ 	 */
+ 	if (!total && (atomic_read(&inode->i_writecount) == 0))
+ 		ext4_discard_preallocations(inode);
  }
  
  /*
