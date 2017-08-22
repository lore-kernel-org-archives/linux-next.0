From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Tue, 22 Aug 2017 22:09:00 +0530
Message-ID: <20170822163859.GA3053@localhost>
References: <20170822153654.6455c8df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:20479 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751061AbdHVQfj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Aug 2017 12:35:39 -0400
Content-Disposition: inline
In-Reply-To: <20170822153654.6455c8df@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>, Dave Jiang <dave.jiang@intel.com>

On Tue, Aug 22, 2017 at 03:36:54PM +1000, Stephen Rothwell wrote:
> Hi Vinod,
> 
> After merging the slave-dma tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/dma/dmaengine.h:9:0,
>                  from drivers/dma/altera-msgdma.c:27:
> drivers/dma/altera-msgdma.c: In function 'msgdma_probe':
> drivers/dma/altera-msgdma.c:946:14: error: 'DMA_SG' undeclared (first use in this function)
>   dma_cap_set(DMA_SG, dma_dev->cap_mask);
>               ^
> include/linux/dmaengine.h:1197:46: note: in definition of macro 'dma_cap_set'
>  #define dma_cap_set(tx, mask) __dma_cap_set((tx), &(mask))
>                                               ^
> drivers/dma/altera-msgdma.c:946:14: note: each undeclared identifier is reported only once for each function it appears in
>   dma_cap_set(DMA_SG, dma_dev->cap_mask);
>               ^
> include/linux/dmaengine.h:1197:46: note: in definition of macro 'dma_cap_set'
>  #define dma_cap_set(tx, mask) __dma_cap_set((tx), &(mask))
>                                               ^
> drivers/dma/altera-msgdma.c:965:9: error: 'struct dma_device' has no member named 'device_prep_dma_sg'
>   dma_dev->device_prep_dma_sg = msgdma_prep_sg;
>          ^
> 
> Caused by commit
> 
>   a85c6f1b2921 ("dmaengine: Add driver for Altera / Intel mSGDMA IP core")
> 
> interacting with commit
> 
>   c678fa66341c ("dmaengine: remove DMA_SG as it is dead code in kernel")
> 
> This should have been fixed up in the merge commit
> 
>   0a0ab6497093 ("Merge branch 'topic/dmatest' into next")
> 
> I have used the slave-dma tree from next-20170817 for today.

Thanks Stephen for reporting, I have fixed it up by removed DMA_SG from this
driver with belo patch

-- >8 --

From: Vinod Koul <vinod.koul@intel.com>
Date: Tue, 22 Aug 2017 22:03:43 +0530
Subject: [PATCH] dmaengine: altera: remove DMA_SG

