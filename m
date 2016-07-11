From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160711 build: 3 failures 10 warnings (next-20160711)
Date: Mon, 11 Jul 2016 19:31:13 +0100
Message-ID: <20160711183113.GH3701@sirena.org.uk>
References: <E1bMZki-0001u7-VI@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37452 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752131AbcGKSbY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Jul 2016 14:31:24 -0400
Content-Disposition: inline
In-Reply-To: <E1bMZki-0001u7-VI@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 12:51:57PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build on all arm64 configs with:

> ../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offse=
ts.h: No such file or directory
> ../arch/arm64/include/asm/vdso.h:30:36: fatal error: generated/vdso-offse=
ts.h: No such file or directory

due to 90f777beb788 (arm64: Fix vdso-offsets.h dependency) when built
=66rom a completely clean tree (eg, after make distconfig).  Building from
a non-clean environment does work, as does reverting that commit.  The
dependencies required to ensure that the header gets generated before
it's used aren't present so make doesn't figure out the ordering
correctly.

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXg+XwAAoJECTWi3JdVIfQAcEH/izBpl30dCRVNMjrWZXXPpPC
WrfGNKQnMSlf0u35FJWJemFCvihLKDH2fG29cpeI6/XMEQvWO1QuZd3au1XaTD8q
MtOyNGwdHtG5XoSScHBkqsvyhfjQ8SmLQO3XojHvHrgu8mja2TUb9KU19maank9i
v15kcryB0A0LTkHr0QDMMYeDbwm7QkMF/8ewZL4oW7FmNKdDUS6IXjHYz0CbKgh0
U1wt10JgHiKHFOit5r8HKTQ1yD675by6fQ0M2RlULqjt+QWqGcU04UAd9uSx5JMV
rfSwZ3w+G7GGRz7XxMeMlx1DLeHBmymM+/9HSnMehj35bBM7kVWzK6o6kaVLjyg=
=5Laq
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--
