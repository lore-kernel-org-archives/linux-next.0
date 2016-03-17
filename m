From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Thu, 17 Mar 2016 11:45:16 +1100
Message-ID: <20160317114516.1af8f0e6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52201 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932684AbcCQApU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Mar 2016 20:45:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Vincent Abriou <vincent.abriou@st.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/sti/sti_hqvdp.c

between commit:

  f6e45661f9be ("dma, mm/pat: Rename dma_*_writecombine() to dma_*_wc()")

from Linus' tree and commit:

  52807ae90e76 ("drm/sti: use u32 to store DMA addresses")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/sti/sti_hqvdp.c
index 1d3c3d029603,d7c1f427811d..000000000000
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@@ -617,9 -852,9 +852,8 @@@ static void sti_hqvdp_init(struct sti_h
  
  	/* Allocate memory for the VDP commands */
  	size = NB_VDP_CMD * sizeof(struct sti_hqvdp_cmd);
- 	hqvdp->hqvdp_cmd = dma_alloc_wc(hqvdp->dev, size,
- 					&hqvdp->hqvdp_cmd_paddr,
 -	hqvdp->hqvdp_cmd = dma_alloc_writecombine(hqvdp->dev, size,
 -					 &dma_addr,
 -					 GFP_KERNEL | GFP_DMA);
++	hqvdp->hqvdp_cmd = dma_alloc_wc(hqvdp->dev, size, &dma_addr,
 +					GFP_KERNEL | GFP_DMA);
  	if (!hqvdp->hqvdp_cmd) {
  		DRM_ERROR("Failed to allocate memory for VDP cmd\n");
  		return;
