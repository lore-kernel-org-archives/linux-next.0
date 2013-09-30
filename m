From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: manual merge of the drm-intel tree
Date: Mon, 30 Sep 2013 13:26:06 +0200
Message-ID: <1380540373-25352-4-git-send-email-treding@nvidia.com>
References: <1380540373-25352-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1380540373-25352-1-git-send-email-treding@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge of the drm-intel tree got conflicts in

	drivers/gpu/drm/i915/intel_display.c

I fixed it up (see below). Please check if the resolution looks correct.

Thanks,
Thierry
---
diff --cc drivers/gpu/drm/i915/intel_display.c
index e5822e7,cbbdab6..76870f0
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -4775,21 -4882,8 +4882,12 @@@ static void i9xx_set_pipeconf(struct in
  
  	pipeconf = 0;
  
 +	if (dev_priv->quirks & QUIRK_PIPEA_FORCE &&
 +	    I915_READ(PIPECONF(intel_crtc->pipe)) & PIPECONF_ENABLE)
 +		pipeconf |= PIPECONF_ENABLE;
 +
- 	if (intel_crtc->pipe == 0 && INTEL_INFO(dev)->gen < 4) {
- 		/* Enable pixel doubling when the dot clock is > 90% of the (display)
- 		 * core speed.
- 		 *
- 		 * XXX: No double-wide on 915GM pipe B. Is that the only reason for the
- 		 * pipe == 0 check?
- 		 */
- 		if (intel_crtc->config.requested_mode.clock >
- 		    dev_priv->display.get_display_clock_speed(dev) * 9 / 10)
- 			pipeconf |= PIPECONF_DOUBLE_WIDE;
- 	}
+ 	if (intel_crtc->config.double_wide)
+ 		pipeconf |= PIPECONF_DOUBLE_WIDE;
  
  	/* only g4x and later have fancy bpc/dither controls */
  	if (IS_G4X(dev) || IS_VALLEYVIEW(dev)) {
