From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Fri, 23 Jun 2017 13:06:32 +1000
Message-ID: <20170623130632.03bc60af@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60883 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753925AbdFWDGg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 22 Jun 2017 23:06:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  block/blk-mq-sched.c

between commit:

  8e8320c9315c ("blk-mq: fix performance regression with shared tags")

from Linus' tree and commits:

  d2c0d3832469 ("blk-mq: move blk_mq_sched_{get,put}_request to blk-mq.c")
  44e8c2bff80b ("blk-mq: refactor blk_mq_sched_assign_ioc")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc block/blk-mq-sched.c
index 0ded5e846335,191bf82d185e..000000000000
--- a/block/blk-mq-sched.c
+++ b/block/blk-mq-sched.c
@@@ -47,131 -46,10 +46,49 @@@ void blk_mq_sched_assign_ioc(struct req
  		if (!icq)
  			return;
  	}
- 
+ 	get_io_context(icq->ioc);
  	rq->elv.icq = icq;
- 	if (!blk_mq_sched_get_rq_priv(q, rq, bio)) {
- 		rq->rq_flags |= RQF_ELVPRIV;
- 		get_io_context(icq->ioc);
- 		return;
- 	}
- 
- 	rq->elv.icq = NULL;
- }
- 
- static void blk_mq_sched_assign_ioc(struct request_queue *q,
- 				    struct request *rq, struct bio *bio)
- {
- 	struct io_context *ioc;
- 
- 	ioc = rq_ioc(bio);
- 	if (ioc)
- 		__blk_mq_sched_assign_ioc(q, rq, bio, ioc);
  }
  
 +/*
 + * Mark a hardware queue as needing a restart. For shared queues, maintain
 + * a count of how many hardware queues are marked for restart.
 + */
 +static void blk_mq_sched_mark_restart_hctx(struct blk_mq_hw_ctx *hctx)
 +{
 +	if (test_bit(BLK_MQ_S_SCHED_RESTART, &hctx->state))
 +		return;
 +
 +	if (hctx->flags & BLK_MQ_F_TAG_SHARED) {
 +		struct request_queue *q = hctx->queue;
 +
 +		if (!test_and_set_bit(BLK_MQ_S_SCHED_RESTART, &hctx->state))
 +			atomic_inc(&q->shared_hctx_restart);
 +	} else
 +		set_bit(BLK_MQ_S_SCHED_RESTART, &hctx->state);
 +}
 +
 +static bool blk_mq_sched_restart_hctx(struct blk_mq_hw_ctx *hctx)
 +{
 +	if (!test_bit(BLK_MQ_S_SCHED_RESTART, &hctx->state))
 +		return false;
 +
 +	if (hctx->flags & BLK_MQ_F_TAG_SHARED) {
 +		struct request_queue *q = hctx->queue;
 +
 +		if (test_and_clear_bit(BLK_MQ_S_SCHED_RESTART, &hctx->state))
 +			atomic_dec(&q->shared_hctx_restart);
 +	} else
 +		clear_bit(BLK_MQ_S_SCHED_RESTART, &hctx->state);
 +
 +	if (blk_mq_hctx_has_pending(hctx)) {
 +		blk_mq_run_hw_queue(hctx, true);
 +		return true;
 +	}
 +
 +	return false;
 +}
 +
- struct request *blk_mq_sched_get_request(struct request_queue *q,
- 					 struct bio *bio,
- 					 unsigned int op,
- 					 struct blk_mq_alloc_data *data)
- {
- 	struct elevator_queue *e = q->elevator;
- 	struct request *rq;
- 
- 	blk_queue_enter_live(q);
- 	data->q = q;
- 	if (likely(!data->ctx))
- 		data->ctx = blk_mq_get_ctx(q);
- 	if (likely(!data->hctx))
- 		data->hctx = blk_mq_map_queue(q, data->ctx->cpu);
- 
- 	if (e) {
- 		data->flags |= BLK_MQ_REQ_INTERNAL;
- 
- 		/*
- 		 * Flush requests are special and go directly to the
- 		 * dispatch list.
- 		 */
- 		if (!op_is_flush(op) && e->type->ops.mq.get_request) {
- 			rq = e->type->ops.mq.get_request(q, op, data);
- 			if (rq)
- 				rq->rq_flags |= RQF_QUEUED;
- 		} else
- 			rq = __blk_mq_alloc_request(data, op);
- 	} else {
- 		rq = __blk_mq_alloc_request(data, op);
- 	}
- 
- 	if (rq) {
- 		if (!op_is_flush(op)) {
- 			rq->elv.icq = NULL;
- 			if (e && e->type->icq_cache)
- 				blk_mq_sched_assign_ioc(q, rq, bio);
- 		}
- 		data->hctx->queued++;
- 		return rq;
- 	}
- 
- 	blk_queue_exit(q);
- 	return NULL;
- }
- 
- void blk_mq_sched_put_request(struct request *rq)
- {
- 	struct request_queue *q = rq->q;
- 	struct elevator_queue *e = q->elevator;
- 
- 	if (rq->rq_flags & RQF_ELVPRIV) {
- 		blk_mq_sched_put_rq_priv(rq->q, rq);
- 		if (rq->elv.icq) {
- 			put_io_context(rq->elv.icq->ioc);
- 			rq->elv.icq = NULL;
- 		}
- 	}
- 
- 	if ((rq->rq_flags & RQF_QUEUED) && e && e->type->ops.mq.put_request)
- 		e->type->ops.mq.put_request(rq);
- 	else
- 		blk_mq_finish_request(rq);
- }
- 
  void blk_mq_sched_dispatch_requests(struct blk_mq_hw_ctx *hctx)
  {
  	struct request_queue *q = hctx->queue;
