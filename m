From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the device-mapper tree with the block
 tree
Date: Thu, 9 Jun 2016 13:59:32 +1000
Message-ID: <20160609135932.39c8ddd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58815 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752400AbcFID7f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jun 2016 23:59:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Today's linux-next merge of the device-mapper tree got a conflict in:

  drivers/md/dm.c

between commit:

  528ec5abe680 ("dm: pass dm stats data dir instead of bi_rw")
  c2df40dfb8c0 ("drivers: use req op accessor")
  3a5e02ced11e ("block, drivers: add REQ_OP_FLUSH operation")

from the block tree and commit:

  50d14ab0130a ("dm: move request-based code out to dm-rq.[hc]")

from the device-mapper tree.

I fixed it up (I used the device-mapper tree version of dm.c and then
applied the following patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Jun 2016 13:47:03 +1000
Subject: [PATCH] dm: fix merge of drivers/dm/dm-rq.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/md/dm-rq.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index dfb0721a87fe..266f7b674108 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -189,9 +189,9 @@ static void rq_end_stats(struct mapped_device *md, struct request *orig)
 	if (unlikely(dm_stats_used(&md->stats))) {
 		struct dm_rq_target_io *tio = tio_from_request(orig);
 		tio->duration_jiffies = jiffies - tio->duration_jiffies;
-		dm_stats_account_io(&md->stats, orig->cmd_flags, blk_rq_pos(orig),
-				    tio->n_sectors, true, tio->duration_jiffies,
-				    &tio->stats_aux);
+		dm_stats_account_io(&md->stats, rq_data_dir(orig),
+				    blk_rq_pos(orig), tio->n_sectors, true,
+				    tio->duration_jiffies, &tio->stats_aux);
 	}
 }
 
@@ -353,7 +353,7 @@ static void dm_done(struct request *clone, int error, bool mapped)
 			r = rq_end_io(tio->ti, clone, error, &tio->info);
 	}
 
-	if (unlikely(r == -EREMOTEIO && (clone->cmd_flags & REQ_WRITE_SAME) &&
+	if (unlikely(r == -EREMOTEIO && (req_op(clone) == REQ_OP_WRITE_SAME) &&
 		     !clone->q->limits.max_write_same_sectors))
 		disable_write_same(tio->md);
 
@@ -681,8 +681,9 @@ static void dm_start_request(struct mapped_device *md, struct request *orig)
 		struct dm_rq_target_io *tio = tio_from_request(orig);
 		tio->duration_jiffies = jiffies;
 		tio->n_sectors = blk_rq_sectors(orig);
-		dm_stats_account_io(&md->stats, orig->cmd_flags, blk_rq_pos(orig),
-				    tio->n_sectors, false, 0, &tio->stats_aux);
+		dm_stats_account_io(&md->stats, rq_data_dir(orig),
+				    blk_rq_pos(orig), tio->n_sectors, false, 0,
+				    &tio->stats_aux);
 	}
 
 	/*
@@ -777,7 +778,7 @@ static void dm_old_request_fn(struct request_queue *q)
 
 		/* always use block 0 to find the target for flushes for now */
 		pos = 0;
-		if (!(rq->cmd_flags & REQ_FLUSH))
+		if (req_op(rq) != REQ_OP_FLUSH)
 			pos = blk_rq_pos(rq);
 
 		if ((dm_old_request_peeked_before_merge_deadline(md) &&
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
