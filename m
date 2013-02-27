From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the renesas tree with Linus' tree
Date: Wed, 27 Feb 2013 12:17:06 +1100
Message-ID: <20130227121706.899a861e9ab868621e3a968b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__27_Feb_2013_12_17_06_+1100_.sfooUwP/xbGQw25"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hideki EIRAKU <hdk@igel.co.jp>, Joerg Roedel <joro@8bytes.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Wed__27_Feb_2013_12_17_06_+1100_.sfooUwP/xbGQw25
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Simon,

Today's linux-next merge of the renesas tree got a conflict in
arch/arm/mach-shmobile/setup-sh73a0.c between commit 9a27dee73f55 ("ARM:
mach-shmobile: sh73a0: Add IPMMU device") from Linus' tree and commit
73b21f40b61c ("ARM: shmobile: sh73a0: Do not use early devices with DT
reference") from the renesas tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-shmobile/setup-sh73a0.c
index bdab575,6e80c5d..0000000
--- a/arch/arm/mach-shmobile/setup-sh73a0.c
+++ b/arch/arm/mach-shmobile/setup-sh73a0.c
@@@ -781,36 -781,7 +782,36 @@@ static struct platform_device pmu_devic
  	.resource	=3D pmu_resources,
  };
 =20
 +/* an IPMMU module for ICB */
 +static struct resource ipmmu_resources[] =3D {
 +	[0] =3D {
 +		.name	=3D "IPMMU",
 +		.start	=3D 0xfe951000,
 +		.end	=3D 0xfe9510ff,
 +		.flags	=3D IORESOURCE_MEM,
 +	},
 +};
 +
 +static const char * const ipmmu_dev_names[] =3D {
 +	"sh_mobile_lcdc_fb.0",
 +};
 +
 +static struct shmobile_ipmmu_platform_data ipmmu_platform_data =3D {
 +	.dev_names =3D ipmmu_dev_names,
 +	.num_dev_names =3D ARRAY_SIZE(ipmmu_dev_names),
 +};
 +
 +static struct platform_device ipmmu_device =3D {
 +	.name           =3D "ipmmu",
 +	.id             =3D -1,
 +	.dev =3D {
 +		.platform_data =3D &ipmmu_platform_data,
 +	},
 +	.resource       =3D ipmmu_resources,
 +	.num_resources  =3D ARRAY_SIZE(ipmmu_resources),
 +};
 +
- static struct platform_device *sh73a0_early_devices_dt[] __initdata =3D {
+ static struct platform_device *sh73a0_devices_dt[] __initdata =3D {
  	&scif0_device,
  	&scif1_device,
  	&scif2_device,

--Signature=_Wed__27_Feb_2013_12_17_06_+1100_.sfooUwP/xbGQw25
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJRLV6SAAoJEECxmPOUX5FEsUgQAJRc1Oxlg1iEOV7nZktf1/g1
Qu8hDCK68ZFOm0Cv7SYqTAmaU/nICrFx7lR/ZJASvfM074kSydef5I4xXlC1UdTe
b9hMD1T18FO9cgVvWx/lX59RAoX8mmWl3/K0nnmYJ9oz+h4qJHzrODpz/1DJXQcI
+sTyNdb79LCPX6J4CsJ6PyEix8vt9UBEc8s3m7Cu/Oq0ie3tnDe0qLENRrqWaSEU
wUmY6zKQwam2q2r2/0ewfJ+m1fVmOK3PLXI4ypd/LxiKoYyPAJr4GkHhUJ/mfqVh
qBBE7uR5WYyH96bmJrO6KRWFoNpxbKuXSX4PTGq0CSsmSWvOOf7dvEntPvUQQquF
AEwu9fmC01eRVkVT4JjsabY82mRizwUdlUXjJcIkEYnuwQ0wP3tSfEOfD4Wp162r
XIOIi/8jGhsGLsNVNqvGSzZkQOimh9xHn+IRPDaFZIibZK7l349+CuhabmU0j3TV
L1o4x/7xUGuzyIPQHD2IBmx7C4d/JRubEAiELzKsntHae906zYjE5Zkz20CHOcCc
Pne+QWm/o5RWiC8SNYwbjSbjQaqJhaTs3NnNW3QOPENgqXd7sABNBSbuNuevq1EP
yovi+XkHhJsKzD+UDHCZxTf4GpGsdOW1/vIw3xslrjEAaioRcgGRQBWtmp+PbPgm
ewjsVkL51w6nuuIWkefV
=Be28
-----END PGP SIGNATURE-----

--Signature=_Wed__27_Feb_2013_12_17_06_+1100_.sfooUwP/xbGQw25--
