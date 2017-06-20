From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 20 Jun 2017 11:45:17 +1000
Message-ID: <20170620114517.7f0090b9@canb.auug.org.au>
References: <20170613205409.4b7e06f9@canb.auug.org.au>
        <alpine.LFD.2.20.1706151649160.1848@schleppi>
        <alpine.LFD.2.20.1706191056510.1794@schleppi>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LFD.2.20.1706191056510.1794@schleppi>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Ott <sebott@linux.vnet.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Sebastian,

On Mon, 19 Jun 2017 11:00:23 +0200 (CEST) Sebastian Ott <sebott@linux.vnet.ibm.com> wrote:
>
> Ok, we should also adjust the return code to fix this:
> 
> drivers/s390/block/scm_blk.c:426:2: warning: initialization from incompatible pointer type [enabled by default]
>   .queue_rq = scm_blk_request,
>   ^
> 
> diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
> index 2cd6123c8f18..4279685901bf 100644
> --- a/drivers/s390/block/scm_blk.c
> +++ b/drivers/s390/block/scm_blk.c
> @@ -278,8 +278,8 @@ struct scm_queue {
>  	spinlock_t lock;
>  };
>  
> -static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
> -			   const struct blk_mq_queue_data *qd)
> +static blk_status_t scm_blk_request(struct blk_mq_hw_ctx *hctx,
> +				    const struct blk_mq_queue_data *qd)
>  {
>  	struct scm_device *scmdev = hctx->queue->queuedata;
>  	struct scm_blk_dev *bdev = dev_get_drvdata(&scmdev->dev);
> 

Good point, I have done that today.  The complete fix up patch now
looks like this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 13 Jun 2017 20:51:32 +1000
Subject: [PATCH] s390: fix up for "blk-mq: switch ->queue_rq return value to
 blk_status_t"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/s390/block/scm_blk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/s390/block/scm_blk.c b/drivers/s390/block/scm_blk.c
index 42018a20f2b7..0071febac9e6 100644
--- a/drivers/s390/block/scm_blk.c
+++ b/drivers/s390/block/scm_blk.c
@@ -278,7 +278,7 @@ struct scm_queue {
 	spinlock_t lock;
 };
 
-static int scm_blk_request(struct blk_mq_hw_ctx *hctx,
+static blk_status_t scm_blk_request(struct blk_mq_hw_ctx *hctx,
 			   const struct blk_mq_queue_data *qd)
 {
 	struct scm_device *scmdev = hctx->queue->queuedata;
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
