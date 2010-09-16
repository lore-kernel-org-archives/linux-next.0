From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Thu, 16 Sep 2010 12:04:49 +1000
Message-ID: <20100916120449.3d4f2c5f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
block/blk-core.c between commit 5e00d1b5b4c10fb839afd5ce61db8e24339454b0
("BLOCK: fix bio.bi_rw handling") from Linus' tree (v2.6.36-rc4) and
commit 28e7d1845216538303bb95d679d8fd4de50e2f1a ("block: drop barrier
ordering by queue draining") from the block tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc block/blk-core.c
index 32a1c12,4df8e84..0000000
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@@ -1198,13 -1182,15 +1182,15 @@@ static int __make_request(struct reques
  	int el_ret;
  	unsigned int bytes = bio->bi_size;
  	const unsigned short prio = bio_prio(bio);
 -	const bool sync = (bio->bi_rw & REQ_SYNC);
 -	const bool unplug = (bio->bi_rw & REQ_UNPLUG);
 -	const unsigned int ff = bio->bi_rw & REQ_FAILFAST_MASK;
 +	const bool sync = !!(bio->bi_rw & REQ_SYNC);
 +	const bool unplug = !!(bio->bi_rw & REQ_UNPLUG);
 +	const unsigned long ff = bio->bi_rw & REQ_FAILFAST_MASK;
+ 	int where = ELEVATOR_INSERT_SORT;
  	int rw_flags;
  
- 	if ((bio->bi_rw & REQ_HARDBARRIER) &&
- 	    (q->next_ordered == QUEUE_ORDERED_NONE)) {
+ 	/* REQ_HARDBARRIER is no more */
+ 	if (WARN_ONCE(bio->bi_rw & REQ_HARDBARRIER,
+ 		"block: HARDBARRIER is deprecated, use FLUSH/FUA instead\n")) {
  		bio_endio(bio, -EOPNOTSUPP);
  		return 0;
  	}
