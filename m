From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 23 May 2017 12:00:32 +1000
Message-ID: <20170523120032.3cedbaa8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42763 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965304AbdEWCAf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 May 2017 22:00:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@collabora.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commits:

  1cecc830e6b6 ("drm/i915: Refactor CURBASE calculation")
  024faac7d59b ("drm/i915: Support variable cursor height on ivb+")

from the drm-intel tree and commit:

  c2c446ad2943 ("drm: Add DRM_MODE_ROTATE_ and DRM_MODE_REFLECT_ to UAPI")

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

diff --cc drivers/gpu/drm/i915/intel_display.c
index 8217ed0e7132,6a037b856d96..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -9144,102 -9138,6 +9144,102 @@@ out
  	return active;
  }
  
 +static u32 intel_cursor_base(const struct intel_plane_state *plane_state)
 +{
 +	struct drm_i915_private *dev_priv =
 +		to_i915(plane_state->base.plane->dev);
 +	const struct drm_framebuffer *fb = plane_state->base.fb;
 +	const struct drm_i915_gem_object *obj = intel_fb_obj(fb);
 +	u32 base;
 +
 +	if (INTEL_INFO(dev_priv)->cursor_needs_physical)
 +		base = obj->phys_handle->busaddr;
 +	else
 +		base = intel_plane_ggtt_offset(plane_state);
 +
 +	base += plane_state->main.offset;
 +
 +	/* ILK+ do this automagically */
 +	if (HAS_GMCH_DISPLAY(dev_priv) &&
- 	    plane_state->base.rotation & DRM_ROTATE_180)
++	    plane_state->base.rotation & DRM_MODE_ROTATE_180)
 +		base += (plane_state->base.crtc_h *
 +			 plane_state->base.crtc_w - 1) * fb->format->cpp[0];
 +
 +	return base;
 +}
 +
 +static u32 intel_cursor_position(const struct intel_plane_state *plane_state)
 +{
 +	int x = plane_state->base.crtc_x;
 +	int y = plane_state->base.crtc_y;
 +	u32 pos = 0;
 +
 +	if (x < 0) {
 +		pos |= CURSOR_POS_SIGN << CURSOR_X_SHIFT;
 +		x = -x;
 +	}
 +	pos |= x << CURSOR_X_SHIFT;
 +
 +	if (y < 0) {
 +		pos |= CURSOR_POS_SIGN << CURSOR_Y_SHIFT;
 +		y = -y;
 +	}
 +	pos |= y << CURSOR_Y_SHIFT;
 +
 +	return pos;
 +}
 +
 +static bool intel_cursor_size_ok(const struct intel_plane_state *plane_state)
 +{
 +	const struct drm_mode_config *config =
 +		&plane_state->base.plane->dev->mode_config;
 +	int width = plane_state->base.crtc_w;
 +	int height = plane_state->base.crtc_h;
 +
 +	return width > 0 && width <= config->cursor_width &&
 +		height > 0 && height <= config->cursor_height;
 +}
 +
 +static int intel_check_cursor(struct intel_crtc_state *crtc_state,
 +			      struct intel_plane_state *plane_state)
 +{
 +	const struct drm_framebuffer *fb = plane_state->base.fb;
 +	int src_x, src_y;
 +	u32 offset;
 +	int ret;
 +
 +	ret = drm_plane_helper_check_state(&plane_state->base,
 +					   &plane_state->clip,
 +					   DRM_PLANE_HELPER_NO_SCALING,
 +					   DRM_PLANE_HELPER_NO_SCALING,
 +					   true, true);
 +	if (ret)
 +		return ret;
 +
 +	if (!fb)
 +		return 0;
 +
 +	if (fb->modifier != DRM_FORMAT_MOD_LINEAR) {
 +		DRM_DEBUG_KMS("cursor cannot be tiled\n");
 +		return -EINVAL;
 +	}
 +
 +	src_x = plane_state->base.src_x >> 16;
 +	src_y = plane_state->base.src_y >> 16;
 +
 +	intel_add_fb_offsets(&src_x, &src_y, plane_state, 0);
 +	offset = intel_compute_tile_offset(&src_x, &src_y, plane_state, 0);
 +
 +	if (src_x != 0 || src_y != 0) {
 +		DRM_DEBUG_KMS("Arbitrary cursor panning not supported\n");
 +		return -EINVAL;
 +	}
 +
 +	plane_state->main.offset = offset;
 +
 +	return 0;
 +}
 +
  static u32 i845_cursor_ctl(const struct intel_crtc_state *crtc_state,
  			   const struct intel_plane_state *plane_state)
  {
@@@ -9389,154 -9245,116 +9389,154 @@@ static u32 i9xx_cursor_ctl(const struc
  	return cntl;
  }
  
 -static void i9xx_update_cursor(struct drm_crtc *crtc, u32 base,
 -			       const struct intel_plane_state *plane_state)
 +static bool i9xx_cursor_size_ok(const struct intel_plane_state *plane_state)
  {
 -	struct drm_device *dev = crtc->dev;
 -	struct drm_i915_private *dev_priv = to_i915(dev);
 -	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
 -	int pipe = intel_crtc->pipe;
 -	uint32_t cntl = 0;
 +	struct drm_i915_private *dev_priv =
 +		to_i915(plane_state->base.plane->dev);
 +	int width = plane_state->base.crtc_w;
 +	int height = plane_state->base.crtc_h;
  
 -	if (plane_state && plane_state->base.visible)
 -		cntl = plane_state->ctl;
 +	if (!intel_cursor_size_ok(plane_state))
 +		return false;
  
 -	if (intel_crtc->cursor_cntl != cntl) {
 -		I915_WRITE_FW(CURCNTR(pipe), cntl);
 -		POSTING_READ_FW(CURCNTR(pipe));
 -		intel_crtc->cursor_cntl = cntl;
 +	/* Cursor width is limited to a few power-of-two sizes */
 +	switch (width) {
 +	case 256:
 +	case 128:
 +	case 64:
 +		break;
 +	default:
 +		return false;
  	}
  
 -	/* and commit changes on next vblank */
 -	I915_WRITE_FW(CURBASE(pipe), base);
 -	POSTING_READ_FW(CURBASE(pipe));
 +	/*
 +	 * IVB+ have CUR_FBC_CTL which allows an arbitrary cursor
 +	 * height from 8 lines up to the cursor width, when the
 +	 * cursor is not rotated. Everything else requires square
 +	 * cursors.
 +	 */
 +	if (HAS_CUR_FBC(dev_priv) &&
- 	    plane_state->base.rotation & DRM_ROTATE_0) {
++	    plane_state->base.rotation & DRM_MODE_ROTATE_0) {
 +		if (height < 8 || height > width)
 +			return false;
 +	} else {
 +		if (height != width)
 +			return false;
 +	}
  
 -	intel_crtc->cursor_base = base;
 +	return true;
  }
  
 -/* If no-part of the cursor is visible on the framebuffer, then the GPU may hang... */
 -static void intel_crtc_update_cursor(struct drm_crtc *crtc,
 -				     const struct intel_plane_state *plane_state)
 +static int i9xx_check_cursor(struct intel_plane *plane,
 +			     struct intel_crtc_state *crtc_state,
 +			     struct intel_plane_state *plane_state)
  {
 -	struct drm_device *dev = crtc->dev;
 -	struct drm_i915_private *dev_priv = to_i915(dev);
 -	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
 -	int pipe = intel_crtc->pipe;
 -	u32 base = intel_crtc->cursor_addr;
 -	unsigned long irqflags;
 -	u32 pos = 0;
 -
 -	if (plane_state) {
 -		int x = plane_state->base.crtc_x;
 -		int y = plane_state->base.crtc_y;
 +	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 +	const struct drm_framebuffer *fb = plane_state->base.fb;
 +	enum pipe pipe = plane->pipe;
 +	int ret;
  
 -		if (x < 0) {
 -			pos |= CURSOR_POS_SIGN << CURSOR_X_SHIFT;
 -			x = -x;
 -		}
 -		pos |= x << CURSOR_X_SHIFT;
 +	ret = intel_check_cursor(crtc_state, plane_state);
 +	if (ret)
 +		return ret;
  
 -		if (y < 0) {
 -			pos |= CURSOR_POS_SIGN << CURSOR_Y_SHIFT;
 -			y = -y;
 -		}
 -		pos |= y << CURSOR_Y_SHIFT;
 +	/* if we want to turn off the cursor ignore width and height */
 +	if (!fb)
 +		return 0;
  
 -		/* ILK+ do this automagically */
 -		if (HAS_GMCH_DISPLAY(dev_priv) &&
 -		    plane_state->base.rotation & DRM_MODE_ROTATE_180) {
 -			base += (plane_state->base.crtc_h *
 -				 plane_state->base.crtc_w - 1) * 4;
 -		}
 +	/* Check for which cursor types we support */
 +	if (!i9xx_cursor_size_ok(plane_state)) {
 +		DRM_DEBUG("Cursor dimension %dx%d not supported\n",
 +			  plane_state->base.crtc_w,
 +			  plane_state->base.crtc_h);
 +		return -EINVAL;
  	}
  
 -	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 +	if (fb->pitches[0] != plane_state->base.crtc_w * fb->format->cpp[0]) {
 +		DRM_DEBUG_KMS("Invalid cursor stride (%u) (cursor width %d)\n",
 +			      fb->pitches[0], plane_state->base.crtc_w);
 +		return -EINVAL;
 +	}
  
 -	I915_WRITE_FW(CURPOS(pipe), pos);
 +	/*
 +	 * There's something wrong with the cursor on CHV pipe C.
 +	 * If it straddles the left edge of the screen then
 +	 * moving it away from the edge or disabling it often
 +	 * results in a pipe underrun, and often that can lead to
 +	 * dead pipe (constant underrun reported, and it scans
 +	 * out just a solid color). To recover from that, the
 +	 * display power well must be turned off and on again.
 +	 * Refuse the put the cursor into that compromised position.
 +	 */
 +	if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_C &&
 +	    plane_state->base.visible && plane_state->base.crtc_x < 0) {
 +		DRM_DEBUG_KMS("CHV cursor C not allowed to straddle the left screen edge\n");
 +		return -EINVAL;
 +	}
  
 -	if (IS_I845G(dev_priv) || IS_I865G(dev_priv))
 -		i845_update_cursor(crtc, base, plane_state);
 -	else
 -		i9xx_update_cursor(crtc, base, plane_state);
 +	plane_state->ctl = i9xx_cursor_ctl(crtc_state, plane_state);
  
 -	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 +	return 0;
  }
  
 -static bool cursor_size_ok(struct drm_i915_private *dev_priv,
 -			   uint32_t width, uint32_t height)
 +static void i9xx_update_cursor(struct intel_plane *plane,
 +			       const struct intel_crtc_state *crtc_state,
 +			       const struct intel_plane_state *plane_state)
  {
 -	if (width == 0 || height == 0)
 -		return false;
 +	struct drm_i915_private *dev_priv = to_i915(plane->base.dev);
 +	enum pipe pipe = plane->pipe;
 +	u32 cntl = 0, base = 0, pos = 0, fbc_ctl = 0;
 +	unsigned long irqflags;
  
 -	/*
 -	 * 845g/865g are special in that they are only limited by
 -	 * the width of their cursors, the height is arbitrary up to
 -	 * the precision of the register. Everything else requires
 -	 * square cursors, limited to a few power-of-two sizes.
 -	 */
 -	if (IS_I845G(dev_priv) || IS_I865G(dev_priv)) {
 -		if ((width & 63) != 0)
 -			return false;
 +	if (plane_state && plane_state->base.visible) {
 +		cntl = plane_state->ctl;
  
 -		if (width > (IS_I845G(dev_priv) ? 64 : 512))
 -			return false;
 +		if (plane_state->base.crtc_h != plane_state->base.crtc_w)
 +			fbc_ctl = CUR_FBC_CTL_EN | (plane_state->base.crtc_h - 1);
  
 -		if (height > 1023)
 -			return false;
 +		base = intel_cursor_base(plane_state);
 +		pos = intel_cursor_position(plane_state);
 +	}
 +
 +	spin_lock_irqsave(&dev_priv->uncore.lock, irqflags);
 +
 +	/*
 +	 * On some platforms writing CURCNTR first will also
 +	 * cause CURPOS to be armed by the CURBASE write.
 +	 * Without the CURCNTR write the CURPOS write would
 +	 * arm itself.
 +	 *
 +	 * CURCNTR and CUR_FBC_CTL are always
 +	 * armed by the CURBASE write only.
 +	 */
 +	if (plane->cursor.base != base ||
 +	    plane->cursor.size != fbc_ctl ||
 +	    plane->cursor.cntl != cntl) {
 +		I915_WRITE_FW(CURCNTR(pipe), cntl);
 +		if (HAS_CUR_FBC(dev_priv))
 +			I915_WRITE_FW(CUR_FBC_CTL(pipe), fbc_ctl);
 +		I915_WRITE_FW(CURPOS(pipe), pos);
 +		I915_WRITE_FW(CURBASE(pipe), base);
 +
 +		plane->cursor.base = base;
 +		plane->cursor.size = fbc_ctl;
 +		plane->cursor.cntl = cntl;
  	} else {
 -		switch (width | height) {
 -		case 256:
 -		case 128:
 -			if (IS_GEN2(dev_priv))
 -				return false;
 -		case 64:
 -			break;
 -		default:
 -			return false;
 -		}
 +		I915_WRITE_FW(CURPOS(pipe), pos);
  	}
  
 -	return true;
 +	POSTING_READ_FW(CURBASE(pipe));
 +
 +	spin_unlock_irqrestore(&dev_priv->uncore.lock, irqflags);
 +}
 +
 +static void i9xx_disable_cursor(struct intel_plane *plane,
 +				struct intel_crtc *crtc)
 +{
 +	i9xx_update_cursor(plane, NULL, NULL);
  }
  
 +
  /* VESA 640x480x72Hz mode to set on the pipe */
  static struct drm_display_mode load_detect_mode = {
  	DRM_MODE("640x480", DRM_MODE_TYPE_DEFAULT, 31500, 640, 664,
