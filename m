From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Tue, 13 Jun 2017 20:54:09 +1000
Message-ID: <20170613205409.4b7e06f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43855 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751895AbdFMKyM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jun 2017 06:54:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Sebastian Ott <sebott@linux.vnet.ibm.com>

Hi Jall,

After merging the block tree, today's linux-next build (s390x
s390-defconfig) failed like this:

drivers/s390/block/scm_blk.c:293:10: error: 'BLK_MQ_RQ_QUEUE_BUSY' undeclared (first use in this function)
drivers/s390/block/scm_blk.c:327:9: error: 'BLK_MQ_RQ_QUEUE_OK' undeclared (first use in this function)

Caused by commit

  fc17b6534eb8 ("blk-mq: switch ->queue_rq return value to blk_status_t")

interacting with commit

  12d907626539 ("s390/scm: convert to blk-mq")

from the s390 tree.

Is the following the correct merge fixup?

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Jun 2017 20:51:32 +1000
Subject: [PATCH] s390: fix up for "blk-mq: switch ->queue_rq return value to
 blk_status_t"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/s390/block/scm_blk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index 42018a20f2b7..2cd6123c8f18 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -290,7 +290,7 @@ static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
 	spin_lock(&sq->lock);
 	if (!scm_permit_request(bdev, req)) {
 		spin_unlock(&sq->lock);
-		return BLK_MQ_RQ_QUEUE_BUSY;
+		return BLK_STS_RESOURCE;
 	}
 
 	scmrq = sq->scmrq;
@@ -299,7 +299,7 @@ static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
 		if (!scmrq) {
 			SCM_LOG(5, "no request");
 			spin_unlock(&sq->lock);
-			return BLK_MQ_RQ_QUEUE_BUSY;
+			return BLK_STS_RESOURCE;
 		}
 		scm_request_init(bdev, scmrq);
 		sq->scmrq = scmrq;
@@ -315,7 +315,7 @@ static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
 
 		sq->scmrq = NULL;
 		spin_unlock(&sq->lock);
-		return BLK_MQ_RQ_QUEUE_BUSY;
+		return BLK_STS_RESOURCE;
 	}
 	blk_mq_start_request(req);
 
@@ -324,7 +324,7 @@ static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
 		sq->scmrq = NULL;
 	}
 	spin_unlock(&sq->lock);
-	return BLK_MQ_RQ_QUEUE_OK;
+	return BLK_STS_OK;
 }
 
 static int scm_blk_init_hctx(struct blk_mq_hw_ctx *hctx, void *data,
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
