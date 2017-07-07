From: Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
Subject: [PATCH v2 1/2] drivers: dma-coherent: Fix dev->cma_area vs dev->dma_mem breakage
Date: Fri, 7 Jul 2017 16:22:59 +0300
Message-ID: <1499433779-16437-1-git-send-email-vitaly_kuzmichev@mentor.com>
References: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:41346 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752455AbdGGNXK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 7 Jul 2017 09:23:10 -0400
In-Reply-To: <1499433759-16397-1-git-send-email-vitaly_kuzmichev@mentor.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@linuxfoundation.org
Cc: hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "George G. Davis" <george_davis@mentor.com>

From: "George G. Davis" <george_davis@mentor.com>

When a "linux,dma-default" DMA coherent region is defined, the
dma_coherent_default_memory pointer is returned by function
dev_get_coherent_memory() for any struct device *dev which has not
explicitly assigned a dev->dma_mem memory region, i.e. dev->dma_mem is
the NULL pointer. Unfortunately this overlooks the fact that for the
CONFIG_DMA_CMA case, it is also possible that a device may have assigned
a CMA memory region via the dev->cma_area pointer in which case,
the "linux,dma-default" DMA coherent region should not be used.
Since the current code did not consider this case, dev->cma_area regions
are not used when a "linux,dma-default" DMA coherent region is defined.
Instead, memory is allocated from the "linux,dma-default" DMA coherent
region.  This omission could lead to DMA memory allocation failures for
devices such as the "viv,galcore" which require a large contiguous
address space which cannot be supplied by the "linux,dma-default" region
IFF it has been reconfigured to use a CMA memory region. Similar DMA
allocation failures are likely to occur for other devices which require
large memory regions and/or overall allocation requests exceed the size
of the "linux,dma-default" DMA coherent region size.

Fix this by updating the dev_get_coherent_memory() function to return
the NULL pointer if a dev->cma_area region is assigned to a device.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Vitaly Kuzmichev <vitaly_kuzmichev@mentor.com>
---
 drivers/base/dma-coherent.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/base/dma-coherent.c b/drivers/base/dma-coherent.c
index 2ae24c2..acfe140 100644
--- a/drivers/base/dma-coherent.c
+++ b/drivers/base/dma-coherent.c
@@ -25,6 +25,10 @@ static inline struct dma_coherent_mem *dev_get_coherent_memory(struct device *de
 {
 	if (dev && dev->dma_mem)
 		return dev->dma_mem;
+#ifdef CONFIG_DMA_CMA
+	if (dev && dev->cma_area)
+		return NULL;
+#endif
 	return dma_coherent_default_memory;
 }
 
-- 
1.9.1