Commit c678fa66341c: ("dmaengine: remove DMA_SG as it is dead code in
kernel") removes DMA_SG from dmaengine subsystem but missed the newly added
driver, so remove it from here as well

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Vinod Koul <vinod.koul@intel.com>
---
 drivers/dma/altera-msgdma.c | 94 ---------------------------------------------
 1 file changed, 94 deletions(-)

diff --git a/drivers/dma/altera-msgdma.c b/drivers/dma/altera-msgdma.c
index 33b87b413793..75208b43d137 100644
--- a/drivers/dma/altera-msgdma.c
+++ b/drivers/dma/altera-msgdma.c
@@ -386,98 +386,6 @@ msgdma_prep_memcpy(struct dma_chan *dchan, dma_addr_t dma_dst,
 }
 
 /**
- * msgdma_prep_sg - prepare descriptors for a memory sg transaction
- * @dchan: DMA channel
- * @dst_sg: Destination scatter list
- * @dst_sg_len: Number of entries in destination scatter list
- * @src_sg: Source scatter list
- * @src_sg_len: Number of entries in source scatter list
- * @flags: transfer ack flags
- *
- * Return: Async transaction descriptor on success and NULL on failure
- */
-static struct dma_async_tx_descriptor *
-msgdma_prep_sg(struct dma_chan *dchan, struct scatterlist *dst_sg,
-	       unsigned int dst_sg_len, struct scatterlist *src_sg,
-	       unsigned int src_sg_len, unsigned long flags)
-{
-	struct msgdma_device *mdev = to_mdev(dchan);
-	struct msgdma_sw_desc *new, *first = NULL;
-	void *desc = NULL;
-	size_t len, dst_avail, src_avail;
-	dma_addr_t dma_dst, dma_src;
-	u32 desc_cnt = 0, i;
-	struct scatterlist *sg;
-
-	for_each_sg(src_sg, sg, src_sg_len, i)
-		desc_cnt += DIV_ROUND_UP(sg_dma_len(sg), MSGDMA_MAX_TRANS_LEN);
-
-	spin_lock_bh(&mdev->lock);
-	if (desc_cnt > mdev->desc_free_cnt) {
-		spin_unlock_bh(&mdev->lock);
-		dev_dbg(mdev->dev, "mdev %p descs are not available\n", mdev);
-		return NULL;
-	}
-	mdev->desc_free_cnt -= desc_cnt;
-	spin_unlock_bh(&mdev->lock);
-
-	dst_avail = sg_dma_len(dst_sg);
-	src_avail = sg_dma_len(src_sg);
-
-	/* Run until we are out of scatterlist entries */
-	while (true) {
-		/* Allocate and populate the descriptor */
-		new = msgdma_get_descriptor(mdev);
-
-		desc = &new->hw_desc;
-		len = min_t(size_t, src_avail, dst_avail);
-		len = min_t(size_t, len, MSGDMA_MAX_TRANS_LEN);
-		if (len == 0)
-			goto fetch;
-		dma_dst = sg_dma_address(dst_sg) + sg_dma_len(dst_sg) -
-			dst_avail;
-		dma_src = sg_dma_address(src_sg) + sg_dma_len(src_sg) -
-			src_avail;
-
-		msgdma_desc_config(desc, dma_dst, dma_src, len,
-				   MSGDMA_DESC_STRIDE_RW);
-		dst_avail -= len;
-		src_avail -= len;
-
-		if (!first)
-			first = new;
-		else
-			list_add_tail(&new->node, &first->tx_list);
-fetch:
-		/* Fetch the next dst scatterlist entry */
-		if (dst_avail == 0) {
-			if (dst_sg_len == 0)
-				break;
-			dst_sg = sg_next(dst_sg);
-			if (dst_sg == NULL)
-				break;
-			dst_sg_len--;
-			dst_avail = sg_dma_len(dst_sg);
-		}
-		/* Fetch the next src scatterlist entry */
-		if (src_avail == 0) {
-			if (src_sg_len == 0)
-				break;
-			src_sg = sg_next(src_sg);
-			if (src_sg == NULL)
-				break;
-			src_sg_len--;
-			src_avail = sg_dma_len(src_sg);
-		}
-	}
-
-	msgdma_desc_config_eod(desc);
-	first->async_tx.flags = flags;
-
-	return &first->async_tx;
-}
-
-/**
  * msgdma_prep_slave_sg - prepare descriptors for a slave sg transaction
  *
  * @dchan: DMA channel
@@ -943,7 +851,6 @@ static int msgdma_probe(struct platform_device *pdev)
 	/* Set DMA capabilities */
 	dma_cap_zero(dma_dev->cap_mask);
 	dma_cap_set(DMA_MEMCPY, dma_dev->cap_mask);
-	dma_cap_set(DMA_SG, dma_dev->cap_mask);
 	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
 
 	dma_dev->src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
@@ -962,7 +869,6 @@ static int msgdma_probe(struct platform_device *pdev)
 
 	dma_dev->copy_align = DMAENGINE_ALIGN_4_BYTES;
 	dma_dev->device_prep_dma_memcpy = msgdma_prep_memcpy;
-	dma_dev->device_prep_dma_sg = msgdma_prep_sg;
 	dma_dev->device_prep_slave_sg = msgdma_prep_slave_sg;
 	dma_dev->device_config = msgdma_dma_config;
 
-- 
2.7.4

-- 
~Vinod
