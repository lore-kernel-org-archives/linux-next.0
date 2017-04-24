From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nvdimm tree with the block tree
Date: Mon, 24 Apr 2017 15:45:10 +1000
Message-ID: <20170424154510.5868fabf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41755 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932882AbdDXFpM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 24 Apr 2017 01:45:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

Hi Dan,

Today's linux-next merge of the nvdimm tree got a conflict in:

  drivers/block/brd.c

between commit:

  f09a06a193d9 ("brd: remove discard support")

from the block tree and commit:

  1647b9b959c7 ("brd: add dax_operations support")

from the nvdimm tree.

Dan, thanks for the example merge, but I am not sure you did it quite
right. I removed the first three '-' lines below, you did not.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/block/brd.c
index 4ec84d504780,bfa4ed2c75ef..000000000000
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@@ -415,9 -478,11 +429,6 @@@ static struct brd_device *brd_alloc(in
  	 *  is harmless)
  	 */
  	blk_queue_physical_block_size(brd->brd_queue, PAGE_SIZE);
- #ifdef CONFIG_BLK_DEV_RAM_DAX
- 	queue_flag_set_unlocked(QUEUE_FLAG_DAX, brd->brd_queue);
- #endif
 -
 -	brd->brd_queue->limits.discard_granularity = PAGE_SIZE;
 -	blk_queue_max_discard_sectors(brd->brd_queue, UINT_MAX);
 -	brd->brd_queue->limits.discard_zeroes_data = 1;
 -	queue_flag_set_unlocked(QUEUE_FLAG_DISCARD, brd->brd_queue);
  	disk = brd->brd_disk = alloc_disk(max_part);
  	if (!disk)
  		goto out_free_queue;
