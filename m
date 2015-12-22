From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Wed, 23 Dec 2015 10:06:15 +1100
Message-ID: <20151223100615.7d8ec791@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54257 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932072AbbLVXGQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Dec 2015 18:06:16 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Ville =?UTF-8?B?U3lyasOk?= =?UTF-8?B?bMOk?= <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  57a2af6bbc7a ("drm/i915: Kill intel_crtc->cursor_bo")

from the drm-intel-fixes tree and commit:

  6285262259ca ("drm/i915: Only run commit when crtc is active, v2.")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_display.c
index beb0374a19f1,bda6b9c82e66..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -6322,13 -6351,12 +6366,14 @@@ static void intel_crtc_disable_noatomic
  		return;
  
  	if (to_intel_plane_state(crtc->primary->state)->visible) {
- 		intel_crtc_wait_for_pending_flips(crtc);
+ 		WARN_ON(intel_crtc->unpin_work);
+ 
  		intel_pre_disable_primary(crtc);
 +
 +		intel_crtc_disable_planes(crtc, 1 << drm_plane_index(crtc->primary));
 +		to_intel_plane_state(crtc->primary->state)->visible = false;
  	}
  
 -	intel_crtc_disable_planes(crtc, crtc->state->plane_mask);
  	dev_priv->display.crtc_disable(crtc);
  	intel_crtc->active = false;
  	intel_update_watermarks(crtc);
@@@ -13809,9 -14051,10 +14077,8 @@@ intel_commit_cursor_plane(struct drm_pl
  		addr = obj->phys_handle->busaddr;
  
  	intel_crtc->cursor_addr = addr;
 -	intel_crtc->cursor_bo = obj;
  
- 	if (crtc->state->active)
- 		intel_crtc_update_cursor(crtc, state->visible);
 -update:
+ 	intel_crtc_update_cursor(crtc, state->visible);
  }
  
  static struct drm_plane *intel_cursor_plane_create(struct drm_device *dev,
