From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the md tree with the block tree
Date: Mon, 10 Apr 2017 12:08:44 +1000
Message-ID: <20170410120844.77f25779@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50815 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751004AbdDJCIr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Apr 2017 22:08:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shaohua Li <shli@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, NeilBrown <neilb@suse.com>

Hi Shaohua,

Today's linux-next merge of the md tree got a conflict in:

  drivers/md/raid5.c

between commit:

  48920ff2a5a9 ("block: remove the discard_zeroes_data flag")

from the block tree and commit:

  97d53438081e ("Revert "md/raid5: limit request size according to implementation limits"")

from the md tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/md/raid5.c
index 2efdb0d67460,6036d5e41ddd..000000000000
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@@ -7253,17 -7361,13 +7358,9 @@@ static int raid5_run(struct mddev *mdde
  			stripe = (stripe | (stripe-1)) + 1;
  		mddev->queue->limits.discard_alignment = stripe;
  		mddev->queue->limits.discard_granularity = stripe;
 -		/*
 -		 * unaligned part of discard request will be ignored, so can't
 -		 * guarantee discard_zeroes_data
 -		 */
 -		mddev->queue->limits.discard_zeroes_data = 0;
  
- 		/*
- 		 * We use 16-bit counter of active stripes in bi_phys_segments
- 		 * (minus one for over-loaded initialization)
- 		 */
- 		blk_queue_max_hw_sectors(mddev->queue, 0xfffe * STRIPE_SECTORS);
- 		blk_queue_max_discard_sectors(mddev->queue,
- 					      0xfffe * STRIPE_SECTORS);
- 
  		blk_queue_max_write_same_sectors(mddev->queue, 0);
 +		blk_queue_max_write_zeroes_sectors(mddev->queue, 0);
  
  		rdev_for_each(rdev, mddev) {
  			disk_stack_limits(mddev->gendisk, rdev->bdev,
