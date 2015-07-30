From: green@linuxhacker.ru
Subject: [PATCH] staging/lustre/lloop: Update call to bio_endio() to match new prototype
Date: Thu, 30 Jul 2015 11:03:35 -0400
Message-ID: <1438268615-1685381-1-git-send-email-green@linuxhacker.ru>
References: <20150730141713.001bf7d6@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150730141713.001bf7d6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <green@linuxhacker.ru>, Oleg Drokin <oleg.drokin@intel.com>
List-Id: linux-next.vger.kernel.org

From: Oleg Drokin <green@linuxhacker.ru>

Also while we are at it, drop all cfs_bio_* wrappers.

Signed-off-by: Oleg Drokin <oleg.drokin@intel.com>
---
 drivers/staging/lustre/lustre/include/linux/lustre_compat25.h | 3 ---
 drivers/staging/lustre/lustre/llite/lloop.c                   | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h b/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
index 513c81f..c2a4ffd 100644
--- a/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
+++ b/drivers/staging/lustre/lustre/include/linux/lustre_compat25.h
@@ -85,9 +85,6 @@
 #define ll_vfs_rename(old, old_dir, mnt, new, new_dir, mnt1) \
 		vfs_rename(old, old_dir, new, new_dir, NULL, 0)
 
-#define cfs_bio_io_error(a, b)   bio_io_error((a))
-#define cfs_bio_endio(a, b, c)    bio_endio((a), (c))
-
 #define cfs_path_put(nd)     path_put(&(nd)->path)
 
 
diff --git a/drivers/staging/lustre/lustre/llite/lloop.c b/drivers/staging/lustre/lustre/llite/lloop.c
index cc00fd1..d614234 100644
--- a/drivers/staging/lustre/lustre/llite/lloop.c
+++ b/drivers/staging/lustre/lustre/llite/lloop.c
@@ -365,7 +365,7 @@ static void loop_make_request(struct request_queue *q, struct bio *old_bio)
 	loop_add_bio(lo, old_bio);
 	return;
 err:
-	cfs_bio_io_error(old_bio, old_bio->bi_iter.bi_size);
+	bio_io_error(old_bio);
 }
 
 
@@ -376,7 +376,7 @@ static inline void loop_handle_bio(struct lloop_device *lo, struct bio *bio)
 	while (bio) {
 		struct bio *tmp = bio->bi_next;
 		bio->bi_next = NULL;
-		cfs_bio_endio(bio, bio->bi_iter.bi_size, ret);
+		bio_endio(bio);
 		bio = tmp;
 	}
 }
-- 
2.1.0
