From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 22 Apr 2016 15:18:44 +1000
Message-ID: <20160422151844.4f5da631@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36577 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751697AbcDVFSr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 Apr 2016 01:18:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Manish Chopra <manish.chopra@qlogic.com>, Yuval Mintz <yuval.mintz@qlogic.com>, Tariq Toukan <tariqt@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/ethernet/qlogic/qede/qede_main.c: In function 'qede_fill_frag_skb':
drivers/net/ethernet/qlogic/qede/qede_main.c:961:31: error: 'struct page' has no member named '_count'
   atomic_inc(&current_bd->data->_count);
                               ^
drivers/net/ethernet/qlogic/qede/qede_main.c: In function 'qede_rx_int':
drivers/net/ethernet/qlogic/qede/qede_main.c:1412:33: error: 'struct page' has no member named '_count'
     atomic_inc(&sw_rx_data->data->_count);
                                 ^  
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c: In function 'mlx5e_alloc_rx_fragmented_mpwqe': 
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:297:32: error: 'struct page' has no member named '_count'
       &wi->umr.dma_info[i].page->_count);
                                ^   
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:316:32: error: 'struct page' has no member named '_count'
       &wi->umr.dma_info[i].page->_count);
                                ^   
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c: In function 'mlx5e_free_rx_fragmented_mpwqe':  
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:341:32: error: 'struct page' has no member named '_count'
       &wi->umr.dma_info[i].page->_count);
                                ^   
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c: In function 'mlx5e_alloc_rx_linear_mpwqe':
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:391:28: error: 'struct page' has no member named '_count'
       &wi->dma_info.page[i]._count);
                            ^
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c: In function 'mlx5e_free_rx_linear_mpwqe':
drivers/net/ethernet/mellanox/mlx5/core/en_rx.c:415:28: error: 'struct page' has no member named '_count'
       &wi->dma_info.page[i]._count);
                            ^

Caused by commit

  2dde4bc2820e ("mm: rename _count, field of the struct page, to _refcount")

interacting with commits

  f86af2dfded6 ("qede: Fix various memory allocation error flows for fastpath")

from Linus' tree and

  bc77b240b3c5 ("net/mlx5e: Add fragmented memory support for RX multi packet WQE")

from the net-next tree.

I applied the following patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 22 Apr 2016 15:13:21 +1000
Subject: [PATCH] mm-rename-_count-field-of-the-struct-page-to-_refcount-fix6

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c | 20 ++++++++++----------
 drivers/net/ethernet/qlogic/qede/qede_main.c    |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index 918b7c7fd74f..0543fbc130b6 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -293,8 +293,8 @@ static int mlx5e_alloc_rx_fragmented_mpwqe(struct mlx5e_rq *rq,
 	for (i = 0; i < MLX5_MPWRQ_PAGES_PER_WQE; i++) {
 		if (unlikely(mlx5e_alloc_and_map_page(rq, wi, i)))
 			goto err_unmap;
-		atomic_add(MLX5_MPWRQ_STRIDES_PER_PAGE,
-			   &wi->umr.dma_info[i].page->_count);
+		page_ref_add(wi->umr.dma_info[i].page,
+			     MLX5_MPWRQ_STRIDES_PER_PAGE);
 		wi->skbs_frags[i] = 0;
 	}
 
@@ -312,8 +312,8 @@ err_unmap:
 	while (--i >= 0) {
 		dma_unmap_page(rq->pdev, wi->umr.dma_info[i].addr, PAGE_SIZE,
 			       PCI_DMA_FROMDEVICE);
-		atomic_sub(MLX5_MPWRQ_STRIDES_PER_PAGE,
-			   &wi->umr.dma_info[i].page->_count);
+		page_ref_sub(wi->umr.dma_info[i].page,
+			     MLX5_MPWRQ_STRIDES_PER_PAGE);
 		put_page(wi->umr.dma_info[i].page);
 	}
 	dma_unmap_single(rq->pdev, wi->umr.mtt_addr, mtt_sz, PCI_DMA_TODEVICE);
@@ -337,8 +337,8 @@ void mlx5e_free_rx_fragmented_mpwqe(struct mlx5e_rq *rq,
 	for (i = 0; i < MLX5_MPWRQ_PAGES_PER_WQE; i++) {
 		dma_unmap_page(rq->pdev, wi->umr.dma_info[i].addr, PAGE_SIZE,
 			       PCI_DMA_FROMDEVICE);
-		atomic_sub(MLX5_MPWRQ_STRIDES_PER_PAGE - wi->skbs_frags[i],
-			   &wi->umr.dma_info[i].page->_count);
+		page_ref_sub(wi->umr.dma_info[i].page,
+			     MLX5_MPWRQ_STRIDES_PER_PAGE - wi->skbs_frags[i]);
 		put_page(wi->umr.dma_info[i].page);
 	}
 	dma_unmap_single(rq->pdev, wi->umr.mtt_addr, mtt_sz, PCI_DMA_TODEVICE);
@@ -387,8 +387,8 @@ static int mlx5e_alloc_rx_linear_mpwqe(struct mlx5e_rq *rq,
 	 */
 	split_page(wi->dma_info.page, MLX5_MPWRQ_WQE_PAGE_ORDER);
 	for (i = 0; i < MLX5_MPWRQ_PAGES_PER_WQE; i++) {
-		atomic_add(MLX5_MPWRQ_STRIDES_PER_PAGE,
-			   &wi->dma_info.page[i]._count);
+		page_ref_add(&wi->dma_info.page[i],
+			     MLX5_MPWRQ_STRIDES_PER_PAGE);
 		wi->skbs_frags[i] = 0;
 	}
 
@@ -411,8 +411,8 @@ void mlx5e_free_rx_linear_mpwqe(struct mlx5e_rq *rq,
 	dma_unmap_page(rq->pdev, wi->dma_info.addr, rq->wqe_sz,
 		       PCI_DMA_FROMDEVICE);
 	for (i = 0; i < MLX5_MPWRQ_PAGES_PER_WQE; i++) {
-		atomic_sub(MLX5_MPWRQ_STRIDES_PER_PAGE - wi->skbs_frags[i],
-			   &wi->dma_info.page[i]._count);
+		page_ref_sub(&wi->dma_info.page[i],
+			     MLX5_MPWRQ_STRIDES_PER_PAGE - wi->skbs_frags[i]);
 		put_page(&wi->dma_info.page[i]);
 	}
 }
diff --git a/drivers/net/ethernet/qlogic/qede/qede_main.c b/drivers/net/ethernet/qlogic/qede/qede_main.c
index 66cd9f9bd57b..4eaa74f68883 100644
--- a/drivers/net/ethernet/qlogic/qede/qede_main.c
+++ b/drivers/net/ethernet/qlogic/qede/qede_main.c
@@ -958,7 +958,7 @@ static int qede_fill_frag_skb(struct qede_dev *edev,
 		/* Incr page ref count to reuse on allocation failure
 		 * so that it doesn't get freed while freeing SKB.
 		 */
-		atomic_inc(&current_bd->data->_count);
+		page_ref_inc(current_bd->data);
 		goto out;
 	}
 
@@ -1409,7 +1409,7 @@ static int qede_rx_int(struct qede_fastpath *fp, int budget)
 				 * freeing SKB.
 				 */
 
-				atomic_inc(&sw_rx_data->data->_count);
+				page_ref_inc(sw_rx_data->data);
 				rxq->rx_alloc_errors++;
 				qede_recycle_rx_bd_ring(rxq, edev,
 							fp_cqe->bd_num);
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
