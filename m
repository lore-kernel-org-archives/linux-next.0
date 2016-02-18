From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: next-20160217 build: 3 failures 14 warnings (next-20160217)
Date: Thu, 18 Feb 2016 14:59:45 +0100
Message-ID: <20160218135945.GB3941@ulmo.nvidia.com>
References: <E1aVxTQ-0000zq-U4@optimist>
 <20160217112225.GM7544@sirena.org.uk>
 <20160218113142.452fd8a0@canb.auug.org.au>
 <20160218134326.GD7129@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:36311 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1425841AbcBRN7u (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2016 08:59:50 -0500
Received: by mail-pa0-f47.google.com with SMTP id yy13so31361659pab.3
        for <linux-next@vger.kernel.org>; Thu, 18 Feb 2016 05:59:50 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160218134326.GD7129@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 01:43:26PM +0000, Mark Brown wrote:
> On Thu, Feb 18, 2016 at 11:31:42AM +1100, Stephen Rothwell wrote:
> > On Wed, 17 Feb 2016 11:22:25 +0000 Mark Brown <broonie@kernel.org> wrot=
e:
>=20
> > > The fsl-mc code is still breaking the build in -next, can we please d=
rop
> > > the code or mark the driver as built in only until the MSI symbol
> > > exports are available?  This is making it difficult to spot other
> > > errors.
>=20
> > I will add a merge fixup patch for the staging tree that makes
> > CONFIG_FSL_MC_BUS depend on CONFIG_BROKEN.  Sorry, I should have done
> > this when it first came to light.
>=20
> Thanks!  It'd still be good to get an actual fix in there though...

I'll ping Greg on the two patches that I sent on Monday.

Thierry

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWxc5RAAoJEN0jrNd/PrOh1q8QALvtmzzNLCMjZzJ8IsQ+9TWX
6ywXN0HmFca3dLpousRP79oHadhZhyEW92oUO4grqSqmFHK/cak+agUx1WLP7wZa
up0MxMZRq+V1MCansYR72BCd8FPNgGpl88JljN7lsRYCuRZWeZoMm57/OcPsjtUU
zNX6ZpYYwVHWZGAlqzRo7vS/kw/+OnocGfwTc07KBjZ0nPuKEO1TsgRGni85Cdp7
8NCWEYePNex67MeoEZBVfIdxA6VkKVxmW6zhWscvS9XNjVBbaA8oFosffmRqL5Ym
Ab3HPy1GZ45fcYe8CsTeraRXjTLbWqupNnGWV2YlADq+Zgo5j5JuDRGX1OpmEJhm
26yncjzNZ8H1CLsGxQ+27lezfnVjVNDi3P1XwrQQHn3vZJJHklzVwxizXf3Sv4zd
TAcz6y25AAjPdRh2t73dgyBbP328lKusmG7K0Jfhc1wYDGnyc3BE3OENTzsuPdak
7tGxPz6vnE8MHXpthlbktzXxZ8u9JWvlUe2mt5pAQwzCpQqRuZDc9PZSi6CItJ82
qeoj2u2lepR2W1bzUd/zOa5bsfilKZG15n0qOw0rOc2ggmEOmGCrcXmvWEoNVuCL
3BnxDYveht7OFpqpmkO+2I+0edlHisKcQ9kw5wEFI0WAtiXQ4muX7S6q2tJw+8vz
4Zh7jLfW0wOLUez9aPhS
=P3sq
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
