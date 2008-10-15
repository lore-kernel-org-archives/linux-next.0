From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree
Date: Wed, 15 Oct 2008 17:50:16 +1100
Message-ID: <20081015175016.b55b4ed3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48548 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751479AbYJOGum (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 02:50:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Christoph Hellwig <hch@lst.de>

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/namei.c between commit f702ba0fd7d50b5f5f5aea5317875a10d40b869f
("ext4: Don't use 'struct dentry' for internal lookups") from Linus' tree
and commit 8ee6b8fff20962d17a008e230006e48c7f79ade4 ("[PATCH] switch all
filesystems over to d_obtain_alias") from the vfs tree.

Just context changes.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc fs/ext4/namei.c
index 92db9e9,542c013..0000000
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@@ -1061,17 -1060,15 +1061,14 @@@ static struct dentry *ext4_lookup(struc
  struct dentry *ext4_get_parent(struct dentry *child)
  {
  	unsigned long ino;
- 	struct dentry *parent;
- 	struct inode *inode;
 -	struct dentry dotdot;
 +	static const struct qstr dotdot = {
 +		.name = "..",
 +		.len = 2,
 +	};
  	struct ext4_dir_entry_2 * de;
  	struct buffer_head *bh;
  
 -	dotdot.d_name.name = "..";
 -	dotdot.d_name.len = 2;
 -	dotdot.d_parent = child; /* confusing, isn't it! */
 -
 -	bh = ext4_find_entry(&dotdot, &de);
 +	bh = ext4_find_entry(child->d_inode, &dotdot, &de);
- 	inode = NULL;
  	if (!bh)
  		return ERR_PTR(-ENOENT);
  	ino = le32_to_cpu(de->inode);
