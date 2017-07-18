From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Date: Tue, 18 Jul 2017 11:39:46 +1000
Message-ID: <20170718113946.47f64522@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34647 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751461AbdGRBjs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 17 Jul 2017 21:39:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Eric Anholt <eric@anholt.net>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/vc4/vc4_crtc.c

between commit:

  1ed134e6526b ("drm/vc4: Fix VBLANK handling in crtc->enable() path")

from the drm-misc-fixes tree and commit:

  0b20a0f8c3cb ("drm: Add old state pointer to CRTC .enable() helper function")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vc4/vc4_crtc.c
index a12cc7ea99b6,9e0c1500375c..000000000000
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@@ -518,37 -519,23 +519,51 @@@ static void vc4_crtc_atomic_disable(str
  	WARN_ON_ONCE((HVS_READ(SCALER_DISPSTATX(chan)) &
  		      (SCALER_DISPSTATX_FULL | SCALER_DISPSTATX_EMPTY)) !=
  		     SCALER_DISPSTATX_EMPTY);
+ 
+ 	/*
+ 	 * Make sure we issue a vblank event after disabling the CRTC if
+ 	 * someone was waiting it.
+ 	 */
+ 	if (crtc->state->event) {
+ 		unsigned long flags;
+ 
+ 		spin_lock_irqsave(&dev->event_lock, flags);
+ 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+ 		crtc->state->event = NULL;
+ 		spin_unlock_irqrestore(&dev->event_lock, flags);
+ 	}
  }
  
 +static void vc4_crtc_update_dlist(struct drm_crtc *crtc)
 +{
 +	struct drm_device *dev = crtc->dev;
 +	struct vc4_dev *vc4 = to_vc4_dev(dev);
 +	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 +	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
 +
 +	if (crtc->state->event) {
 +		unsigned long flags;
 +
 +		crtc->state->event->pipe = drm_crtc_index(crtc);
 +
 +		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 +
 +		spin_lock_irqsave(&dev->event_lock, flags);
 +		vc4_crtc->event = crtc->state->event;
 +		crtc->state->event = NULL;
 +
 +		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
 +			  vc4_state->mm.start);
 +
 +		spin_unlock_irqrestore(&dev->event_lock, flags);
 +	} else {
 +		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
 +			  vc4_state->mm.start);
 +	}
 +}
 +
- static void vc4_crtc_enable(struct drm_crtc *crtc)
+ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
+ 				   struct drm_crtc_state *old_state)
  {
  	struct drm_device *dev = crtc->dev;
  	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@@ -575,20 -556,22 +590,19 @@@
  	/* Turn on the pixel valve, which will emit the vstart signal. */
  	CRTC_WRITE(PV_V_CONTROL,
  		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
 -
 -	/* Enable vblank irq handling after crtc is started. */
 -	drm_crtc_vblank_on(crtc);
  }
  
- static bool vc4_crtc_mode_fixup(struct drm_crtc *crtc,
- 				const struct drm_display_mode *mode,
- 				struct drm_display_mode *adjusted_mode)
+ static enum drm_mode_status vc4_crtc_mode_valid(struct drm_crtc *crtc,
+ 						const struct drm_display_mode *mode)
  {
  	/* Do not allow doublescan modes from user space */
- 	if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN) {
+ 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN) {
  		DRM_DEBUG_KMS("[CRTC:%d] Doublescan mode rejected.\n",
  			      crtc->base.id);
- 		return false;
+ 		return MODE_NO_DBLESCAN;
  	}
  
- 	return true;
+ 	return MODE_OK;
  }
  
  static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
@@@ -650,15 -634,25 +664,15 @@@ static void vc4_crtc_atomic_flush(struc
  
  	WARN_ON_ONCE(dlist_next - dlist_start != vc4_state->mm.size);
  
 -	if (crtc->state->event) {
 -		unsigned long flags;
 -
 -		crtc->state->event->pipe = drm_crtc_index(crtc);
 -
 -		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
 -
 -		spin_lock_irqsave(&dev->event_lock, flags);
 -		vc4_crtc->event = crtc->state->event;
 -		crtc->state->event = NULL;
 -
 -		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
 -			  vc4_state->mm.start);
 -
 -		spin_unlock_irqrestore(&dev->event_lock, flags);
 -	} else {
 -		HVS_WRITE(SCALER_DISPLISTX(vc4_crtc->channel),
 -			  vc4_state->mm.start);
 -	}
 +	/* Only update DISPLIST if the CRTC was already running and is not
 +	 * being disabled.
- 	 * vc4_crtc_enable() takes care of updating the dlist just after
++	 * vc4_crtc_atomic_enable() takes care of updating the dlist just after
 +	 * re-enabling VBLANK interrupts and before enabling the engine.
 +	 * If the CRTC is being disabled, there's no point in updating this
 +	 * information.
 +	 */
 +	if (crtc->state->active && old_state->active)
 +		vc4_crtc_update_dlist(crtc);
  
  	if (debug_dump_regs) {
  		DRM_INFO("CRTC %d HVS after:\n", drm_crtc_index(crtc));
