From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Mon, 5 Sep 2016 13:51:21 +1000
Message-ID: <20160905135121.0a64586a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750895AbcIEDvY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 4 Sep 2016 23:51:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@amd.com>, Alex Deucher <alexander.deucher@amd.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/drm_crtc.c

between commit:

  6f00975c6190 ("drm: Reject page_flip for !DRIVER_MODESET")

from Linus' tree and commit:

  f837297ad824 ("drm: Add DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE/RELATIVE flags v2")

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

diff --cc drivers/gpu/drm/drm_crtc.c
index ddebe54cd5ca,a33dab27bb0d..000000000000
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@@ -5402,13 -1915,19 +1915,22 @@@ int drm_mode_page_flip_ioctl(struct drm
  	struct drm_crtc *crtc;
  	struct drm_framebuffer *fb = NULL;
  	struct drm_pending_vblank_event *e = NULL;
+ 	u32 target_vblank = page_flip->sequence;
  	int ret = -EINVAL;
  
 +	if (!drm_core_check_feature(dev, DRIVER_MODESET))
 +		return -EINVAL;
 +
- 	if (page_flip->flags & ~DRM_MODE_PAGE_FLIP_FLAGS ||
- 	    page_flip->reserved != 0)
+ 	if (page_flip->flags & ~DRM_MODE_PAGE_FLIP_FLAGS)
+ 		return -EINVAL;
+ 
+ 	if (page_flip->sequence != 0 && !(page_flip->flags & DRM_MODE_PAGE_FLIP_TARGET))
+ 		return -EINVAL;
+ 
+ 	/* Only one of the DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE/RELATIVE flags
+ 	 * can be specified
+ 	 */
+ 	if ((page_flip->flags & DRM_MODE_PAGE_FLIP_TARGET) == DRM_MODE_PAGE_FLIP_TARGET)
  		return -EINVAL;
  
  	if ((page_flip->flags & DRM_MODE_PAGE_FLIP_ASYNC) && !dev->mode_config.async_page_flip)
