From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Fri, 7 Nov 2008 17:10:05 +1100
Message-ID: <20081107171005.31e2a08d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47442 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751124AbYKGGKU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 01:10:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
block/elevator.c between commit 2920ebbd65f3e80c318adf5191ac0987142bda80
("block: add timer on blkdev_dequeue_request() not elv_next_request()")
from Linus' tree and commit 8b3806453dd25d15a7ca7d537124af14ba8546bc
("blktrace: port to tracepoints") from the block tree.

Just a context change.  I fixed it up (see below) and assume it will be
fixed in your tree soon.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc block/elevator.c
index 9ac82dd,e09183b..0000000
--- a/block/elevator.c
+++ b/block/elevator.c
@@@ -772,7 -787,13 +787,7 @@@ struct request *elv_next_request(struc
  			 * not be passed by new incoming requests
  			 */
  			rq->cmd_flags |= REQ_STARTED;
- 			blk_add_trace_rq(q, rq, BLK_TA_ISSUE);
+ 			trace_block_rq_issue(q, rq);
 -
 -			/*
 -			 * We are now handing the request to the hardware,
 -			 * add the timeout handler
 -			 */
 -			blk_add_timer(rq);
  		}
  
  		if (!q->boundary_rq || q->boundary_rq == rq) {
