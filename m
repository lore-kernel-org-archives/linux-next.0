From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Wed, 6 Dec 2017 12:00:15 +1100
Message-ID: <20171206120015.66d85f77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39859 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753339AbdLFBAR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Dec 2017 20:00:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <j.w.r.degoede@gmail.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/intel_dsi.c: In function 'intel_dsi_get_panel_orientation':
drivers/gpu/drm/i915/intel_dsi.c:1673:13: error: storage size of 'plane' isn't known
  enum plane plane;
             ^

Caused by commit

  82daca297506 ("drm/i915: Add "panel orientation" property to the panel connector, v6.")

interacting with commit

  ed15030d7ab0 ("drm/i915: s/enum plane/enum i9xx_plane_id/")

from the drm-intel tree.

I have applied the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 6 Dec 2017 11:56:32 +1100
Subject: [PATCH] drm/i915: fix up for "drm/i915: s/enum plane/enum
 i9xx_plane_id/"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/intel_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_dsi.c b/drivers/gpu/drm/i915/intel_dsi.c
index 1b60df3c14a0..f67d321376e4 100644
--- a/drivers/gpu/drm/i915/intel_dsi.c
+++ b/drivers/gpu/drm/i915/intel_dsi.c
@@ -1670,7 +1670,7 @@ static int intel_dsi_get_panel_orientation(struct intel_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	int orientation = DRM_MODE_PANEL_ORIENTATION_NORMAL;
-	enum plane plane;
+	enum i9xx_plane_id plane;
 	u32 val;
 
 	if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell
