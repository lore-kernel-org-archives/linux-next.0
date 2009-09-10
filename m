From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the  tree
Date: Thu, 10 Sep 2009 14:48:01 +1000
Message-ID: <20090910144801.2b604ee7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55582 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750842AbZIJEsG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Sep 2009 00:48:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ed Cashin <ecashin@coraid.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
drivers/block/aoe/aoeblk.c between commit
7135a71b19be1faf48b7148d77844d03bc0717d6 ("aoe: allocate unused
request_queue for sysfs") from Linus' tree and commit
5063fe01e7dc205ebca89877f8eb01d6a5b0ebd6 ("writeback: add name to
backing_dev_info") from the block tree.

I fixed it up (see below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/block/aoe/aoeblk.c
index 1e15889,0efb8fc..0000000
--- a/drivers/block/aoe/aoeblk.c
+++ b/drivers/block/aoe/aoeblk.c
@@@ -264,12 -264,10 +264,13 @@@ aoeblk_gdalloc(void *vp
  		goto err_disk;
  	}
  
 -	blk_queue_make_request(&d->blkq, aoeblk_make_request);
 -	d->blkq.backing_dev_info.name = "aoe";
 -	if (bdi_init(&d->blkq.backing_dev_info))
 +	d->blkq = blk_alloc_queue(GFP_KERNEL);
 +	if (!d->blkq)
  		goto err_mempool;
 +	blk_queue_make_request(d->blkq, aoeblk_make_request);
++	d->blkq->backing_dev_info.name = "aoe";
 +	if (bdi_init(&d->blkq->backing_dev_info))
 +		goto err_blkq;
  	spin_lock_irqsave(&d->lock, flags);
  	gd->major = AOE_MAJOR;
  	gd->first_minor = d->sysminor * AOE_PARTITIONS;
