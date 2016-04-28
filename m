From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm tree
Date: Thu, 28 Apr 2016 11:57:45 +1000
Message-ID: <20160428115745.55890c80@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44025 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752432AbcD1B5r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Apr 2016 21:57:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Kahola <mika.kahola@intel.com>, Jani Nikula <jani.nikula@intel.com>

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

drivers/gpu/drm/i915/intel_ddi.c: In function 'intel_prepare_ddi_buffer':
drivers/gpu/drm/i915/intel_ddi.c:447:15: error: 'struct drm_i915_private' has no member named 'edp_low_vswing'
   if (dev_priv->edp_low_vswing) {
               ^

Caused by commit

  06411f08b3f3 ("drm/i915: move edp low vswing config to vbt data")

interacting with commit

  992e7a41f9fc ("drm/i915: Fix eDP low vswing for Broadwell")

from the drm-intel-fixes tree.

I applied the following merge fixup patch (which is suggested by the "v3:
Change dev_priv->edp_low_vswing to use dev_priv->vbt.edp.low_vswing"
comment in the drm-intel-fixes tree patch, but clearly could not be
done there).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 28 Apr 2016 11:53:36 +1000
Subject: [PATCH] drm/i915: fix up for edp_low_vswing change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/intel_ddi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_ddi.c b/drivers/gpu/drm/i915/intel_ddi.c
index 6080b5481984..e304857ba405 100644
--- a/drivers/gpu/drm/i915/intel_ddi.c
+++ b/drivers/gpu/drm/i915/intel_ddi.c
@@ -444,7 +444,7 @@ void intel_prepare_ddi_buffer(struct intel_encoder *encoder)
 		ddi_translations_fdi = bdw_ddi_translations_fdi;
 		ddi_translations_dp = bdw_ddi_translations_dp;
 
-		if (dev_priv->edp_low_vswing) {
+		if (dev_priv->vbt.edp.low_vswing) {
 			ddi_translations_edp = bdw_ddi_translations_edp;
 			n_edp_entries = ARRAY_SIZE(bdw_ddi_translations_edp);
 		} else {
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
