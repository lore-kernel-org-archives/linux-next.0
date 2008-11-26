From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: [PATCH] Blktrace : conversion to tracepoint define
Date: Wed, 26 Nov 2008 06:06:31 -0500
Message-ID: <20081126110631.GD14826@Krystal>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from toq4-srv.bellnexxia.net ([209.226.175.24]:35765 "EHLO
	toq4-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752351AbYKZMVQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2008 07:21:16 -0500
Received: from toip6.srvr.bell.ca ([209.226.175.125])
          by tomts43-srv.bellnexxia.net
          (InterMail vM.5.01.06.13 201-253-122-130-113-20050324) with ESMTP
          id <20081126110632.MOYS1582.tomts43-srv.bellnexxia.net@toip6.srvr.bell.ca>
          for <linux-next@vger.kernel.org>; Wed, 26 Nov 2008 06:06:32 -0500
Content-Disposition: inline
In-Reply-To: <20081126104700.GI26308@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>, Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

Here is the conversion to the new tracepoint API, which applies to -tip
after the patch you just emailed.

Mathieu


Blktrace : conversion to tracepoint define

Adapt declaration/definitions of blktrace tracepoints to the new tracepoint API.

Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>
CC: 'Ingo Molnar' <mingo@elte.hu>
CC: Jens Axboe <jens.axboe@oracle.com>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>
---
 block/blk-core.c      |   13 +++++++++++++
 block/elevator.c      |    3 +++
 drivers/md/dm.c       |    2 ++
 fs/bio.c              |    2 ++
 include/trace/block.h |   34 +++++++++++++++++-----------------
 mm/bounce.c           |    2 ++
 6 files changed, 39 insertions(+), 17 deletions(-)

Index: linux.trees.git/mm/bounce.c
===================================================================
--- linux.trees.git.orig/mm/bounce.c	2008-11-26 05:49:40.000000000 -0500
+++ linux.trees.git/mm/bounce.c	2008-11-26 05:50:08.000000000 -0500
@@ -22,6 +22,8 @@
 
 static mempool_t *page_pool, *isa_page_pool;
 
+DEFINE_TRACE(block_bio_bounce);
+
 #ifdef CONFIG_HIGHMEM
 static __init int init_emergency_pool(void)
 {
Index: linux.trees.git/fs/bio.c
===================================================================
--- linux.trees.git.orig/fs/bio.c	2008-11-26 05:49:40.000000000 -0500
+++ linux.trees.git/fs/bio.c	2008-11-26 05:50:25.000000000 -0500
@@ -29,6 +29,8 @@
 #include <trace/block.h>
 #include <scsi/sg.h>		/* for struct sg_iovec */
 
+DEFINE_TRACE(block_split);
+
 static struct kmem_cache *bio_slab __read_mostly;
 
 static mempool_t *bio_split_pool __read_mostly;
Index: linux.trees.git/drivers/md/dm.c
===================================================================
--- linux.trees.git.orig/drivers/md/dm.c	2008-11-26 05:49:40.000000000 -0500
+++ linux.trees.git/drivers/md/dm.c	2008-11-26 05:50:08.000000000 -0500
@@ -52,6 +52,8 @@ struct dm_target_io {
 	union map_info info;
 };
 
+DEFINE_TRACE(block_bio_complete);
+
 union map_info *dm_get_mapinfo(struct bio *bio)
 {
 	if (bio && bio->bi_private)
Index: linux.trees.git/block/blk-core.c
===================================================================
--- linux.trees.git.orig/block/blk-core.c	2008-11-26 05:49:40.000000000 -0500
+++ linux.trees.git/block/blk-core.c	2008-11-26 05:50:08.000000000 -0500
@@ -32,6 +32,19 @@
 
 #include "blk.h"
 
+DEFINE_TRACE(block_plug);
+DEFINE_TRACE(block_unplug_io);
+DEFINE_TRACE(block_unplug_timer);
+DEFINE_TRACE(block_getrq);
+DEFINE_TRACE(block_sleeprq);
+DEFINE_TRACE(block_rq_requeue);
+DEFINE_TRACE(block_bio_backmerge);
+DEFINE_TRACE(block_bio_frontmerge);
+DEFINE_TRACE(block_bio_queue);
+DEFINE_TRACE(block_rq_complete);
+DEFINE_TRACE(block_remap);	/* Also used in drivers/md/dm.c */
+EXPORT_TRACEPOINT_SYMBOL_GPL(block_remap);
+
 static int __make_request(struct request_queue *q, struct bio *bio);
 
 /*
Index: linux.trees.git/block/elevator.c
===================================================================
--- linux.trees.git.orig/block/elevator.c	2008-11-26 05:49:40.000000000 -0500
+++ linux.trees.git/block/elevator.c	2008-11-26 05:50:08.000000000 -0500
@@ -53,6 +53,9 @@ static const int elv_hash_shift = 6;
 #define rq_hash_key(rq)		((rq)->sector + (rq)->nr_sectors)
 #define ELV_ON_HASH(rq)		(!hlist_unhashed(&(rq)->hash))
 
+DEFINE_TRACE(block_rq_insert);
+DEFINE_TRACE(block_rq_issue);
+
 /*
  * Query io scheduler to see if the current process issuing bio may be
  * merged with rq.
Index: linux.trees.git/include/trace/block.h
===================================================================
--- linux.trees.git.orig/include/trace/block.h	2008-11-26 05:50:35.000000000 -0500
+++ linux.trees.git/include/trace/block.h	2008-11-26 05:51:09.000000000 -0500
@@ -4,55 +4,55 @@
 #include <linux/blkdev.h>
 #include <linux/tracepoint.h>
 
-DEFINE_TRACE(block_rq_abort,
+DECLARE_TRACE(block_rq_abort,
 	TPPROTO(struct request_queue *q, struct request *rq),
 	TPARGS(q, rq));
-DEFINE_TRACE(block_rq_insert,
+DECLARE_TRACE(block_rq_insert,
 	TPPROTO(struct request_queue *q, struct request *rq),
 	TPARGS(q, rq));
-DEFINE_TRACE(block_rq_issue,
+DECLARE_TRACE(block_rq_issue,
 	TPPROTO(struct request_queue *q, struct request *rq),
 	TPARGS(q, rq));
-DEFINE_TRACE(block_rq_requeue,
+DECLARE_TRACE(block_rq_requeue,
 	TPPROTO(struct request_queue *q, struct request *rq),
 	TPARGS(q, rq));
-DEFINE_TRACE(block_rq_complete,
+DECLARE_TRACE(block_rq_complete,
 	TPPROTO(struct request_queue *q, struct request *rq),
 	TPARGS(q, rq));
-DEFINE_TRACE(block_bio_bounce,
+DECLARE_TRACE(block_bio_bounce,
 	TPPROTO(struct request_queue *q, struct bio *bio),
 	TPARGS(q, bio));
-DEFINE_TRACE(block_bio_complete,
+DECLARE_TRACE(block_bio_complete,
 	TPPROTO(struct request_queue *q, struct bio *bio),
 	TPARGS(q, bio));
-DEFINE_TRACE(block_bio_backmerge,
+DECLARE_TRACE(block_bio_backmerge,
 	TPPROTO(struct request_queue *q, struct bio *bio),
 	TPARGS(q, bio));
-DEFINE_TRACE(block_bio_frontmerge,
+DECLARE_TRACE(block_bio_frontmerge,
 	TPPROTO(struct request_queue *q, struct bio *bio),
 	TPARGS(q, bio));
-DEFINE_TRACE(block_bio_queue,
+DECLARE_TRACE(block_bio_queue,
 	TPPROTO(struct request_queue *q, struct bio *bio),
 	TPARGS(q, bio));
-DEFINE_TRACE(block_getrq,
+DECLARE_TRACE(block_getrq,
 	TPPROTO(struct request_queue *q, struct bio *bio, int rw),
 	TPARGS(q, bio, rw));
-DEFINE_TRACE(block_sleeprq,
+DECLARE_TRACE(block_sleeprq,
 	TPPROTO(struct request_queue *q, struct bio *bio, int rw),
 	TPARGS(q, bio, rw));
-DEFINE_TRACE(block_plug,
+DECLARE_TRACE(block_plug,
 	TPPROTO(struct request_queue *q),
 	TPARGS(q));
-DEFINE_TRACE(block_unplug_timer,
+DECLARE_TRACE(block_unplug_timer,
 	TPPROTO(struct request_queue *q),
 	TPARGS(q));
-DEFINE_TRACE(block_unplug_io,
+DECLARE_TRACE(block_unplug_io,
 	TPPROTO(struct request_queue *q),
 	TPARGS(q));
-DEFINE_TRACE(block_split,
+DECLARE_TRACE(block_split,
 	TPPROTO(struct request_queue *q, struct bio *bio, unsigned int pdu),
 	TPARGS(q, bio, pdu));
-DEFINE_TRACE(block_remap,
+DECLARE_TRACE(block_remap,
 	TPPROTO(struct request_queue *q, struct bio *bio, dev_t dev,
 		sector_t from, sector_t to),
 	TPARGS(q, bio, dev, from, to));

-- 
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
