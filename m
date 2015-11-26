From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20151126 build: 3 failures 15 warnings (next-20151126)
Date: Thu, 26 Nov 2015 11:32:13 +0000
Message-ID: <20151126113213.GC1929@sirena.org.uk>
References: <E1a1sVV-00079q-My@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MHoG8na4IvP3G3ze"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:49649 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750759AbbKZLc0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 26 Nov 2015 06:32:26 -0500
Content-Disposition: inline
In-Reply-To: <E1a1sVV-00079q-My@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Cashman <dcashman@google.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--MHoG8na4IvP3G3ze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2015 at 09:06:25AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allnoconfig due to:

> 	arm64-allnoconfig
> ../arch/arm64/mm/mmap.c:55:49: error: 'mmap_rnd_compat_bits' undeclared (first use in this function)

which was introduced by a combination of 8f62c06c279a3 (mm: mmap: add
new /proc tunable for mmap_base ASLR) and 9411708692954 (arm64: mm:
support ARCH_MMAP_RND_BITS).  These add an unconditional use of
mmap_rnd_compat_bits which is only defined in linux/mmap.h if
HAVE_ARCH_MMAP_RND_COMPAT_BITS is selected but that is only enabled for
arm64 if COMPAT is enabled.  Either the select needs to be unconditional
or the use needs to be.

--MHoG8na4IvP3G3ze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWVu28AAoJECTWi3JdVIfQl2cH/RF8G7CI4IASKfz11kxYdu15
ADb47oj7w23tNqKEQo+TQtQ8c6GBDPVn10Yygx0dnY7HapuWtKDf9DGXra5KQIKb
lORD2wVC3SWgqMLVCKoSaGRb0gF1/618AOsjfXREoUHEC1qQsjI3tnuSocMd18uz
4ekKUrE4WDLFRR3ti4XRQGVdCDMICV4cM4p0vxG6SyDwNpIj38kxFnRnpW4oUmfh
bNS7fcFAU+iTvamjI+b3+nRppCMeqbSbF16sOHfKJVasSuU8mddAWRTU1ML3btDp
OaHknmcSSjhVMzHhpgt6c95DDQx3lu4X+el7FACLhN+XwuADND7DbHro5Efoahw=
=IZDW
-----END PGP SIGNATURE-----

--MHoG8na4IvP3G3ze--
