From: "Luck, Tony" <tony.luck@intel.com>
Subject: [PATCH] Fix #include in drm_mm.h to unbreak ia64 build
Date: Mon, 29 Jul 2013 11:51:33 -0700
Message-ID: <51f6b9b51365634ccf@agluck-desk.sc.intel.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:11808 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751339Ab3G2Svf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jul 2013 14:51:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org

Linux-next build on ia64 is falling over with errors like this:

In file included from include/drm/drm_vma_manager.h:26,
                 from include/drm/ttm/ttm_bo_api.h:35,
                 from include/drm/ttm/ttm_bo_driver.h:33,
                 from drivers/gpu/drm/ttm/ttm_agp_backend.c:35:
include/drm/drm_mm.h:67: error: expected specifier-qualifier-list before 'spinlock_t'

I guess other architectures are pulling in spinlock.h
through some twisty #include path so are not seeing this
error.  But drm_mm.h makes use of spinlock_t - so it
should do the right thing and #include <linux/spinlock.h>

Signed-off-by: Tony Luck <tony.luck@intel.com>

---

First saw this break in tag "next-20130726"

diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index b87d05e..7d5fbae 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -37,6 +37,7 @@
  * Generic range manager structs
  */
 #include <linux/list.h>
+#include <linux/spinlock.h>
 #ifdef CONFIG_DEBUG_FS
 #include <linux/seq_file.h>
 #endif
