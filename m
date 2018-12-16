From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the thermal tree with the kbuild tree
Date: Mon, 17 Dec 2018 10:57:15 +1100
Message-ID: <20181217105715.5da0b389@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WQXhQ.z3uvrgIA0yf=AzGEV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/WQXhQ.z3uvrgIA0yf=AzGEV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Zhang,

Today's linux-next merge of the thermal tree got a conflict in:

  drivers/thermal/Kconfig

between commit:

  17815cc6622c ("treewide: surround Kconfig file paths with double quotes")

from the kbuild tree and commit:

  3e8c4d31f8ed ("drivers: thermal: Move various drivers for intel platforms=
 into a subdir")

from the thermal tree.

I fixed it up (I used the thermal tree version of this file and added
the following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 17 Dec 2018 10:54:07 +1100
Subject: [PATCH] drivers: thermal: fixup for Kconfig string parsing tighten=
ing up

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thermal/intel/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/intel/Kconfig b/drivers/thermal/intel/Kconfig
index 9c06d4ad7c97..2e013eeb4a1d 100644
--- a/drivers/thermal/intel/Kconfig
+++ b/drivers/thermal/intel/Kconfig
@@ -55,7 +55,7 @@ config INTEL_QUARK_DTS_THERMAL
 	  underlying BIOS/Firmware.
=20
 menu "ACPI INT340X thermal drivers"
-source drivers/thermal/intel/int340x_thermal/Kconfig
+source "drivers/thermal/intel/int340x_thermal/Kconfig"
 endmenu
=20
 config INTEL_BXT_PMIC_THERMAL
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/WQXhQ.z3uvrgIA0yf=AzGEV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwW5lsACgkQAVBC80lX
0Gx+Wwf+Md4shsec2H6PMWmjwdCEbRfmgXe/a/jQThjPcPMBzrxOUA5uFQRsKhu/
7AoJFxEpNhBFAEYgS7TZlASPokpN3zbqte0i+KoGCKtFoXNd1spBI0BYT7cqD4EP
+QSEcVOrB2jPvRT+ujhLGmAhgul2jKlQya6btFYk5/ZP1eAdQoZ+r0ugu4qmudzt
WvEEV+FtmNn7NqPWb5ScAtuyb1Q3SOauGFZqi4OklveZAWd9UfTgcX32eSSLOb1p
f1KPOQxeR9i8SgNGsrNuHRdOY1gWPNRirAZ+L06jCYwr+QqcnndAc6ij/ORp1Wno
1gjZSO0xmDjttEUwzPHqXE9mmDM9JQ==
=7kxA
-----END PGP SIGNATURE-----

--Sig_/WQXhQ.z3uvrgIA0yf=AzGEV--
