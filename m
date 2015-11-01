From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Mon, 2 Nov 2015 02:51:25 +1100
Message-ID: <20151102025125.0f335513@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>, Dan Williams <dan.j.williams@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  block/blk-mq.c

between commit:

  3ef28e83ab15 ("block: generic request_queue reference counting")

from the block tree and commit:

  7cc8e61bde7a ("mm, page_alloc: distinguish between being unable to sleep, unwilling to sleep and avoiding waking kswapd")
  415a13cc1c3c ("mm, page_alloc: rename __GFP_WAIT to __GFP_RECLAIM")

from the akpm-current tree.

I fixed it up (the code updated in the latter was moved by the former,
so I applied the following merge fix patch) and can carry the fix as
necessary (no action is required).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 2 Nov 2015 02:49:02 +1100
Subject: [PATCH] block: fixes for __GPF_WAIT changes

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 block/blk-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 9e32f0868e36..6f2c263f478b 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -638,7 +638,7 @@ int blk_queue_enter(struct request_queue *q, gfp_t gfp)
 		if (percpu_ref_tryget_live(&q->q_usage_counter))
 			return 0;
 
-		if (!(gfp & __GFP_WAIT))
+		if (!gfpflags_allow_blocking(gfp))
 			return -EBUSY;
 
 		ret = wait_event_interruptible(q->mq_freeze_wq,
@@ -2038,7 +2038,7 @@ void generic_make_request(struct bio *bio)
 	do {
 		struct request_queue *q = bdev_get_queue(bio->bi_bdev);
 
-		if (likely(blk_queue_enter(q, __GFP_WAIT) == 0)) {
+		if (likely(blk_queue_enter(q, __GFP_RECLAIM) == 0)) {
 
 			q->make_request_fn(q, bio);
 
-- 
2.6.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
