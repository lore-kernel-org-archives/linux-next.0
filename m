From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the block
 tree
Date: Mon, 7 Dec 2015 19:12:39 +1100
Message-ID: <20151207191239.3c1a1c01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42487 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752967AbbLGIMl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Dec 2015 03:12:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/block_dev.c

between commit:

  6f3b0e8bcf3c ("blk-mq: add a flags parameter to blk_mq_alloc_request")

from the block tree and commit:

  f39b774555f0 ("fs/block_dev.c:bdev_write_page(): use blk_queue_enter(..., GFP_NOIO)")

from the akpm-current tree.

I fixed it up (see below, though I am not sure it is the correct fix?) and
can carry the fix as necessary (no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/block_dev.c
index aa1a45985889,c27362de0039..000000000000
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@@ -432,7 -432,7 +432,7 @@@ int bdev_write_page(struct block_devic
  
  	if (!ops->rw_page || bdev_get_integrity(bdev))
  		return -EOPNOTSUPP;
- 	result = blk_queue_enter(bdev->bd_queue, false);
 -	result = blk_queue_enter(bdev->bd_queue, GFP_NOIO);
++	result = blk_queue_enter(bdev->bd_queue, true);
  	if (result)
  		return result;
  
