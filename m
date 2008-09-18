From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block tree build failure
Date: Thu, 18 Sep 2008 13:04:17 +1000
Message-ID: <20080918130417.261387af.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58573 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752610AbYIRDEY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 23:04:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

Hi Jens,

Today's linux-next build (x86_64 allmodconfig) failed like this:

fs/bio-integrity.c: At top level:
fs/bio-integrity.c:211: error: conflicting types for 'bdev_get_integrity'
fs/bio-integrity.c:155: error: previous implicit declaration of 'bdev_get_integrity' was here

Introduced by commit 1fd75f9b2e1c273ab145c9bf3e7a8afcbd8be87a ("block:
cleanup some of the integrity stuff in blkdev.h").  I applied the
following patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 18 Sep 2008 12:59:18 +1000
Subject: [PATCH] block: bdev_get_integrity needs to be defined earlier

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/bio-integrity.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/bio-integrity.c b/fs/bio-integrity.c
index 78e5b56..ba4ada0 100644
--- a/fs/bio-integrity.c
+++ b/fs/bio-integrity.c
@@ -150,6 +150,11 @@ int bio_integrity_add_page(struct bio *bio, struct page *page,
 }
 EXPORT_SYMBOL(bio_integrity_add_page);
 
+static struct blk_integrity *bdev_get_integrity(struct block_device *bdev)
+{
+	return bdev->bd_disk->integrity;
+}
+
 static int bdev_integrity_enabled(struct block_device *bdev, int rw)
 {
 	struct blk_integrity *bi = bdev_get_integrity(bdev);
@@ -207,11 +212,6 @@ static inline unsigned int bio_integrity_hw_sectors(struct blk_integrity *bi,
 	return sectors;
 }
 
-static struct blk_integrity *bdev_get_integrity(struct block_device *bdev)
-{
-	return bdev->bd_disk->integrity;
-}
-
 /**
  * bio_integrity_tag_size - Retrieve integrity tag space
  * @bio:	bio to inspect
-- 
1.5.6.5
