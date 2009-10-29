From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: next-20091029: fs/aio.c build failure
Date: Thu, 29 Oct 2009 13:56:06 +0100
Message-ID: <20091029125606.GK10727@kernel.dk>
References: <a4423d670910290540x21ab0692p90ebd04b5c3d62e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:46863 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752801AbZJ2M4C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Oct 2009 08:56:02 -0400
Content-Disposition: inline
In-Reply-To: <a4423d670910290540x21ab0692p90ebd04b5c3d62e@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, jmoyer@redhat.com

On Thu, Oct 29 2009, Alexander Beregalov wrote:
> Hi
> 
> fs/aio.c:1575: error: implicit declaration of function 'blk_run_address_space'
> 
> CONFIG_BLOCK is not set.

Not the first time this has happened, I think we should just pull the
bdi/mapping unplug functions out of CONFIG_BLOCK protection. They work
on the backing_dev, so they aren't inherently tied to just block IO.

This should fix it, I'll test and commit.

diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index b449e73..fcbc26a 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -331,4 +331,17 @@ static inline int bdi_sched_wait(void *word)
 	return 0;
 }
 
+static inline void blk_run_backing_dev(struct backing_dev_info *bdi,
+				       struct page *page)
+{
+	if (bdi && bdi->unplug_io_fn)
+		bdi->unplug_io_fn(bdi, page);
+}
+
+static inline void blk_run_address_space(struct address_space *mapping)
+{
+	if (mapping)
+		blk_run_backing_dev(mapping->backing_dev_info, NULL);
+}
+
 #endif		/* _LINUX_BACKING_DEV_H */
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 221cecd..39c601f 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -823,19 +823,6 @@ static inline struct request_queue *bdev_get_queue(struct block_device *bdev)
 	return bdev->bd_disk->queue;
 }
 
-static inline void blk_run_backing_dev(struct backing_dev_info *bdi,
-				       struct page *page)
-{
-	if (bdi && bdi->unplug_io_fn)
-		bdi->unplug_io_fn(bdi, page);
-}
-
-static inline void blk_run_address_space(struct address_space *mapping)
-{
-	if (mapping)
-		blk_run_backing_dev(mapping->backing_dev_info, NULL);
-}
-
 /*
  * blk_rq_pos()			: the current sector
  * blk_rq_bytes()		: bytes left in the entire request

-- 
Jens Axboe
