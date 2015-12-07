From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 7 Dec 2015 14:38:34 +1100
Message-ID: <20151207143834.366ea1bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37690 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755165AbbLGDig (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 6 Dec 2015 22:38:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Markus Elfring <elfring@users.sourceforge.net>, Philipp Zabel <p.zabel@pengutronix.de>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/imx/imx-drm-core.c

between commit:

  3f3a7280d4ca ("GPU-DRM-IMX: Delete an unnecessary check before drm_fbdev_cma_restore_mode()")

from Linus' tree and commit:

  c1ff5a7aa3c3 ("drm/imx: Remove local fbdev emulation Kconfig option")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/imx/imx-drm-core.c
index 7b990b4e96d2,6faa735376ec..000000000000
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@@ -60,11 -62,10 +62,9 @@@ EXPORT_SYMBOL_GPL(imx_drm_crtc_id)
  
  static void imx_drm_driver_lastclose(struct drm_device *drm)
  {
- #if IS_ENABLED(CONFIG_DRM_IMX_FB_HELPER)
  	struct imx_drm_device *imxdrm = drm->dev_private;
  
 -	if (imxdrm->fbhelper)
 -		drm_fbdev_cma_restore_mode(imxdrm->fbhelper);
 +	drm_fbdev_cma_restore_mode(imxdrm->fbhelper);
- #endif
  }
  
  static int imx_drm_driver_unload(struct drm_device *drm)
