From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH 2/2] fs: define __sync_blockdev() when !BLOCK
Date: Tue,  5 May 2009 13:30:18 +0400
Message-ID: <1241515818-15860-2-git-send-email-a.beregalov@gmail.com>
References: <1241515818-15860-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <1241515818-15860-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: Alexander Beregalov <a.beregalov@gmail.com>
List-Id: linux-next.vger.kernel.org

Fix this build error when CONFIG_BLOCK is not set:
fs/sync.c: In function '__sync_filesystem':
fs/sync.c:40: error: implicit declaration of function '__sync_blockdev'

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 include/linux/fs.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index efc991a..4193cf0 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1947,6 +1947,10 @@ extern int fsync_no_super(struct block_device *);
 #else
 static inline void bd_forget(struct inode *inode) {}
 static inline int sync_blockdev(struct block_device *bdev) { return 0; }
+static inline int __sync_blockdev(struct block_device *bdev, int wait)
+{
+	return 0;
+}
 static inline void sync_blockdevs(void) { }
 static inline void invalidate_bdev(struct block_device *bdev) {}
 
-- 
1.6.2.3

