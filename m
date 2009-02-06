From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the security-testing tree with Linus'
 tree
Date: Fri, 6 Feb 2009 18:23:37 +1100
Message-ID: <20090206182337.6673aabc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40921 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751491AbZBFHXk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Feb 2009 02:23:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>, Mimi Zohar <zohar@linux.vnet.ibm.com>

Hi James,

Today's linux-next merge of the security-testing tree got a conflict in
fs/namei.c between commit cb23beb55100171646e69e248fb45f10db6e99a4 ("kill
vfs_permission") from Linus' tree and commit
6146f0d5e47ca4047ffded0fb79b6c25359b386c ("integrity: IMA hooks") from
the security-testing tree.

Just a context change.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/namei.c
index bbc15c2,734f2b5..0000000
--- a/fs/namei.c
+++ b/fs/namei.c
@@@ -848,8 -860,9 +849,10 @@@ static int __link_path_walk(const char 
  		nd->flags |= LOOKUP_CONTINUE;
  		err = exec_permission_lite(inode);
  		if (err == -EAGAIN)
 -			err = vfs_permission(nd, MAY_EXEC);
 +			err = inode_permission(nd->path.dentry->d_inode,
 +					       MAY_EXEC);
+ 		if (!err)
+ 			err = ima_path_check(&nd->path, MAY_EXEC);
   		if (err)
  			break;
  
@@@ -1506,9 -1525,14 +1509,14 @@@ int may_open(struct path *path, int acc
  		flag &= ~O_TRUNC;
  	}
  
 -	error = vfs_permission(nd, acc_mode);
 +	error = inode_permission(inode, acc_mode);
  	if (error)
  		return error;
+ 
+ 	error = ima_path_check(&nd->path,
+ 			       acc_mode & (MAY_READ | MAY_WRITE | MAY_EXEC));
+ 	if (error)
+ 		return error;
  	/*
  	 * An append-only file must be opened in append mode for writing.
  	 */
