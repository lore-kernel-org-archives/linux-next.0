From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: md tree build failure
Date: Mon, 25 May 2009 15:33:46 +1000
Message-ID: <20090525153346.758483fc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36821 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751015AbZEYFdv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2009 01:33:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, raz ben yehuda <raziebe@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <jens.axboe@oracle.com>

Hi Neil,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/md/raid0.c: In function 'create_strip_zones':
drivers/md/raid0.c:243: error: 'struct request_queue' has no member named 'hardsect_size'

Caused by commit e1defc4ff0cf57aca6c5e3ff99fa503f5943c1f1 ("block: Do
away with the notion of hardsect_size") from the block tree interacting
with commit 131e4477401ae76a9cbe8539e4b7819e04cfba36 ("md: raid0: chunk
size check in raid0_run") from the md tree.

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index b8a0747..0bf275d 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -240,7 +240,7 @@ static int create_strip_zones(mddev_t *mddev)
 	 * now since we have the hard sector sizes, we can make sure
 	 * chunk size is a multiple of that sector size
 	 */
-	if (mddev->chunk_size % mddev->queue->hardsect_size) {
+	if (mddev->chunk_size % queue_logical_block_size(mddev->queue)) {
 		printk(KERN_ERR "%s chunk_size of %d not valid\n",
 		       mdname(mddev),
 		       mddev->chunk_size);
