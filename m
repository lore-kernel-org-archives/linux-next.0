From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] instmem/gk20a: do not use non-portable dma_to_phys()
Date: Tue, 10 Nov 2015 14:10:47 +0900
Message-ID: <1447132247-9767-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6338 "EHLO
	hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750896AbbKJFLD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Nov 2015 00:11:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

dma_to_phys() is not guaranteed to be available on all platforms and
should not be used outside of arch/. Replace it with what it is expected
to do in our case: simply cast the DMA handle to a physical address.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index fc419bb8eab7..49451645a049 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -134,13 +134,17 @@ static void __iomem *
 gk20a_instobj_cpu_map_dma(struct nvkm_memory *memory)
 {
 	struct gk20a_instobj_dma *node = gk20a_instobj_dma(memory);
-	struct device *dev = node->base.imem->base.subdev.device->dev;
 	int npages = nvkm_memory_size(memory) >> 12;
 	struct page *pages[npages];
 	int i;
 
-	/* phys_to_page does not exist on all platforms... */
-	pages[0] = pfn_to_page(dma_to_phys(dev, node->handle) >> PAGE_SHIFT);
+	/*
+	 * Ideally we would have a function to translate a handle to a physical
+	 * address, but there is no portable way of doing this. However since we
+	 * always use the DMA API without an IOMMU, we can assume that handles
+	 * are actual physical addresses.
+	 */
+	pages[0] = pfn_to_page(((phys_addr_t)node->handle) >> PAGE_SHIFT);
 	for (i = 1; i < npages; i++)
 		pages[i] = pages[0] + i;
 
-- 
2.6.2
