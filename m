From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] gpu: i915: fix build errors when ACPI is not enabled
Date: Sat, 25 Jun 2016 10:58:56 -0700
Message-ID: <576EC660.3000806@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57485 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349AbcFYR66 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Jun 2016 13:58:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build errors when ACPI is not enabled by adding function stubs:

../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_suspend':
../drivers/gpu/drm/i915/i915_drv.c:635:2: error: implicit declaration of function 'intel_opregion_unregister' [-Werror=implicit-function-declaration]
  intel_opregion_unregister(dev_priv);
../drivers/gpu/drm/i915/i915_drv.c: In function 'i915_drm_resume':
../drivers/gpu/drm/i915/i915_drv.c:798:2: error: implicit declaration of function 'intel_opregion_register' [-Werror=implicit-function-declaration]
  intel_opregion_register(dev_priv);

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc:	Daniel Vetter <daniel.vetter@intel.com>
Cc:	Jani Nikula <jani.nikula@linux.intel.com>
Cc:	intel-gfx@lists.freedesktop.org
Cc:	dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/i915_drv.h |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20160624.orig/drivers/gpu/drm/i915/i915_drv.h
+++ linux-next-20160624/drivers/gpu/drm/i915/i915_drv.h
@@ -3694,6 +3694,8 @@ extern int intel_opregion_notify_adapter
 extern int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
 #else
 static inline int intel_opregion_setup(struct drm_i915_private *dev) { return 0; }
+static inline void intel_opregion_register(struct drm_i915_private *dev_priv) { }
+static inline void intel_opregion_unregister(struct drm_i915_private *dev_priv) { }
 static inline void intel_opregion_init(struct drm_i915_private *dev) { }
 static inline void intel_opregion_fini(struct drm_i915_private *dev) { }
 static inline void intel_opregion_asle_intr(struct drm_i915_private *dev_priv)
