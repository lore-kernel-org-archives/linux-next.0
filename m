From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Thu, 19 Nov 2015 11:23:23 +1100
Message-ID: <20151119112323.1c4b95ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34032 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755766AbbKSAX0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Nov 2015 19:23:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_runtime_pm.c

between commitis:

  bc5f2ab11ca6 ("drm/i915/skl: Don't call intel_prepare_ddi when encoder list isn't yet initialized.")
  1b0e3a049efe ("drm/i915/skl: disable display side power well support for now")

from Linus' tree and commit:

  f0ab43e6c338 ("drm/i915: Introduce a gmbus power domain")
  c2b16152e0b3 ("drm/i915/skl: remove redundant DDI/IRQ reinitialization during PW1 enabling")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_runtime_pm.c
index d89c1d0aa1b7,f8167753f91b..000000000000
--- a/drivers/gpu/drm/i915/intel_runtime_pm.c
+++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
@@@ -1808,24 -1831,9 +1831,24 @@@ static struct i915_power_well bxt_power
  		.domains = BXT_DISPLAY_POWERWELL_2_POWER_DOMAINS,
  		.ops = &skl_power_well_ops,
  		.data = SKL_DISP_PW_2,
- 	}
+ 	},
  };
  
 +static int
 +sanitize_disable_power_well_option(const struct drm_i915_private *dev_priv,
 +				   int disable_power_well)
 +{
 +	if (disable_power_well >= 0)
 +		return !!disable_power_well;
 +
 +	if (IS_SKYLAKE(dev_priv)) {
 +		DRM_DEBUG_KMS("Disabling display power well support\n");
 +		return 0;
 +	}
 +
 +	return 1;
 +}
 +
  #define set_power_wells(power_domains, __power_wells) ({		\
  	(power_domains)->power_wells = (__power_wells);			\
  	(power_domains)->power_well_count = ARRAY_SIZE(__power_wells);	\
@@@ -1842,9 -1850,8 +1865,11 @@@ int intel_power_domains_init(struct drm
  {
  	struct i915_power_domains *power_domains = &dev_priv->power_domains;
  
+ 	BUILD_BUG_ON(POWER_DOMAIN_NUM > 31);
+ 
 +	i915.disable_power_well = sanitize_disable_power_well_option(dev_priv,
 +						     i915.disable_power_well);
 +
  	mutex_init(&power_domains->lock);
  
  	/*
