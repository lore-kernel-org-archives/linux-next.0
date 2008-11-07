From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree
Date: Fri, 7 Nov 2008 17:14:00 +1100
Message-ID: <20081107171400.697e2896.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41354 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751213AbYKGGOG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 01:14:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
block/blk-timeout.c between commit
7838c15b8dd18e78a523513749e5b54bda07b0cb ("Block: use round_jiffies_up
()") from Linus' tree and commit 514054ea03191f529c6783bc0048e173e5194a27
("block: optimizations in blk_rq_timed_out_timer()") from the block tree.

Just a context change.  I fixed it up (see below) and assume it will be
fixed in your tree shortly.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc block/blk-timeout.c
index 69185ea,151790e..0000000
--- a/block/blk-timeout.c
+++ b/block/blk-timeout.c
@@@ -126,16 -133,19 +126,19 @@@ void blk_rq_timed_out_timer(unsigned lo
  			if (blk_mark_rq_complete(rq))
  				continue;
  			blk_rq_timed_out(rq);
+ 		} else {
+ 			if (!next || time_after(next, rq->deadline))
+ 				next = rq->deadline;
  		}
- 		if (!next_set) {
- 			next = rq->deadline;
- 			next_set = 1;
- 		} else if (time_after(next, rq->deadline))
- 			next = rq->deadline;
  	}
  
- 	if (next_set && !list_empty(&q->timeout_list))
+ 	/*
+ 	 * next can never be 0 here with the list non-empty, since we always
+ 	 * bump ->deadline to 1 so we can detect if the timer was ever added or not.
+ 	 * See comment in blk_add_timer()
+ 	 */
+ 	if (next)
 -		mod_timer(&q->timeout, round_jiffies(next));
 +		mod_timer(&q->timeout, round_jiffies_up(next));
  
  	spin_unlock_irqrestore(q->queue_lock, flags);
  }
