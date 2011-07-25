From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: merge error in arch/arm/mm/Kconfig?
Date: Mon, 25 Jul 2011 14:23:48 +1000
Message-ID: <20110725142348.efb4e0317938c2261498db32@canb.auug.org.au>
References: <20110725041720.GA21641@S2100-06.ap.freescale.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Jul_2011_14_23_48_+1000_nSaJOPMofQsix=wa"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:32993 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751565Ab1GYEYD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jul 2011 00:24:03 -0400
In-Reply-To: <20110725041720.GA21641@S2100-06.ap.freescale.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Shawn Guo <shawn.guo@freescale.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--Signature=_Mon__25_Jul_2011_14_23_48_+1000_nSaJOPMofQsix=wa
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Mon, 25 Jul 2011 12:17:22 +0800 Shawn Guo <shawn.guo@freescale.com> wrot=
e:
>
> There is a merge error (?) causing 'make ARCH=3Darm menuconfig' fails on
> next-20110722.
>=20
> ---8<-------------
> diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
> index d490c4a..2df5504 100644
> --- a/arch/arm/mm/Kconfig
> +++ b/arch/arm/mm/Kconfig
> @@ -834,7 +834,7 @@ config CACHE_L2X0
>         depends on REALVIEW_EB_ARM11MP || MACH_REALVIEW_PB11MP || MACH_RE=
ALVIEW_PB1176 || \
>                    REALVIEW_EB_A9MP || SOC_IMX35 || SOC_IMX31 || MACH_REA=
LVIEW_PBX || \
>                    ARCH_NOMADIK || ARCH_OMAP4 || ARCH_EXYNOS4 || ARCH_TEG=
RA || \
> -                  ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_SHMOBILE ||
> +                  ARCH_U8500 || ARCH_VEXPRESS_CA9X4 || ARCH_SHMOBILE || \
>                    ARCH_PRIMA2 || ARCH_ZYNQ || ARCH_CNS3XXX
>         default y
>         select OUTER_CACHE

Yeah, I reported this on Friday and it will be fixed in today's linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Jul_2011_14_23_48_+1000_nSaJOPMofQsix=wa
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOLO/UAAoJEDMEi1NhKgbs2fQH/2Qn37UVNbJvqroE9YAY7BD+
+Bwa6qlhFCYMNJQXaljmxin8Vz5xA4gbSIZPDXuyNEIq58Gp0MqWOsPLEw6iWVJA
0hPJthMgaLqN6KuYk64CILYM6zYio7lSqxNVBt2tNZhbYuR98TFFJQGWwMdHlk2T
e1dLRFdI7ij3qcEtOryjmBCU5hC7pWQcmzEIzHuVt4W89KZf81ck56mrIGg0G2OM
Eb7LCV0PiPCHlN9zerXGOM0A0qGEVK1X6PsWASzL7aDmRLP+kmf/9YxielevnOJP
3raaflA/ZcycKNEYFMIRV32B3LasXT+u+51YRnqy+5n+C//IlO/V4iRBl1FphP4=
=nR6M
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Jul_2011_14_23_48_+1000_nSaJOPMofQsix=wa--
