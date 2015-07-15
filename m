From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Wed, 15 Jul 2015 10:15:05 +1000
Message-ID: <20150715101505.09e6d750@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56950 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751898AbbGOAPI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Jul 2015 20:15:08 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  ccfb8b2ed4d4 ("rm/i915: Do not call intel_crtc_disable if the crtc is already disabled.")

from the drm-intel-fixes tree and commit:

  69024de8ba9e ("drm/i915: get rid of intel_crtc_disable and related code, v3")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_display.c
index 30e0f54ba19d,4e64dae78360..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -4851,25 -4815,13 +4815,16 @@@ static void intel_crtc_disable_planes(s
  {
  	struct drm_device *dev = crtc->dev;
  	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
- 	struct intel_plane *intel_plane;
+ 	struct drm_plane *p;
  	int pipe = intel_crtc->pipe;
  
 +	if (!intel_crtc->active)
 +		return;
 +
- 	intel_crtc_wait_for_pending_flips(crtc);
- 
- 	intel_pre_disable_primary(crtc);
- 
  	intel_crtc_dpms_overlay_disable(intel_crtc);
- 	for_each_intel_plane(dev, intel_plane) {
- 		if (intel_plane->pipe == pipe) {
- 			struct drm_crtc *from = intel_plane->base.crtc;
  
- 			intel_plane->disable_plane(&intel_plane->base,
- 						   from ?: crtc, true);
- 		}
- 	}
+ 	drm_for_each_plane_mask(p, dev, plane_mask)
+ 		to_intel_plane(p)->disable_plane(p, crtc);
  
  	/*
  	 * FIXME: Once we grow proper nuclear flip support out of this we need
@@@ -13380,47 -13823,11 +13829,14 @@@ static void intel_begin_crtc_commit(str
  	struct drm_device *dev = crtc->dev;
  	struct drm_i915_private *dev_priv = dev->dev_private;
  	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
- 	struct intel_plane *intel_plane;
- 	struct drm_plane *p;
- 	unsigned fb_bits = 0;
- 
- 	/* Track fb's for any planes being disabled */
- 	list_for_each_entry(p, &dev->mode_config.plane_list, head) {
- 		intel_plane = to_intel_plane(p);
- 
- 		if (intel_crtc->atomic.disabled_planes &
- 		    (1 << drm_plane_index(p))) {
- 			switch (p->type) {
- 			case DRM_PLANE_TYPE_PRIMARY:
- 				fb_bits = INTEL_FRONTBUFFER_PRIMARY(intel_plane->pipe);
- 				break;
- 			case DRM_PLANE_TYPE_CURSOR:
- 				fb_bits = INTEL_FRONTBUFFER_CURSOR(intel_plane->pipe);
- 				break;
- 			case DRM_PLANE_TYPE_OVERLAY:
- 				fb_bits = INTEL_FRONTBUFFER_SPRITE(intel_plane->pipe);
- 				break;
- 			}
- 
- 			mutex_lock(&dev->struct_mutex);
- 			i915_gem_track_fb(intel_fb_obj(p->fb), NULL, fb_bits);
- 			mutex_unlock(&dev->struct_mutex);
- 		}
- 	}
- 
- 	if (intel_crtc->atomic.wait_for_flips)
- 		intel_crtc_wait_for_pending_flips(crtc);
  
- 	if (intel_crtc->atomic.disable_fbc)
- 		intel_fbc_disable(dev);
+ 	if (!needs_modeset(crtc->state))
+ 		intel_pre_plane_update(intel_crtc);
  
 +	if (intel_crtc->atomic.disable_ips)
 +		hsw_disable_ips(intel_crtc);
 +
- 	if (intel_crtc->atomic.pre_disable_primary)
- 		intel_pre_disable_primary(crtc);
- 
- 	if (intel_crtc->atomic.update_wm)
+ 	if (intel_crtc->atomic.update_wm_pre)
  		intel_update_watermarks(crtc);
  
  	intel_runtime_pm_get(dev_priv);
