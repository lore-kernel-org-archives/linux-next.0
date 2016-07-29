From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Fri, 29 Jul 2016 11:19:38 +1000
Message-ID: <20160729111938.56ee0fa1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44017 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751773AbcG2BTl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jul 2016 21:19:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>

Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/fuse/dir.c: In function 'fuse_reverse_inval_entry':
fs/fuse/dir.c:958:13: error: assignment of member 'hash' in read-only object
  name->hash = full_name_hash(dir, name->name, name->len);
             ^

Caused by commit

  8387ff2577eb ("vfs: make the string hashes salt the hash")

from Linus' tree interacting with commit

  5e70178ae20b ("qstr: constify instances in fuse")

from the vfs tree.

I added this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 29 Jul 2016 11:07:45 +1000
Subject: [PATCH] qstr: unconstify fuse_reverse_inval_entry parameter

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/fuse/dir.c    | 2 +-
 fs/fuse/fuse_i.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index f910578e51ba..c47b7780ce37 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -935,7 +935,7 @@ int fuse_update_attributes(struct inode *inode, struct kstat *stat,
 }
 
 int fuse_reverse_inval_entry(struct super_block *sb, u64 parent_nodeid,
-			     u64 child_nodeid, const struct qstr *name)
+			     u64 child_nodeid, struct qstr *name)
 {
 	int err = -ENOTDIR;
 	struct inode *parent;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 6df761726a53..d98d8cc84def 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -929,7 +929,7 @@ int fuse_reverse_inval_inode(struct super_block *sb, u64 nodeid,
  * then the dentry is unhashed (d_delete()).
  */
 int fuse_reverse_inval_entry(struct super_block *sb, u64 parent_nodeid,
-			     u64 child_nodeid, const struct qstr *name);
+			     u64 child_nodeid, struct qstr *name);
 
 int fuse_do_open(struct fuse_conn *fc, u64 nodeid, struct file *file,
 		 bool isdir);
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
