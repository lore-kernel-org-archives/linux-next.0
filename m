From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the omap tree
Date: Tue, 7 Apr 2015 11:36:18 +1000
Message-ID: <20150407113618.7ddb495c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vmZb0jEfaGWvYmvxmicumGe"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59770 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752687AbbDGBgY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 6 Apr 2015 21:36:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>

--Sig_/vmZb0jEfaGWvYmvxmicumGe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Tony,

After merging the omap tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/am3517_mt_ventoux.dtb] Error 2
make[2]: *** [arch/arm/boot/dts/omap3430-sdp.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/omap3-beagle-xm.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/omap3-beagle-xm-ab.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/omap3-beagle.dtb] Error 2
make[2]: *** [arch/arm/boot/dts/omap3-devkit8000.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/omap3-cm-t3530.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/omap3-cm-t3730.dtb] Error 2
make[2]: *** [arch/arm/boot/dts/omap3-evm-37xx.dtb] Error 2
ERROR (phandle_references): Reference to non-existent node or label "omap3_=
scm_general"

ERROR: Input tree has errors, aborting (use -f to force output)
make[2]: *** [arch/arm/boot/dts/omap3-evm.dtb] Error 2

Presumably caused by commit b8845074cfbb ("ARM: dts: omap3: add minimal
l4 bus layout with control module support") interacting with commit
e52117638b79 ("ARM: dts: omap3: Add DT entries for OMAP 3 ISP") from
the arm-soc tree.

I applied the following merge fix patch for today (probably wrong, but
hopefully builds):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 7 Apr 2015 11:30:14 +1000
Subject: [PATCH] ARM: dts: omap3: fixup for merge conflict around
 omap3_scm_general

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/boot/dts/omap34xx.dtsi | 2 +-
 arch/arm/boot/dts/omap36xx.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.d=
tsi
index 7bc8c0f72ddb..4f6b2d5b1902 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -46,7 +46,7 @@
 			       0x480bd800 0x017c>;
 			interrupts =3D <24>;
 			iommus =3D <&mmu_isp>;
-			syscon =3D <&omap3_scm_general 0xdc>;
+			syscon =3D <&scm_conf 0xdc>;
 			ti,phy-type =3D <OMAP3ISP_PHY_TYPE_COMPLEX_IO>;
 			#clock-cells =3D <1>;
 			ports {
diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.d=
tsi
index 3502fe00ec7d..86253de5a97a 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -78,7 +78,7 @@
 			       0x480bd800 0x0600>;
 			interrupts =3D <24>;
 			iommus =3D <&mmu_isp>;
-			syscon =3D <&omap3_scm_general 0x2f0>;
+			syscon =3D <&scm_conf 0x2f0>;
 			ti,phy-type =3D <OMAP3ISP_PHY_TYPE_CSIPHY>;
 			#clock-cells =3D <1>;
 			ports {
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/vmZb0jEfaGWvYmvxmicumGe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVIzSWAAoJEMDTa8Ir7ZwVUIQQAIU4LF3Diqk4leo5D/QbeX91
fkvm+mhKBnfEVpkJK+pY+5IYQWR3yklbxTeznANrWYpoYxASx8Jt4xxNAygfudtt
B0l+Z/l5Njgn5TXgHD0g1o0qHfMAnIhZUqodkEbgiotmxDtsS+kxwSTuLqPA3ZhD
8Be4VEV6WOx/lmvxVgVFA69hDAwq8HJNwJqqOTkG9l+/CyrmgXqdUg2MNhjLPs0v
Rpgy1um++EilDxFfGqQqlWOTKsv5u7nN4rZQDnvcPe5PjlO5J6Oce8ODW0P6UX8E
vypzIGEc+Rv2PFHbMR6/pbeJwmZZGRIzWLzj0kK9OE1XKZ9lzclC2Tek9PRMMXUL
nW5xukwN5F/V05MHlip3RRt66l8Dj2M0zfdwbGlhQti3qNWspXFCLWLapkNAdNDF
4rmsxMrXKBWR2O/13InNlGcw/JxRMp2iNGc4sDeoaHYNwCPGkRvnzqmmMYKYHXI8
7Fb+8PUpY3HT5oY7WcEyd8B9MF70eeLX7g3lwzTDcvrjbENSOS0qBFrZna7LKKBT
CD+p/Gapybfao8IFDT3lAjjVAT3o9oOb1gk4MStoi4vYDYljbMDDya6k2hKtUj+Z
xyAktgT8YRov88fo/S3JBeBPVpJ+Zlvmg9gTr12/I2I82q2mmIgNZngTbl3gbWdb
Vx44QW1bDyGpB2TRgN7m
=ifH5
-----END PGP SIGNATURE-----

--Sig_/vmZb0jEfaGWvYmvxmicumGe--
