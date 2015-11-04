From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the drm tree
Date: Wed, 4 Nov 2015 17:12:50 +1100
Message-ID: <20151104171250.1ce066ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49095 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751551AbbKDGMy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Nov 2015 01:12:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in:

  drivers/gpu/drm/nouveau/nouveau_ttm.c

between commits:

  524883bb4846 ("drm/nouveau/ttm: convert to DMA API")
  b31cf78b9324 ("drm/nouveau/ttm: set the DMA mask for platform devices")

from the drm tree and patch:

  "nouveau: don't call pci_dma_supported"

from the akpm tree.

I fixed it up (so the patch now looks like below) and can carry the fix
as necessary (no action is required).

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 3f713c1b5dc1..d2e7d209f651 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -353,8 +353,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 
 	bits = nvxx_mmu(&drm->device)->dma_bits;
 	if (nvxx_device(&drm->device)->func->pci) {
-		if (drm->agp.bridge ||
-		     !dma_supported(dev->dev, DMA_BIT_MASK(bits)))
+		if (drm->agp.bridge)
 			bits = 32;
 	} else if (device->func->tegra) {
 		struct nvkm_device_tegra *tegra = device->func->tegra(device);
@@ -369,6 +368,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 	ret = dma_set_mask(dev->dev, DMA_BIT_MASK(bits));
+	if (ret && bits != 32) {
+		bits = 32;
+		ret = dma_set_mask(dev->dev, DMA_BIT_MASK(bits));
+	}
 	if (ret)
 		return ret;
 

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
