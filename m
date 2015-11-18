From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Wed, 18 Nov 2015 11:30:54 +1100
Message-ID: <20151118113054.3d4c702d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60186 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755046AbbKRAa5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Nov 2015 19:30:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>, Lukas Wunner <lukas@wunner.de>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  76dc3769d7c3 ("drm/i915: Don't clobber the addfb2 ioctl params")

from the drm-intel-fixes tree and commit:

  dcb1394e74e3 ("drm/i915: On fb alloc failure, unref gem object where it gets refed")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_display.c
index 8f80bbeb1313,4cfcd3eea7d8..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -2398,26 -2385,23 +2394,25 @@@ intel_pin_and_fence_fb_obj(struct drm_p
  	 * framebuffer compression.  For simplicity, we always install
  	 * a fence as the cost is not that onerous.
  	 */
 -	ret = i915_gem_object_get_fence(obj);
 -	if (ret == -EDEADLK) {
 -		/*
 -		 * -EDEADLK means there are no free fences
 -		 * no pending flips.
 -		 *
 -		 * This is propagated to atomic, but it uses
 -		 * -EDEADLK to force a locking recovery, so
 -		 * change the returned error to -EBUSY.
 -		 */
 -		ret = -EBUSY;
 -		goto err_unpin;
 -	} else if (ret)
 -		goto err_unpin;
 +	if (view.type == I915_GGTT_VIEW_NORMAL) {
 +		ret = i915_gem_object_get_fence(obj);
 +		if (ret == -EDEADLK) {
 +			/*
 +			 * -EDEADLK means there are no free fences
 +			 * no pending flips.
 +			 *
 +			 * This is propagated to atomic, but it uses
 +			 * -EDEADLK to force a locking recovery, so
 +			 * change the returned error to -EBUSY.
 +			 */
 +			ret = -EBUSY;
 +			goto err_unpin;
 +		} else if (ret)
 +			goto err_unpin;
  
 -	i915_gem_object_pin_fence(obj);
 +		i915_gem_object_pin_fence(obj);
 +	}
  
- 	dev_priv->mm.interruptible = true;
  	intel_runtime_pm_put(dev_priv);
  	return 0;
  
@@@ -14369,17 -14560,21 +14583,22 @@@ static int intel_framebuffer_init(struc
  static struct drm_framebuffer *
  intel_user_framebuffer_create(struct drm_device *dev,
  			      struct drm_file *filp,
 -			      struct drm_mode_fb_cmd2 *mode_cmd)
 +			      struct drm_mode_fb_cmd2 *user_mode_cmd)
  {
+ 	struct drm_framebuffer *fb;
  	struct drm_i915_gem_object *obj;
 +	struct drm_mode_fb_cmd2 mode_cmd = *user_mode_cmd;
  
  	obj = to_intel_bo(drm_gem_object_lookup(dev, filp,
 -						mode_cmd->handles[0]));
 +						mode_cmd.handles[0]));
  	if (&obj->base == NULL)
  		return ERR_PTR(-ENOENT);
  
- 	return intel_framebuffer_create(dev, &mode_cmd, obj);
 -	fb = intel_framebuffer_create(dev, mode_cmd, obj);
++	fb = intel_framebuffer_create(dev, &mode_cmd, obj);
+ 	if (IS_ERR(fb))
+ 		drm_gem_object_unreference_unlocked(&obj->base);
+ 
+ 	return fb;
  }
  
  #ifndef CONFIG_DRM_FBDEV_EMULATION
