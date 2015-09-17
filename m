From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Thu, 17 Sep 2015 10:13:48 +1000
Message-ID: <20150917101348.7f9d2665@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58471 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752811AbbIQANv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Sep 2015 20:13:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/i915_irq.c

between commit:

  4e3d1e26c2b2 ("drm/i915: Pass hpd_status_i915[] to intel_get_hpd_pins() in pre-g4x")

from Linus' tree and commit:

  58f2cf241fb9 ("drm/i915: Don't call intel_get_hpd_pins() when there's no hotplug interrupt")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/i915_irq.c
index 5a244ab9395b,ca6d806a195a..000000000000
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@@ -1557,10 -1652,13 +1652,13 @@@ static void i9xx_hpd_irq_handler(struc
  	} else {
  		u32 hotplug_trigger = hotplug_status & HOTPLUG_INT_STATUS_I915;
  
- 		intel_get_hpd_pins(&pin_mask, &long_mask, hotplug_trigger,
- 				   hotplug_trigger, hpd_status_i915,
- 				   i9xx_port_hotplug_long_detect);
- 		intel_hpd_irq_handler(dev, pin_mask, long_mask);
+ 		if (hotplug_trigger) {
+ 			intel_get_hpd_pins(&pin_mask, &long_mask, hotplug_trigger,
 -					   hotplug_trigger, hpd_status_g4x,
++					   hotplug_trigger, hpd_status_i915,
+ 					   i9xx_port_hotplug_long_detect);
+ 
+ 			intel_hpd_irq_handler(dev, pin_mask, long_mask);
+ 		}
  	}
  }
  
