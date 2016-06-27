From: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/i915: fix build errors when ACPI is not enabled
Date: Mon, 27 Jun 2016 14:53:19 +0300
Message-ID: <1467028399-9965-1-git-send-email-jani.nikula@intel.com>
References: <576EC660.3000806@infradead.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:14050 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750870AbcF0Lxh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2016 07:53:37 -0400
In-Reply-To: <576EC660.3000806@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>, drm-intel-fixes@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors when ACPI is not enabled by adding function stubs:

../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_suspend':
../drivers/gpu/drm/i915/i915_drv.c:635:2: error: implicit declaration of function 'intel_opregion_unregister' [-Werror=implicit-function-declaration]
  intel_opregion_unregister(dev_priv);
../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_resume':
../drivers/gpu/drm/i915/i915_drv.c:798:2: error: implicit declaration of function 'intel_opregion_register' [-Werror=implicit-function-declaration]
  intel_opregion_register(dev_priv);

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Fixes: 03d92e4779b8 ("drm/i915/opregion: Rename init/fini functions to register/unregister")
Cc: drm-intel-fixes@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
[Jani: dropped the stale init/fini declarations]
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 9ef491975812..724d34b00196 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -3694,8 +3694,8 @@ extern int intel_opregion_notify_adapter(struct drm_i915_private *dev_priv,
 extern int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
 #else
 static inline int intel_opregion_setup(struct drm_i915_private *dev) { return 0; }
-static inline void intel_opregion_init(struct drm_i915_private *dev) { }
-static inline void intel_opregion_fini(struct drm_i915_private *dev) { }
+static inline void intel_opregion_register(struct drm_i915_private *dev_priv) { }
+static inline void intel_opregion_unregister(struct drm_i915_private *dev_priv) { }
 static inline void intel_opregion_asle_intr(struct drm_i915_private *dev_priv)
 {
 }
-- 
2.1.4
