From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Tue, 8 Nov 2016 14:21:40 +1100
Message-ID: <20161108142140.3232b3b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ming Lei <tom.leiming@gmail.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

Hi Jens,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

block/blk-flush.c: In function 'flush_data_end_io':
block/blk-flush.c:369:20: error: 'REQ_STARTED' undeclared (first use in this function)
  rq->cmd_flags &= ~REQ_STARTED;
                    ^

Caused by commit

  e806402130c9 ("block: split out request-only flags into a new namespace")

interacting with commit

  94d7dea448fa ("block: flush: fix IO hang in case of flood fua req")

from Linus' tree (v4.9-rc3).

I have applied the following merge fix patch for today (I don't know if
this is correct, but it does build):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 8 Nov 2016 14:08:03 +1100
Subject: [PATCH] block: fixup for "split out request-only flags into a new namespace"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 block/blk-flush.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-flush.c b/block/blk-flush.c
index 0a02e765fa14..0bef7432d725 100644
--- a/block/blk-flush.c
+++ b/block/blk-flush.c
@@ -366,7 +366,7 @@ static void flush_data_end_io(struct request *rq, int error)
 	elv_completed_request(q, rq);
 
 	/* for avoiding double accounting */
-	rq->cmd_flags &= ~REQ_STARTED;
+	rq->rq_flags &= ~RQF_STARTED;
 
 	/*
 	 * After populating an empty queue, kick it to avoid stall.  Read
-- 
2.10.2

-- 
Cheers,
Stephen Rothwell
