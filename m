From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: next-20160215 build: 3 failures 14 warnings (next-20160215)
Date: Mon, 15 Feb 2016 17:53:54 +0100
Message-ID: <20160215165354.GA25830@ulmo>
References: <E1aVFDg-00066P-6L@optimist>
 <20160215121922.GH18988@sirena.org.uk>
 <20160215132425.GA21048@ulmo>
 <20160215144901.GL18988@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:34253 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752123AbcBOQx5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 11:53:57 -0500
Received: by mail-wm0-f45.google.com with SMTP id b205so75456345wmb.1
        for <linux-next@vger.kernel.org>; Mon, 15 Feb 2016 08:53:57 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160215144901.GL18988@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 02:49:01PM +0000, Mark Brown wrote:
> On Mon, Feb 15, 2016 at 02:24:25PM +0100, Thierry Reding wrote:
> > On Mon, Feb 15, 2016 at 12:19:22PM +0000, Mark Brown wrote:
>=20
> > > Presumably some missing select or dependency there...
>=20
> > I think this is caused by the MSI IRQ domain API not being exported.
> > I've just sent out a couple of patches that I've been carrying in my
> > local tree for a few days now.
>=20
> Yeah, that'd do it. =20

I just noticed that the build still fails after fixing those up:

	./drivers/firmware/efi/libstub/lib.a(lib-fdt_ro.stub.o): In function `__ef=
istub_fdt_stringlist_count':
	__efistub_fdt_ro.c:(.init.text+0xe48): undefined reference to `__efistub_s=
trnlen'
	__efistub_fdt_ro.c:(.init.text+0xe48): relocation truncated to fit: R_AARC=
H64_CALL26 against undefined symbol `__efistub_strnlen'
	./drivers/firmware/efi/libstub/lib.a(lib-fdt_ro.stub.o): In function `__ef=
istub_fdt_stringlist_search':
	__efistub_fdt_ro.c:(.init.text+0xf18): undefined reference to `__efistub_s=
trnlen'
	__efistub_fdt_ro.c:(.init.text+0xf18): relocation truncated to fit: R_AARC=
H64_CALL26 against undefined symbol `__efistub_strnlen'
	./drivers/firmware/efi/libstub/lib.a(lib-fdt_ro.stub.o): In function `__ef=
istub_fdt_stringlist_get':
	__efistub_fdt_ro.c:(.init.text+0x1014): undefined reference to `__efistub_=
strnlen'
	__efistub_fdt_ro.c:(.init.text+0x1014): relocation truncated to fit: R_AAR=
CH64_CALL26 against undefined symbol `__efistub_strnlen'

That happens on the ARM64 defconfig as well, but I have no idea what's
going on here.

Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWwgKfAAoJEN0jrNd/PrOhNpoP/jKwhHYy+wuOtVeF0RUiHLWi
ppSWGhXizLL/PIQpuFHGs0RJDB8aBys40vTU6E7HeVHI4NGVfxsg2dMEMS2xS8H/
BGUfV4iOCoarUjV9J0p+MAEub3f3ubh3ZALcyz1LrhHgdkHokeoCcK0iaKmRhhZN
//9xdVPaGSO+SNH9stS7inRba7t3H+0H3V97YS2AJxv96F8Ho+U6j2UUtIfj3R37
cTFKPEEqHgbgRwcLdIwzaif3/dFqjjpxqdx+iEeC8vlYFNK0foVJemzY+ac/1ea6
wG2unLLsnIz81CWCMMTbuAo7HGius3wB7lGYpW6vOwy1qDtGJarKFdJ1WthsYcdr
i4IQse9HsjM0zvH2fxNKdxZsrXnJePyo1aPv/zbIeyMX5jGmqHhRUhwEOv7n2/+H
PWciIKWktuiShJV8/KgsO8oyogsuovBPLkK8zVwU8TUYfXxC+EDKRCd60j8oyBV8
IEqoCn744oFxol54GN+gXVVSFGX7dsfl9dc/j/2U36usTtvH6mEclSkofQrPWQ/k
ri5BwSk7ZcJwbdFyo1qLGKP8xoedErrmENMgQYmNb3R/W/fKk673vpQQG3qEFzkO
ELoPw6vKV92LYWGlHZeWIUdDuNHCTP39mHWaVcWrLxzFNCHRQrktMM22dITttgK2
opd1THvpZ/TaHsyv626l
=w+pA
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
