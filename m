From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the drm-panel tree
Date: Tue, 31 Mar 2015 23:03:55 +1100
Message-ID: <20150331230355.747c30a0@canb.auug.org.au>
References: <20150325172056.20be6ba2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9qQJmfZ39xQl6r9z=+m5zRO"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36796 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751931AbbCaMED (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 08:04:03 -0400
In-Reply-To: <20150325172056.20be6ba2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

--Sig_/9qQJmfZ39xQl6r9z=+m5zRO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 25 Mar 2015 17:20:56 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-panel tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> drivers/video/fbdev/Kconfig:5:error: recursive dependency detected!
> drivers/video/fbdev/Kconfig:5:	symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:34:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_H=
ELPER
> drivers/gpu/drm/Kconfig:28:	symbol DRM_KMS_HELPER is selected by DRM_PTN3=
460
> drivers/gpu/drm/bridge/Kconfig:6:	symbol DRM_PTN3460 depends on GPIOLIB
> drivers/gpio/Kconfig:34:	symbol GPIOLIB is selected by ARCH_REQUIRE_GPIOL=
IB
> drivers/gpio/Kconfig:23:	symbol ARCH_REQUIRE_GPIOLIB is selected by MCU_M=
PC8349EMITX
> arch/powerpc/platforms/Kconfig:350:	symbol MCU_MPC8349EMITX depends on I2C
> drivers/i2c/Kconfig:7:	symbol I2C is selected by FB_DDC
> drivers/video/fbdev/Kconfig:59:	symbol FB_DDC is selected by FB_CYBER2000=
_DDC
> drivers/video/fbdev/Kconfig:374:	symbol FB_CYBER2000_DDC depends on FB_CY=
BER2000
> drivers/video/fbdev/Kconfig:362:	symbol FB_CYBER2000 depends on FB
>=20
> Introduced by commit 6a43766f6ef3 ("drm/bridge: ps8622 and ptn3460
> depend on gpiolib").

This is still going on ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/9qQJmfZ39xQl6r9z=+m5zRO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGo0wAAoJEMDTa8Ir7ZwVYewP/RKsXnZptfViyPhN2GX73oRa
mr5zFINgFNTsCszmnR6cozHHsjhISzXq6uuj+igotqPy10kn99KYmCaasARjYjC3
i0gjD5Rx+P4h+4rNBQtdmFbRmfOHDQdvJwL2I5BRWtesCnNOJQSRz102vr/gTOwS
Zuz2orBF+UtZBljva8dwexOGPAq5PwTP/MpA46lMAIKOaBVLNdmU1MpPqjgZgsla
iNBHBP1hq7TkYAE+ZpmfGBijmU0Sr9yam/+X04EKqJ/tQ+Kawc80UjneSbk56YFf
DH3SFIb7UlCBllkrRQbs5VpBsF3hj+Y69EFa5pPt14CtNns540f4z1zpzMYbXczL
uFOkGwiX/4s6Oz6LHWqxNuUszR/EdG6fanQWhm7BTtO3CRo6Bwogrl1W5mwCTXE/
r2uLQnHgFd5ZRST7iIxzlI9zchoRgK3doaMYcD6W1DBlytUdZqB2xukaQ6YGM3ks
Me/nTqwpuAEt4j2zGCNIcCO1QoUmPeKAXoM8QY1qnPvV8UGderFveEUFvoAcxAqT
yAEnxeOlXuN9kI9XTaDUO+C7ZP6LU3k5y41gX/Y7If5c3/3LsC7ICUlAIxpDuqlt
btvwjuEk8LE8BeBTEeQqXHn4sNcz2lpdfDVwk8SeqDK2jDXXnWv1Slv+CHeq3/H8
FDHJhdPksEZHcuEIhq1B
=mdiz
-----END PGP SIGNATURE-----

--Sig_/9qQJmfZ39xQl6r9z=+m5zRO--
