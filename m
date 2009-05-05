From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 1/2] fs: sync_filesystem() not depend on BLOCK
Date: Tue,  5 May 2009 13:30:17 +0400
Message-ID: <1241515818-15860-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: Alexander Beregalov <a.beregalov@gmail.com>
List-Id: linux-next.vger.kernel.org

Fix this build error when CONFIG_BLOCK is not set:
fs/super.c: In function 'generic_shutdown_super':
fs/super.c:278: error: implicit declaration of function 'sync_filesystem'

sync_filesystem() is always built with or without BLOCK.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 include/linux/fs.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index dee9745..efc991a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1943,7 +1943,6 @@ extern struct super_block *freeze_bdev(struct block_device *);
 extern void emergency_thaw_all(void);
 extern int thaw_bdev(struct block_device *bdev, struct super_block *sb);
 extern int fsync_bdev(struct block_device *);
-extern int sync_filesystem(struct super_block *);
 extern int fsync_no_super(struct block_device *);
 #else
 static inline void bd_forget(struct inode *inode) {}
@@ -1961,6 +1960,8 @@ static inline int thaw_bdev(struct block_device *bdev, struct super_block *sb)
 	return 0;
 }
 #endif
+extern int sync_filesystem(struct super_block *);
+
 extern const struct file_operations def_blk_fops;
 extern const struct file_operations def_chr_fops;
 extern const struct file_operations bad_sock_fops;
-- 
1.6.2.3

