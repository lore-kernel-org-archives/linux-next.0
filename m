From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the rockchip tree with the  tree
Date: Wed, 2 Dec 2015 11:34:25 +0000
Message-ID: <20151202113425.f22805556b3009b7b9bfa351@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__2_Dec_2015_11_34_25_+0000_b3Q2N=ZI+55qhuob"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__2_Dec_2015_11_34_25_+0000_b3Q2N=ZI+55qhuob
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

Today's linux-next merge of the rockchip tree got a conflict in
arch/arm/mach-rockchip/platsmp.c between commit 75305275a721d33ae9abf ("ARM:
use const and __initconst for smp_operations") from the arm-soc tree and co=
mmit
9def7ccfe8d5b84 ("ARM: rockchip: add support smp for rk3036") from the rock=
chip
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

diff --cc arch/arm/mach-rockchip/platsmp.c
index 938888fc55a1,5c138f9699f9..000000000000
--- a/arch/arm/mach-rockchip/platsmp.c
+++ b/arch/arm/mach-rockchip/platsmp.c
@@@ -340,7 -351,16 +351,16 @@@ static void rockchip_cpu_die(unsigned i
  }
  #endif
 =20
 -static struct smp_operations rk3036_smp_ops __initdata =3D {
++static const struct smp_operations rk3036_smp_ops __initdata =3D {
+ 	.smp_prepare_cpus	=3D rk3036_smp_prepare_cpus,
+ 	.smp_boot_secondary	=3D rockchip_boot_secondary,
+ #ifdef CONFIG_HOTPLUG_CPU
+ 	.cpu_kill		=3D rockchip_cpu_kill,
+ 	.cpu_die		=3D rockchip_cpu_die,
+ #endif
+ };
+=20
 -static struct smp_operations rockchip_smp_ops __initdata =3D {
 +static const struct smp_operations rockchip_smp_ops __initconst =3D {
  	.smp_prepare_cpus	=3D rockchip_smp_prepare_cpus,
  	.smp_boot_secondary	=3D rockchip_boot_secondary,
  #ifdef CONFIG_HOTPLUG_CPU

--Signature=_Wed__2_Dec_2015_11_34_25_+0000_b3Q2N=ZI+55qhuob
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXtdBAAoJECTWi3JdVIfQEtEH/R5PXbmXLhCKfsPKvY5/Durg
yawLQyeHeqXhwe+yG9HqJ5ethP7N/f4wjK963CPuoE78lmEWnhlbG1Cj5asPsbo3
YFkhiT+WyvaZHOLTZFz0Dodsu5OdJoCCX/hBOwJNzOLpWFeIBsO0qmi/SCIqH5vx
wimYNnFoA17M4VNrCd4e2RrqpZCGSWyg52mqvWR2EY5cqKVsw8X2yGDeK8P/yAFc
aHQ3pzL4w6mIk7/ctD+TSTtaakv/HxRy6vSy0B+5iROB2aZEB9Riw/QWNfzqN6NK
blV7c/BpxCWnRQ+uW1jY95jj3P0Trfn0epD7gVSfcHAmwA90ws2EzjTXRE+3gMs=
=dOT6
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Dec_2015_11_34_25_+0000_b3Q2N=ZI+55qhuob--
