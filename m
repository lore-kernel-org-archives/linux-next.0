From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Wed, 1 Nov 2017 14:36:52 +1100
Message-ID: <20171101143652.409620ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33227 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751958AbdKADgy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Oct 2017 23:36:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Packard <keithp@keithp.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@chromium.org>

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drmP.h

between commit:

  e7646f84ad4f ("drm: Add new LEASE debug level")

from the drm tree and commit:

  02c9656b2f0d ("drm: Move debug macros out of drmP.h")

from the drm-misc tree.

I fixed it up (I used the drm-misc version of the file and added the below
merge fix patch) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 1 Nov 2017 14:33:07 +1100
Subject: [PATCH] drm-misc: merge fix up for DEBUG printing macros move

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/drm/drm_print.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 7b9c86a6ca3e..edcea83a5050 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -171,6 +171,7 @@ static inline struct drm_printer drm_debug_printer(const char *prefix)
 #define DRM_UT_ATOMIC		0x10
 #define DRM_UT_VBL		0x20
 #define DRM_UT_STATE		0x40
+#define DRM_UT_LEASE		0x80
 
 __printf(6, 7)
 void drm_dev_printk(const struct device *dev, const char *level,
@@ -287,6 +288,9 @@ void drm_printk(const char *level, unsigned int category,
 #define DRM_DEBUG_VBL(fmt, ...)					\
 	drm_printk(KERN_DEBUG, DRM_UT_VBL, fmt, ##__VA_ARGS__)
 
+#define DRM_DEBUG_LEASE(fmt, ...)					\
+	drm_printk(KERN_DEBUG, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+
 #define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, level, fmt, args...)	\
 ({									\
 	static DEFINE_RATELIMIT_STATE(_rs,				\


-- 
Cheers,
Stephen Rothwell
