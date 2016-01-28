From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160128 build: 4 failures 9 warnings (next-20160128)
Date: Thu, 28 Jan 2016 12:18:36 +0000
Message-ID: <20160128121836.GD6078@sirena.org.uk>
References: <E1aOjcQ-0007JT-Fl@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6WlEvdN9Dv0WHSBl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50569 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754710AbcA1MSq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 Jan 2016 07:18:46 -0500
Content-Disposition: inline
In-Reply-To: <E1aOjcQ-0007JT-Fl@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--6WlEvdN9Dv0WHSBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2016 at 10:16:02AM +0000, Build bot for Mark Brown wrote:

Today's -next fails to build at all on arm64 due to lots and lots of:

> ../arch/arm64/include/asm/page.h:64:28: error: 'READ_IMPLIES_EXEC' undeclared (first use in this function)

which looks to be due to the removal of an implicit inclusion, probably
triggered by the cleanups from "mm: warn about VmData over RLIMIT_DATA"
but I didn't investigate properly since I already identified a fairly
obvious fix.  Patch incoming.

--6WlEvdN9Dv0WHSBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWqgcbAAoJECTWi3JdVIfQ8kMH/itcopoNKuYAwtU6nI1f33Hi
Hf0+Pb6Z8ffMpYf1q9Y+tgSDbpRdZAJ3ibfovLEY3bU17c/rMAAzuYC72MbBPPj8
DIq0/tYG6LcWLOq7diu8ZtCikqBiT0HwnMQR8oJlxM+/Tc/s7+U9zYFmD8RFoeb9
3hzdg7wSVf1fpXLP9MZu0Ti7tr5+7kCm62tg6bQcUleDK6GMDGsvCFoCoE0wbHIe
EIZCUdYLGJdQ/kVpAr9O4QNBdhj70znF07XNpuODeH2KNgxTAOfS9cvesWQslX6x
PsJizwrhYglJd7lHe7/QEUOc0feSoPZ2+AXldKb2+BVbo9hnBbzTXWiJq9e14Bk=
=adCE
-----END PGP SIGNATURE-----

--6WlEvdN9Dv0WHSBl--
