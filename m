From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the mips tree
Date: Tue, 31 Mar 2015 23:35:43 +1100
Message-ID: <20150331233543.5adbfe3a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/u20tFzYddqr.4vo1QQF/vnW"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40311 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751137AbbCaMfw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 08:35:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joshua Kinard <kumba@gentoo.org>

--Sig_/u20tFzYddqr.4vo1QQF/vnW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
arch/mips/sgi-ip32/ip32-platform.c between commit 2045a53b8e3f ("MIPS:
IP32: ip32-platform is not a module") from the mips tree and commit
8076ee8258d6 ("mips: ip32: add platform data hooks to use DS1685
driver") from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/mips/sgi-ip32/ip32-platform.c
index 94191a19588d,ec9eb7f3c628..000000000000
--- a/arch/mips/sgi-ip32/ip32-platform.c
+++ b/arch/mips/sgi-ip32/ip32-platform.c
@@@ -97,10 -108,38 +107,34 @@@ static struct resource ip32_rtc_resourc
  	}
  };
 =20
- static __init int sgio2_cmos_devinit(void)
+=20
+ /* RTC registers on IP32 are each padded by 256 bytes (0x100). */
+ static struct ds1685_rtc_platform_data
+ ip32_rtc_platform_data[] =3D {
+ 	{
+ 		.regstep =3D 0x100,
+ 		.bcd_mode =3D true,
+ 		.no_irq =3D false,
+ 		.uie_unsupported =3D false,
+ 		.alloc_io_resources =3D true,
+ 		.plat_prepare_poweroff =3D ip32_prepare_poweroff,
+ 	},
+ };
+=20
+ struct platform_device ip32_rtc_device =3D {
+ 	.name			=3D "rtc-ds1685",
+ 	.id			=3D -1,
+ 	.dev			=3D {
+ 		.platform_data	=3D ip32_rtc_platform_data,
+ 	},
+ 	.num_resources		=3D ARRAY_SIZE(ip32_rtc_resources),
+ 	.resource		=3D ip32_rtc_resources,
+ };
+=20
+ static int __init sgio2_rtc_devinit(void)
  {
- 	return IS_ERR(platform_device_register_simple("rtc_cmos", -1,
- 						      sgio2_cmos_rsrc, 1));
+ 	return platform_device_register(&ip32_rtc_device);
+=20
  }
 =20
- device_initcall(sgio2_cmos_devinit);
+ device_initcall(sgio2_rtc_devinit);
 -
 -MODULE_AUTHOR("Ralf Baechle <ralf@linux-mips.org>");
 -MODULE_LICENSE("GPL");
 -MODULE_DESCRIPTION("IP32 platform setup for SGI IP32 aka O2");

--Sig_/u20tFzYddqr.4vo1QQF/vnW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGpSkAAoJEMDTa8Ir7ZwVH+cP+gLVphqUuSvKO82YxZNrIBOu
H091T/soeHDniNEOqiwhDIFGChlJJULOHLj3c3HhzWiBS5uS3F5rnVA7UAjBtotc
ioEvkcb9mseC+6UorsmFTaMQV9T1sVgslI2dDFJ3tEQfCvdDH3jjc8eH4KmEn+dI
b0JdJUsXCJbwWetFt6BrBNKvVTyb01zS31Uy4N6oSvw20TrycvJeKuJfC7tz8sjP
HTTHrlQQ87be+qVykWa3SWTCsgJPCKF0KpA00z/kQ74o2Dnqz78um9s+puLV2On6
D1Mg9UR7Sy0Un+DoOj70J4fKhlt/N16V84hA2ZE0sdkI4aUUNi81A6XZEgZ8OuYW
/6gdQtBbwRSVtLyaGx+n+WzKJ14gsLndHh/LVn6/gwcKwkF/UAX1iexOHWifUITo
u3qqMpLeP8eOUOmQPaG8jWbMgcBPt+dO/7qmWOFKRIvOdoS0Rw0s4+6ixesUKjge
usVDoQqTlGX5jYJdcnii5fuvHK2z/R2DOwflo3OWpAeOY4srD/PdkvPUOxqHHbVz
NGjB4cCpWN8YqdgiXyrAw/FItxU+kKCvAJHok2iei5KmgUeue5W783gptPI/iuXb
k1Xyyd3ixbWNVznHC/6UcnIgXqAi96tk38ADol/ccuTWzIyUu9prQvn1j6oNN1pj
V+FAt1jIVei3Rc77I0Xy
=kTS8
-----END PGP SIGNATURE-----

--Sig_/u20tFzYddqr.4vo1QQF/vnW--
