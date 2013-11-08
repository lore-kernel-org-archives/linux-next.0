From: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/i915/opregion: fix build error on CONFIG_ACPI=n
Date: Fri,  8 Nov 2013 10:10:31 +0200
Message-ID: <1383898231-23234-1-git-send-email-jani.nikula@intel.com>
References: <CA+r1ZhjcFpr5KKVX0pLCOP8cAyZoiYO=UyqYMJtNSV-Kt_p7xQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:29207 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751874Ab3KHIIt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Nov 2013 03:08:49 -0500
In-Reply-To: <CA+r1ZhjcFpr5KKVX0pLCOP8cAyZoiYO=UyqYMJtNSV-Kt_p7xQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org

=46ix CONFIG_ACPI=3Dn build fail

  CC      drivers/gpu/drm/i915/intel_opregion.o
drivers/gpu/drm/i915/intel_opregion.c: In function =E2=80=98intel_opreg=
ion_setup=E2=80=99:
drivers/gpu/drm/i915/intel_opregion.c:879:2: error: =E2=80=98asle_work=E2=
=80=99 undeclared (first use in this function)
drivers/gpu/drm/i915/intel_opregion.c:879:2: note: each undeclared iden=
tifier is reported only once for each function it appears in
make[4]: *** [drivers/gpu/drm/i915/intel_opregion.o] Error 1

introduced in
commit 91a60f20712179e56b7a6c3d332a5f6f9a54aa11
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Thu Oct 31 18:55:48 2013 +0200

    drm/i915: move opregion asle request handling to a work queue

Reported-by: Jim Davis <jim.epost@gmail.com>
Reference: http://lkml.kernel.org/r/CA+r1ZhjcFpr5KKVX0pLCOP8cAyZoiYO=3D=
UyqYMJtNSV-Kt_p7xQ@mail.gmail.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/intel_opregion.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_opregion.c b/drivers/gpu/drm/i9=
15/intel_opregion.c
index 91b68dc..1b2f41c 100644
--- a/drivers/gpu/drm/i915/intel_opregion.c
+++ b/drivers/gpu/drm/i915/intel_opregion.c
@@ -876,7 +876,9 @@ int intel_opregion_setup(struct drm_device *dev)
 		return -ENOTSUPP;
 	}
=20
+#ifdef CONFIG_ACPI
 	INIT_WORK(&opregion->asle_work, asle_work);
+#endif
=20
 	base =3D acpi_os_ioremap(asls, OPREGION_SIZE);
 	if (!base)
--=20
1.7.9.5
