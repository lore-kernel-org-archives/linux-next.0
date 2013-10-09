From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the drm-intel tree
Date: Wed,  9 Oct 2013 16:14:25 +0200
Message-ID: <1381328067-1593-4-git-send-email-treding@nvidia.com>
References: <1381328067-1593-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381328067-1593-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the drm-intel tree got conflicts in

	drivers/gpu/drm/i915/i915_dma.c
	drivers/gpu/drm/i915/intel_dp.c

caused by commits 0111be4 (drm: Kill drm perf counter leftovers) and
b14c567 (drm/i915: use pointer = k[cmz...]alloc(sizeof(*pointer), ...)
pattern) as well as commits ba0bf12 (drm: Make vblank_disable_allowed
bool) and ce35255 (drm/i915: Fix unclaimed register access due to
delayed VGA memory disable).

I fixed them up (see below). Please verify that the resolution looks
good.

Thanks,
Thierry
---
diff --cc drivers/gpu/drm/i915/i915_dma.c
index 637b695,ad55c02..3316a6f
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@@ -1330,9 -1333,11 +1333,11 @@@ static int i915_load_modeset_init(struc
  
  	/* Always safe in the mode setting case. */
  	/* FIXME: do pre/post-mode set stuff in core KMS code */
 -	dev->vblank_disable_allowed = 1;
 +	dev->vblank_disable_allowed = true;
- 	if (INTEL_INFO(dev)->num_pipes == 0)
+ 	if (INTEL_INFO(dev)->num_pipes == 0) {
+ 		intel_display_power_put(dev, POWER_DOMAIN_VGA);
  		return 0;
+ 	}
  
  	ret = intel_fbdev_init(dev);
  	if (ret)
@@@ -1473,7 -1480,14 +1480,7 @@@ int i915_driver_load(struct drm_device 
  	if (info->gen >= 6 && !drm_core_check_feature(dev, DRIVER_MODESET))
  		return -ENODEV;
  
- 	dev_priv = kzalloc(sizeof(drm_i915_private_t), GFP_KERNEL);
 -	/* i915 has 4 more counters */
 -	dev->counters += 4;
 -	dev->types[6] = _DRM_STAT_IRQ;
 -	dev->types[7] = _DRM_STAT_PRIMARY;
 -	dev->types[8] = _DRM_STAT_SECONDARY;
 -	dev->types[9] = _DRM_STAT_DMA;
 -
+ 	dev_priv = kzalloc(sizeof(*dev_priv), GFP_KERNEL);
  	if (dev_priv == NULL)
  		return -ENOMEM;
  
diff --cc drivers/gpu/drm/i915/intel_dp.c
index bfbdbb3,c4c280c..3234552
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@@ -1549,8 -1558,8 +1558,8 @@@ static void intel_edp_psr_setup(struct 
  	intel_edp_psr_write_vsc(intel_dp, &psr_vsc);
  
  	/* Avoid continuous PSR exit by masking memup and hpd */
- 	I915_WRITE(EDP_PSR_DEBUG_CTL, EDP_PSR_DEBUG_MASK_MEMUP |
+ 	I915_WRITE(EDP_PSR_DEBUG_CTL(dev), EDP_PSR_DEBUG_MASK_MEMUP |
 -		   EDP_PSR_DEBUG_MASK_HPD);
 +		   EDP_PSR_DEBUG_MASK_HPD | EDP_PSR_DEBUG_MASK_LPSP);
  
  	intel_dp->psr_setup_done = true;
  }
