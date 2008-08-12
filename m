From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ubifs tree build failure
Date: Tue, 12 Aug 2008 16:24:09 +1000
Message-ID: <20080812162409.91834486.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49099 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751267AbYHLGYc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 02:24:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-next@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Artem,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/ubifs/super.c: In function 'ubifs_fh_to_dentry':
fs/ubifs/super.c:1611: error: implicit declaration of function 'd_alloc_anon'
fs/ubifs/super.c:1611: warning: assignment makes pointer from integer without a cast

Caused by interaction between commit
95b53e84e8899258a1af011a7216abb978afae26 ("kill d_alloc_anon") from the
vfs tree and b51e4badb0248ac75fe3128bb369d987e28b2f88 ("UBIFS: add NFS
support") from the ubifs tree.  The former removes d_alloc_anon and the
latter adds a new usage.

For now, I have reverted the ubifs commit.  Christoph, maybe you could
provide a better solution.

I have appended the reverted patch below.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

commit b51e4badb0248ac75fe3128bb369d987e28b2f88
Author: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date:   Tue Jul 22 16:49:31 2008 +0300

    UBIFS: add NFS support
    
    Implement minimal set of FS export operations to support NFS.
    
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index a79e850..320f89a 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -255,12 +255,7 @@ static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 
 done:
 	kfree(dent);
-	/*
-	 * Note, d_splice_alias() would be required instead if we supported
-	 * NFS.
-	 */
-	d_add(dentry, inode);
-	return NULL;
+	return d_splice_alias(inode, dentry);
 
 out:
 	kfree(dent);
diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1dc8c25..39a6e01 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -35,6 +35,7 @@
 #include <linux/parser.h>
 #include <linux/seq_file.h>
 #include <linux/mount.h>
+#include <linux/exportfs.h>
 #include "ubifs.h"
 
 /* Slab cache for UBIFS inodes */
@@ -149,7 +150,7 @@ struct inode *ubifs_iget(struct super_block *sb, unsigned long inum)
 	if (err)
 		goto out_invalid;
 
-	/* Disable readahead */
+	/* Disable read-ahead */
 	inode->i_mapping->backing_dev_info = &c->bdi;
 
 	switch (inode->i_mode & S_IFMT) {
@@ -345,7 +346,7 @@ static void ubifs_delete_inode(struct inode *inode)
 	if (err)
 		/*
 		 * Worst case we have a lost orphan inode wasting space, so a
-		 * simple error message is ok here.
+		 * simple error message is OK here.
 		 */
 		ubifs_err("can't delete inode %lu, error %d",
 			  inode->i_ino, err);
@@ -1578,6 +1579,51 @@ struct super_operations ubifs_super_operations = {
 	.sync_fs       = ubifs_sync_fs,
 };
 
+/*
+ * Note, since UBIFS does re-use inode numbers at the moment, we do not check
+ * the generation number in this function.
+ */
+static struct dentry *ubifs_fh_to_dentry(struct super_block *sb,
+					 struct fid *fid,
+					 int fh_len, int fh_type)
+{
+	ino_t inum;
+	struct inode *inode;
+	struct dentry *dent;
+
+	switch (fh_type) {
+	case FILEID_INO32_GEN:
+	case FILEID_INO32_GEN_PARENT:
+		inum = fid->i32.ino;
+		break;
+	default:
+		dbg_err("unsupported file handle type %d", fh_type);
+		return ERR_PTR(-EINVAL);
+	}
+
+	inode = ubifs_iget(sb, inum);
+	if (IS_ERR(inode)) {
+		if (PTR_ERR(inode) == -ENOENT)
+			return ERR_PTR(-ESTALE);
+		return ERR_CAST(inode);
+	}
+
+	dent = d_alloc_anon(inode);
+	if (!dent) {
+		iput(inode);
+		return ERR_PTR(-ENOMEM);
+	}
+	return dent;
+}
+
+/*
+ * Probably NFS support could be faster if other export operations were
+ * implemented, but '->fh_to_dentry()' is enough.
+ */
+static struct export_operations ubifs_export_ops = {
+	.fh_to_dentry = ubifs_fh_to_dentry,
+};
+
 /**
  * open_ubi - parse UBI device name string and open the UBI device.
  * @name: UBI volume name
@@ -1685,10 +1731,10 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	}
 
 	/*
-	 * UBIFS provids 'backing_dev_info' in order to disable readahead. For
+	 * UBIFS provides 'backing_dev_info' in order to disable read-ahead. For
 	 * UBIFS, I/O is not deferred, it is done immediately in readpage,
 	 * which means the user would have to wait not just for their own I/O
-	 * but the readahead I/O as well i.e. completely pointless.
+	 * but the read-ahead I/O as well i.e. completely pointless.
 	 *
 	 * Read-ahead will be disabled because @c->bdi.ra_pages is 0.
 	 */
@@ -1713,6 +1759,7 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
 	if (c->max_inode_sz > MAX_LFS_FILESIZE)
 		sb->s_maxbytes = c->max_inode_sz = MAX_LFS_FILESIZE;
 	sb->s_op = &ubifs_super_operations;
+	sb->s_export_op = &ubifs_export_ops;
 
 	mutex_lock(&c->umount_mutex);
 	err = mount_ubifs(c);
@@ -1846,10 +1893,11 @@ static void ubifs_kill_sb(struct super_block *sb)
 }
 
 static struct file_system_type ubifs_fs_type = {
-	.name    = "ubifs",
-	.owner   = THIS_MODULE,
-	.get_sb  = ubifs_get_sb,
-	.kill_sb = ubifs_kill_sb
+	.name     = "ubifs",
+	.owner    = THIS_MODULE,
+	.get_sb   = ubifs_get_sb,
+	.kill_sb  = ubifs_kill_sb,
+	.fs_flags = FS_REQUIRES_DEV,
 };
 
 /*
