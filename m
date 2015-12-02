From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the renesas tree with the arm-soc tree
Date: Wed, 2 Dec 2015 11:21:09 +0000
Message-ID: <20151202112109.342837c08019e632b28020fc@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_11_21_09_+0000__mzMaogIRskAgyZw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57508 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756723AbbLBLVT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 06:21:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Simon Horman <horms@verge.net.au>, Masahiro Yamada <yamada.masahiro@socionext.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--Signature=_Wed__2_Dec_2015_11_21_09_+0000__mzMaogIRskAgyZw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Today's linux-next merge of the renesas tree got a conflict in
arch/arm/mach-shmobile/Kconfig between commit e32465429490 ("ARM: use "depe=
nds
on" for SoC configs instead of "if" after prompt") from the arm-soc tree and
commit 9b5ba0df4ea4f94 ("ARM: shmobile: Introduce ARCH_RENESAS") from the
renesas tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

diff --cc arch/arm/mach-shmobile/Kconfig
index 0f25f8fa2692,4ed72b124235..000000000000
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@@ -29,10 -31,11 +31,11 @@@ config ARCH_RMOBIL
        select SYS_SUPPORTS_SH_CMT
        select SYS_SUPPORTS_SH_TMU
 =20
- menuconfig ARCH_SHMOBILE_MULTI
+ menuconfig ARCH_RENESAS
 -      bool "Renesas ARM SoCs" if ARCH_MULTI_V7
 -      depends on MMU
 +      bool "Renesas ARM SoCs"
 +      depends on ARCH_MULTI_V7 && MMU
        select ARCH_SHMOBILE
+       select ARCH_SHMOBILE_MULTI
        select HAVE_ARM_SCU if SMP
        select HAVE_ARM_TWD if SMP
        select ARM_GIC

--Signature=_Wed__2_Dec_2015_11_21_09_+0000__mzMaogIRskAgyZw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXtQlAAoJECTWi3JdVIfQrcoH/0MtYN8udhjZKcZZKkdndjy9
cBgkWMBAwVFcAoRxu6en1XCHPtZzj24x/1prJNn72PL5I8QXXOr9JiECRqc1Hchq
Jv8avaoG6IcBRYuOix4UEl7SYzDG5Fr4hViqKXBNHrUb3d8mCEL+fe1WRO6dsDrK
luBDs16PFJ4wpNQd5o/GGnqmDYX/7eakO5QF+gxGC6LcrKm/PqUAzKWECaPtGa8W
XogPDhkCWMPbnxl7wcPOjziMnQukCouZBSPHoNOE9AHJs+F/WoMo/B1qPCYVlqeD
naJ7wLH+iQrnFboI2+4ZX9Tix8L72P0y668HID7Th94i1R/TfkAwues39KNqQP4=
=yYP3
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_11_21_09_+0000__mzMaogIRskAgyZw--
