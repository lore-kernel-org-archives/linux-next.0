From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the device-mapper tree
Date: Mon, 15 Dec 2008 11:58:23 +1100
Message-ID: <20081215115823.dc3029d5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37346 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750790AbYLOA6d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Dec 2008 19:58:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Kiyoshi Ueda <k-ueda@ct.jp.nec.com>

Hi Alasdair,

Today's linux-next merge of the device-mapper tree got a conflict in
drivers/md/dm.c between commit 0bfc24559d7945506184d86739fe365a181f06b7
("blktrace: port to tracepoints, update") from the ftrace tree and commit
758cc022ae793c8418fca30ed1e30466efaae37a ("dm-request-add-caches") from
the device-mapper tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/md/dm.c
index 343094c,50a1f10..0000000
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@@ -52,8 -53,27 +54,29 @@@ struct dm_target_io 
  	union map_info info;
  };
  
+ /*
+  * For request-based dm.
+  * One of these is allocated per request.
+  */
+ struct dm_rq_target_io {
+ 	struct mapped_device *md;
+ 	struct dm_target *ti;
+ 	struct request *orig, clone;
+ 	int error;
+ 	union map_info info;
+ };
+ 
+ /*
+  * For request-based dm.
+  * One of these is allocated per bio.
+  */
+ struct dm_rq_clone_bio_info {
+ 	struct bio *orig;
+ 	struct request *rq;
+ };
+ 
 +DEFINE_TRACE(block_bio_complete);
 +
  union map_info *dm_get_mapinfo(struct bio *bio)
  {
  	if (bio && bio->bi_private)
