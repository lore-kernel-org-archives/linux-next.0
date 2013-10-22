From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the drm tree
Date: Tue, 22 Oct 2013 17:10:47 +0200
Message-ID: <1382454649-16442-3-git-send-email-treding@nvidia.com>
References: <1382369814-7582-1-git-send-email-treding@nvidia.com>
 <1382454649-16442-1-git-send-email-treding@nvidia.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f49.google.com ([209.85.214.49]:41125 "EHLO
	mail-bk0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754002Ab3JVPNW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 22 Oct 2013 11:13:22 -0400
Received: by mail-bk0-f49.google.com with SMTP id w14so1336116bkz.8
        for <linux-next@vger.kernel.org>; Tue, 22 Oct 2013 08:13:21 -0700 (PDT)
In-Reply-To: <1382454649-16442-1-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org

Today's linux-next merge of the drm tree got conflicts in

	drivers/gpu/drm/i915/i915_dma.c
	drivers/gpu/drm/i915/i915_drv.c
	drivers/gpu/drm/i915/intel_ddi.c
	drivers/gpu/drm/i915/intel_display.c
	drivers/gpu/drm/i915/intel_dp.c
	drivers/gpu/drm/i915/intel_drv.h

I fixed them up (see below). Please verify that the resolution looks good.

Thanks,
Thierry
---
diff --cc drivers/gpu/drm/i915/i915_dma.c
index d5c784d,b3873c9..b20a8b2
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@@ -1348,6 -1358,13 +1355,8 @@@ static int i915_load_modeset_init(struc
  	 */
  	intel_fbdev_initial_config(dev);
  
 -	/*
 -	 * Must do this after fbcon init so that
 -	 * vgacon_save_screen() works during the handover.
 -	 */
 -	i915_disable_vga_mem(dev);
+ 	intel_display_power_put(dev, POWER_DOMAIN_VGA);
+ 
  	/* Only enable hotplug handling once the fbdev is fully set up. */
  	dev_priv->enable_hotplug_processing = true;
  
diff --cc drivers/gpu/drm/i915/i915_drv.c
index 2ad2788,96f2304..a51f96a
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@@ -583,6 -581,19 +583,20 @@@ static int __i915_drm_thaw(struct drm_d
  	struct drm_i915_private *dev_priv = dev->dev_private;
  	int error = 0;
  
+ 	intel_uncore_early_sanitize(dev);
+ 
+ 	intel_uncore_sanitize(dev);
+ 
+ 	if (drm_core_check_feature(dev, DRIVER_MODESET) &&
+ 	    restore_gtt_mappings) {
+ 		mutex_lock(&dev->struct_mutex);
+ 		i915_gem_restore_gtt_mappings(dev);
+ 		mutex_unlock(&dev->struct_mutex);
 -	}
++	} else if (drm_core_check_feature(dev, DRIVER_MODESET))
++		i915_check_and_clear_faults(dev);
+ 
+ 	intel_init_power_well(dev);
+ 
  	i915_restore_state(dev);
  	intel_opregion_setup(dev);
  
diff --cc drivers/gpu/drm/i915/intel_display.c
index 725f0be,617b963..f674267
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -10081,9 -10365,36 +10361,9 @@@ static void i915_disable_vga(struct drm
  	POSTING_READ(vga_reg);
  }
  
 -static void i915_enable_vga_mem(struct drm_device *dev)
 -{
 -	/* Enable VGA memory on Intel HD */
 -	if (HAS_PCH_SPLIT(dev)) {
 -		vga_get_uninterruptible(dev->pdev, VGA_RSRC_LEGACY_IO);
 -		outb(inb(VGA_MSR_READ) | VGA_MSR_MEM_EN, VGA_MSR_WRITE);
 -		vga_set_legacy_decoding(dev->pdev, VGA_RSRC_LEGACY_IO |
 -						   VGA_RSRC_LEGACY_MEM |
 -						   VGA_RSRC_NORMAL_IO |
 -						   VGA_RSRC_NORMAL_MEM);
 -		vga_put(dev->pdev, VGA_RSRC_LEGACY_IO);
 -	}
 -}
 -
 -void i915_disable_vga_mem(struct drm_device *dev)
 -{
 -	/* Disable VGA memory on Intel HD */
 -	if (HAS_PCH_SPLIT(dev)) {
 -		vga_get_uninterruptible(dev->pdev, VGA_RSRC_LEGACY_IO);
 -		outb(inb(VGA_MSR_READ) & ~VGA_MSR_MEM_EN, VGA_MSR_WRITE);
 -		vga_set_legacy_decoding(dev->pdev, VGA_RSRC_LEGACY_IO |
 -						   VGA_RSRC_NORMAL_IO |
 -						   VGA_RSRC_NORMAL_MEM);
 -		vga_put(dev->pdev, VGA_RSRC_LEGACY_IO);
 -	}
 -}
 -
  void intel_modeset_init_hw(struct drm_device *dev)
  {
- 	intel_init_power_well(dev);
+ 	struct drm_i915_private *dev_priv = dev->dev_private;
  
  	intel_prepare_ddi(dev);
  
diff --cc drivers/gpu/drm/i915/intel_dp.c
index 1a43137,4f52ec7..14ea46a
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@@ -1402,31 -1468,20 +1468,40 @@@ static void intel_dp_get_config(struct 
  			pipe_config->port_clock = 270000;
  	}
  
 +	if (is_edp(intel_dp) && dev_priv->vbt.edp_bpp &&
 +	    pipe_config->pipe_bpp > dev_priv->vbt.edp_bpp) {
 +		/*
 +		 * This is a big fat ugly hack.
 +		 *
 +		 * Some machines in UEFI boot mode provide us a VBT that has 18
 +		 * bpp and 1.62 GHz link bandwidth for eDP, which for reasons
 +		 * unknown we fail to light up. Yet the same BIOS boots up with
 +		 * 24 bpp and 2.7 GHz link. Use the same bpp as the BIOS uses as
 +		 * max, not what it tells us to use.
 +		 *
 +		 * Note: This will still be broken if the eDP panel is not lit
 +		 * up by the BIOS, and thus we can't get the mode at module
 +		 * load.
 +		 */
 +		DRM_DEBUG_KMS("pipe has %d bpp for eDP panel, overriding BIOS-provided max %d bpp\n",
 +			      pipe_config->pipe_bpp, dev_priv->vbt.edp_bpp);
 +		dev_priv->vbt.edp_bpp = pipe_config->pipe_bpp;
 +	}
++
+ 	dotclock = intel_dotclock_calculate(pipe_config->port_clock,
+ 					    &pipe_config->dp_m_n);
+ 
+ 	if (HAS_PCH_SPLIT(dev_priv->dev) && port != PORT_A)
+ 		ironlake_check_encoder_dotclock(pipe_config, dotclock);
+ 
+ 	pipe_config->adjusted_mode.crtc_clock = dotclock;
  }
  
- static bool is_edp_psr(struct intel_dp *intel_dp)
+ static bool is_edp_psr(struct drm_device *dev)
  {
- 	return is_edp(intel_dp) &&
- 		intel_dp->psr_dpcd[0] & DP_PSR_IS_SUPPORTED;
+ 	struct drm_i915_private *dev_priv = dev->dev_private;
+ 
+ 	return dev_priv->psr.sink_support;
  }
  
  static bool intel_edp_is_psr_enabled(struct drm_device *dev)
@@@ -1486,8 -1541,8 +1561,8 @@@ static void intel_edp_psr_setup(struct 
  	intel_edp_psr_write_vsc(intel_dp, &psr_vsc);
  
  	/* Avoid continuous PSR exit by masking memup and hpd */
- 	I915_WRITE(EDP_PSR_DEBUG_CTL, EDP_PSR_DEBUG_MASK_MEMUP |
+ 	I915_WRITE(EDP_PSR_DEBUG_CTL(dev), EDP_PSR_DEBUG_MASK_MEMUP |
 -		   EDP_PSR_DEBUG_MASK_HPD);
 +		   EDP_PSR_DEBUG_MASK_HPD | EDP_PSR_DEBUG_MASK_LPSP);
  
  	intel_dp->psr_setup_done = true;
  }
