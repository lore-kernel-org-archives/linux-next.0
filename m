From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Wed, 2 Dec 2015 11:12:44 +0000
Message-ID: <20151202111244.b7ee49ee06b4a95e407e740d@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_11_12_44_+0000_mvCciUZGhjheqHCs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, gregory.clement@free-electrons.com, linux-arm-kernel@lists.infradead.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__2_Dec_2015_11_12_44_+0000_mvCciUZGhjheqHCs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mvebu tree got a conflict in  between commit
377524dc4d77f50e ("ARM: mmp: move into ARCH_MULTIPLATFORM") from the arm-soc
tree and commit 5f4423af9dd17 ("ARM: orion: multiplatform support") from the
mvebu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5a328472bd8c..882f5f33bc7d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -490,46 +490,6 @@ config ARCH_IXP4XX
 	help
 	  Support for Intel's IXP4XX (XScale) family of processors.
=20
-config ARCH_DOVE
-	bool "Marvell Dove"
-	select ARCH_REQUIRE_GPIOLIB
-	select CPU_PJ4
-	select GENERIC_CLOCKEVENTS
-	select MIGHT_HAVE_PCI
-	select MVEBU_MBUS
-	select PINCTRL
-	select PINCTRL_DOVE
-	select PLAT_ORION_LEGACY
-	help
-	  Support for the Marvell Dove SoC 88AP510
-
-config ARCH_MV78XX0
-	bool "Marvell MV78xx0"
-	select ARCH_REQUIRE_GPIOLIB
-	select CPU_FEROCEON
-	select GENERIC_CLOCKEVENTS
-	select MVEBU_MBUS
-	select PCI
-	select PLAT_ORION_LEGACY
-	help
-	  Support for the following Marvell MV78xx0 series SoCs:
-	  MV781x0, MV782x0.
-
-config ARCH_ORION5X
-	bool "Marvell Orion"
-	depends on MMU
-	select ARCH_REQUIRE_GPIOLIB
-	select CPU_FEROCEON
-	select GENERIC_CLOCKEVENTS
-	select MVEBU_MBUS
-	select PCI
-	select PLAT_ORION_LEGACY
-	select MULTI_IRQ_HANDLER
-	help
-	  Support for the following Marvell Orion 5x series SoCs:
-	  Orion-1 (5181), Orion-VoIP (5181L), Orion-NAS (5182),
-	  Orion-2 (5281), Orion-1-90 (6183).
-
 config ARCH_KS8695
 	bool "Micrel/Kendin KS8695"
 	select ARCH_REQUIRE_GPIOLIB

--Signature=_Wed__2_Dec_2015_11_12_44_+0000_mvCciUZGhjheqHCs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXtIsAAoJECTWi3JdVIfQPOMH/2v1WMEl6Y0GWjk6N8nlEw7U
uVgPwg9QYZvJCkNdHKAqzGfQ1sNEYamfn77lkeDNzjV6US2RxurDQqvp+BdYdbEb
TOzIHoUKdWbN0tJ3pjpY3PDIBPASBQPrnTZcvxc+KfwZgU411UyZLhSoztt//L8/
BL1VW0oJ2C+uWHTtBxyjs9Gb1Z6czOPPXxx3ZWD3SdK3ABw7b0WXSiso+/7SxMLB
Iw3dhO8GvxMrDAcegtMC2+qWAVhTHwa/23vQbNk+5hQETuxfQGAgYnAEBOrfN4db
tzvrdgWZlvEn4RmimXmej1bjtxbjpqJaBTm1X7+qSAliUUjdS6IFd+aCFW2BqkQ=
=iWvq
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_11_12_44_+0000_mvCciUZGhjheqHCs--
