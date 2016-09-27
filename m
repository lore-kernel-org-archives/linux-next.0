From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-exynos tree with the drm tree
Date: Tue, 27 Sep 2016 11:41:42 +1000
Message-ID: <20160927114142.023119f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44305 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933214AbcI0Blr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Sep 2016 21:41:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Inki Dae <inki.dae@samsung.com>, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Liu Ying <gnuiyl@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>

Hi Inki,

Today's linux-next merge of the drm-exynos tree got a conflict in:

  drivers/gpu/drm/exynos/exynos_drm_drv.c

between commit:

  2b58e98d42af ("drm/atomic-helper: Add NO_DISABLE_AFTER_MODESET flag support for plane commit")

from the drm tree and commit:

  3a87f9383457 ("drm/exynos: fix pending update handling")

from the drm-exynos tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/exynos/exynos_drm_drv.c
index 486943e70f70,a1bc13f4f30a..000000000000
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@@ -89,25 -63,9 +63,9 @@@ static void exynos_atomic_commit_comple
  	 * have the relevant clocks enabled to perform the update.
  	 */
  
- 	for_each_crtc_in_state(state, crtc, crtc_state, i) {
- 		struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
- 
- 		atomic_set(&exynos_crtc->pending_update, 0);
- 	}
- 
- 	for_each_plane_in_state(state, plane, plane_state, i) {
- 		struct exynos_drm_crtc *exynos_crtc =
- 						to_exynos_crtc(plane->crtc);
- 
- 		if (!plane->crtc)
- 			continue;
- 
- 		atomic_inc(&exynos_crtc->pending_update);
- 	}
- 
 -	drm_atomic_helper_commit_planes(dev, state, false);
 +	drm_atomic_helper_commit_planes(dev, state, 0);
  
- 	exynos_atomic_wait_for_commit(state);
+ 	drm_atomic_helper_wait_for_vblanks(dev, state);
  
  	drm_atomic_helper_cleanup_planes(dev, state);
  
