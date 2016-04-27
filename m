From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Wed, 27 Apr 2016 12:32:22 +1000
Message-ID: <20160427123222.2a68eedf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39847 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751798AbcD0CcY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2016 22:32:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lyude <cpaul@redhat.com>, Yetunde Adebisi <yetundex.adebisi@intel.com>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_dp.c

between commit:

  86ee27b5aa75 ("drm/i915: Read eDP Display control capability registers")

from the drm-intel tree and commit:

  9f085ebb1a50 ("rm/i915: Get rid of intel_dp_dpcd_read_wake()")

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

diff --cc drivers/gpu/drm/i915/intel_dp.c
index 6bb0b2340e7c,b52676a032f9..000000000000
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@@ -3747,9 -3744,10 +3714,9 @@@ intel_dp_get_dpcd(struct intel_dp *inte
  	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
  	struct drm_device *dev = dig_port->base.base.dev;
  	struct drm_i915_private *dev_priv = dev->dev_private;
 -	uint8_t rev;
  
- 	if (intel_dp_dpcd_read_wake(&intel_dp->aux, 0x000, intel_dp->dpcd,
- 				    sizeof(intel_dp->dpcd)) < 0)
+ 	if (drm_dp_dpcd_read(&intel_dp->aux, 0x000, intel_dp->dpcd,
+ 			     sizeof(intel_dp->dpcd)) < 0)
  		return false; /* aux transfer failed */
  
  	DRM_DEBUG_KMS("DPCD: %*ph\n", (int) sizeof(intel_dp->dpcd), intel_dp->dpcd);
@@@ -3803,15 -3801,6 +3770,15 @@@
  			DRM_DEBUG_KMS("PSR2 %s on sink",
  				dev_priv->psr.psr2_support ? "supported" : "not supported");
  		}
 +
 +		/* Read the eDP Display control capabilities registers */
 +		memset(intel_dp->edp_dpcd, 0, sizeof(intel_dp->edp_dpcd));
 +		if ((intel_dp->dpcd[DP_EDP_CONFIGURATION_CAP] & DP_DPCD_DISPLAY_CONTROL_CAPABLE) &&
- 				(intel_dp_dpcd_read_wake(&intel_dp->aux, DP_EDP_DPCD_REV,
++				(drm_dp_dpcd_read(&intel_dp->aux, DP_EDP_DPCD_REV,
 +						intel_dp->edp_dpcd, sizeof(intel_dp->edp_dpcd)) ==
 +								sizeof(intel_dp->edp_dpcd)))
 +			DRM_DEBUG_KMS("EDP DPCD : %*ph\n", (int) sizeof(intel_dp->edp_dpcd),
 +					intel_dp->edp_dpcd);
  	}
  
  	DRM_DEBUG_KMS("Display Port TPS3 support: source %s, sink %s\n",
