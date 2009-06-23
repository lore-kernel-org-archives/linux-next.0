From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] Re: linux-next: origin tree build warning
Date: Mon, 22 Jun 2009 23:10:17 -0700
Message-ID: <adatz27pjjq.fsf@cisco.com>
References: <20090622110113.7cd89382.sfr@canb.auug.org.au>
	<20090622121054K.fujita.tomonori@lab.ntt.co.jp>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <general-bounces@lists.openfabrics.org>
In-Reply-To: <20090622121054K.fujita.tomonori@lab.ntt.co.jp> (FUJITA
	Tomonori's message of "Mon, 22 Jun 2009 12:11:12 +0900")
List-Unsubscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=unsubscribe>
List-Archive: <http://lists.openfabrics.org/pipermail/general>
List-Post: <mailto:general@lists.openfabrics.org>
List-Help: <mailto:general-request@lists.openfabrics.org?subject=help>
List-Subscribe: <http://lists.openfabrics.org/cgi-bin/mailman/listinfo/general>,
	<mailto:general-request@lists.openfabrics.org?subject=subscribe>
Sender: general-bounces@lists.openfabrics.org
Errors-To: general-bounces@lists.openfabrics.org
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, general@lists.openfabrics.org
List-Id: linux-next.vger.kernel.org

Thanks, I queued up:

commit 99987bea474ceca8ec6fb05f81d7d188634cdffd
Author: Roland Dreier <rolandd@cisco.com>
Date:   Mon Jun 22 23:04:13 2009 -0700

    IB/mthca: Replace dma_sync_single() use with proper functions
    
    dma_sync_single() is deprecated now, and the use in mthca is wrong:
    there should be a dma_sync_single_for_cpu() before touching the memory
    from the CPU, and a dma_sync_single_for_device() afterwards.  Fix
    this, prompted by a kick in the pants from a patch from FUJITA
    Tomonori <fujita.tomonori@lab.ntt.co.jp>.
    
    Signed-off-by: Roland Dreier <rolandd@cisco.com>

diff --git a/drivers/infiniband/hw/mthca/mthca_mr.c b/drivers/infiniband/hw/mthca/mthca_mr.c
index d606edf..065b208 100644
--- a/drivers/infiniband/hw/mthca/mthca_mr.c
+++ b/drivers/infiniband/hw/mthca/mthca_mr.c
@@ -352,10 +352,14 @@ static void mthca_arbel_write_mtt_seg(struct mthca_dev *dev,
 
 	BUG_ON(!mtts);
 
+	dma_sync_single_for_cpu(&dev->pdev->dev, dma_handle,
+				list_len * sizeof (u64), DMA_TO_DEVICE);
+
 	for (i = 0; i < list_len; ++i)
 		mtts[i] = cpu_to_be64(buffer_list[i] | MTHCA_MTT_FLAG_PRESENT);
 
-	dma_sync_single(&dev->pdev->dev, dma_handle, list_len * sizeof (u64), DMA_TO_DEVICE);
+	dma_sync_single_for_device(&dev->pdev->dev, dma_handle,
+				   list_len * sizeof (u64), DMA_TO_DEVICE);
 }
 
 int mthca_write_mtt(struct mthca_dev *dev, struct mthca_mtt *mtt,
@@ -803,12 +807,15 @@ int mthca_arbel_map_phys_fmr(struct ib_fmr *ibfmr, u64 *page_list,
 
 	wmb();
 
+	dma_sync_single_for_cpu(&dev->pdev->dev, fmr->mem.arbel.dma_handle,
+				list_len * sizeof(u64), DMA_TO_DEVICE);
+
 	for (i = 0; i < list_len; ++i)
 		fmr->mem.arbel.mtts[i] = cpu_to_be64(page_list[i] |
 						     MTHCA_MTT_FLAG_PRESENT);
 
-	dma_sync_single(&dev->pdev->dev, fmr->mem.arbel.dma_handle,
-			list_len * sizeof(u64), DMA_TO_DEVICE);
+	dma_sync_single_for_device(&dev->pdev->dev, fmr->mem.arbel.dma_handle,
+				   list_len * sizeof(u64), DMA_TO_DEVICE);
 
 	fmr->mem.arbel.mpt->key    = cpu_to_be32(key);
 	fmr->mem.arbel.mpt->lkey   = cpu_to_be32(key);
