From: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/i915: fix build for CONFIG_BUG=n
Date: Mon, 12 Jan 2015 15:45:31 +0200
Message-ID: <1421070331-29650-1-git-send-email-jani.nikula@intel.com>
References: <CA+r1ZhgHTi7bS2irhtuSUs9aO=Br1dumN8=oAOeaMJDZ_ZhwBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:30726 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750921AbbALNoy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Jan 2015 08:44:54 -0500
In-Reply-To: <CA+r1ZhgHTi7bS2irhtuSUs9aO=Br1dumN8=oAOeaMJDZ_ZhwBw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: intel-gfx@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>, Jim Davis <jim.epost@gmail.com>, jani.nikula@intel.com, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, daniel.vetter@intel.com, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>

If CONFIG_BUG=3Dn __WARN_printf won't be defined leading to the below
build failure. The double underscores should have told us to steer clea=
r
of it anyway.

drivers/gpu/drm/i915/intel_display.c: In function =E2=80=98assert_pll=E2=
=80=99:
drivers/gpu/drm/i915/intel_display.c:1027:2: error: implicit declaratio=
n
of function =E2=80=98__WARN_printf=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
  I915_STATE_WARN(cur_state !=3D state,

Use WARN(1, ...) instead. It handles CONFIG_BUG=3Dn gracefully and, wit=
h
the constant condition, a sane compiler should reduce it to
__WARN_printf.

This is a regression introduced by

commit e2c719b75c8c186deb86570d8466df9e9eff919b
Author: Rob Clark <robdclark@gmail.com>
Date:   Mon Dec 15 13:56:32 2014 -0500

    drm/i915: tame the chattermouth (v2)

Reported-by: Jim Davis <jim.epost@gmail.com>
Reference: http://mid.gmane.org/CA+r1ZhgHTi7bS2irhtuSUs9aO=3DBr1dumN8=3D=
oAOeaMJDZ_ZhwBw@mail.gmail.com
Cc: Rob Clark <robdclark@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i91=
5_drv.h
index e008fa0c58da..66f0c607dbef 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -83,7 +83,7 @@
 	int __ret_warn_on =3D !!(condition);				\
 	if (unlikely(__ret_warn_on)) {					\
 		if (i915.verbose_state_checks)				\
-			__WARN_printf(format);				\
+			WARN(1, format);				\
 		else 							\
 			DRM_ERROR(format);				\
 	}								\
@@ -94,7 +94,7 @@
 	int __ret_warn_on =3D !!(condition);				\
 	if (unlikely(__ret_warn_on)) {					\
 		if (i915.verbose_state_checks)				\
-			__WARN_printf("WARN_ON(" #condition ")\n");	\
+			WARN(1, "WARN_ON(" #condition ")\n");		\
 		else 							\
 			DRM_ERROR("WARN_ON(" #condition ")\n");		\
 	}								\
--=20
2.1.4
