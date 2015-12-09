From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Wed, 9 Dec 2015 13:35:07 +1100
Message-ID: <20151209133507.6840cd1f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36246 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751070AbbLICfJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Dec 2015 21:35:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Kuoppala <mika.kuoppala@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/i915/intel_pm.c

between commits:

  344df9809f45 ("drm/i915/skl: Disable coarse power gating up until F0")
  6704d4552853 ("drm/i915/skl: Double RC6 WRL always on")

from the drm-intel-fixes tree and commit:

  e87a005d90c3 ("drm/i915: add helpers for platform specific revision id range checks")

from the drm tree.

I fixed it up (I think - see below) and can carry the fix as necessary
(no action is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_pm.c
index f091ad12d694,96f45d7b3e4b..000000000000
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@@ -4823,8 -4707,9 +4706,9 @@@ static void gen9_enable_rc6(struct drm_
  	 * 3b: Enable Coarse Power Gating only when RC6 is enabled.
  	 * WaRsDisableCoarsePowerGating:skl,bxt - Render/Media PG need to be disabled with RC6.
  	 */
- 	if ((IS_BROXTON(dev) && (INTEL_REVID(dev) < BXT_REVID_B0)) ||
- 	    ((IS_SKL_GT3(dev) || IS_SKL_GT4(dev)) && (INTEL_REVID(dev) <= SKL_REVID_F0)))
+ 	if (IS_BXT_REVID(dev, 0, BXT_REVID_A1) ||
+ 	    ((IS_SKL_GT3(dev) || IS_SKL_GT4(dev)) &&
 -	     IS_SKL_REVID(dev, 0, SKL_REVID_E0)))
++	     IS_SKL_REVID(dev, 0, SKL_REVID_F0)))
  		I915_WRITE(GEN9_PG_ENABLE, 0);
  	else
  		I915_WRITE(GEN9_PG_ENABLE, (rc6_mask & GEN6_RC_CTL_RC6_ENABLE) ?
