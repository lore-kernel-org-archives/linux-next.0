From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the drm tree
Date: Mon, 14 Oct 2013 16:48:04 +0200
Message-ID: <1381762088-18880-4-git-send-email-treding@nvidia.com>
References: <1381762088-18880-1-git-send-email-treding@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381762088-18880-1-git-send-email-treding@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the drm tree got conflicts in

	drivers/gpu/drm/i915/intel_drv.h

caused by commits e1264eb (Revert "drm/i915: Delay disabling of VGA memory
until vgacon->fbcon handoff is done"), 20ddf66 (drm/i915: Make
intel_crtc_active() available outside intel_pm.c), 18442d0 (drm/i915: Fix
port_clock and adjusted_mode.clock readout all over), 6878da0 (drm/i915:
Add intel_dotclock_calculate()) and eb14cb7 (drm/i915: Add state readout
and checking for has_dp_encoder and dp_m_n).

I fixed them up (see below). Please verify that the resolution looks good.

Thanks,
Thierry
---
diff --cc drivers/gpu/drm/i915/intel_drv.h
index 9b7b68f,287bbef..39bfdb3
--- a/drivers/gpu/drm/i915/intel_drv.h
+++ b/drivers/gpu/drm/i915/intel_drv.h
@@@ -793,5 -817,14 +817,13 @@@ extern void hsw_pc8_disable_interrupts(
  extern void hsw_pc8_restore_interrupts(struct drm_device *dev);
  extern void intel_aux_display_runtime_get(struct drm_i915_private *dev_priv);
  extern void intel_aux_display_runtime_put(struct drm_i915_private *dev_priv);
+ extern void intel_dp_get_m_n(struct intel_crtc *crtc,
+ 			     struct intel_crtc_config *pipe_config);
+ extern int intel_dotclock_calculate(int link_freq,
+ 				    const struct intel_link_m_n *m_n);
+ extern void ironlake_check_encoder_dotclock(const struct intel_crtc_config *pipe_config,
+ 					    int dotclock);
+ 
+ extern bool intel_crtc_active(struct drm_crtc *crtc);
 -extern void i915_disable_vga_mem(struct drm_device *dev);
  
  #endif /* __INTEL_DRV_H__ */
