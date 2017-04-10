From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20170410 build: 2 failures 3 warnings (next-20170410)
Date: Mon, 10 Apr 2017 14:13:22 +0100
Message-ID: <20170410131322.iriugmcym4zbqceg@sirena.org.uk>
References: <E1cxXQe-0006cv-TG@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xis4wekxcxevmxqi"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:35420 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752760AbdDJNNl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Apr 2017 09:13:41 -0400
Content-Disposition: inline
In-Reply-To: <E1cxXQe-0006cv-TG@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Evgeny Baskakov <ebaskakov@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Mark Hairgrove <mhairgrove@nvidia.com>, Sherry Cheung <SCheung@nvidia.com>, Subhash Gutti <sgutti@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--xis4wekxcxevmxqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 10, 2017 at 12:24:17PM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../mm/hmm.c:816:2: error: implicit declaration of function 'arch_remove_memory' [-Werror=implicit-function-declaration]

due to the recently added HMM support.  There's no such function for
arm64 but HMM is unconditionally available for all 64 bit architectures
with a MMU.

--xis4wekxcxevmxqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAljrhPEACgkQJNaLcl1U
h9AR1Af/d2lIb5CH19uu+QkgHUsv48P0ze+Ta1E6Le9cmAbTTgyazrEVt0m7hGdV
xlDYjTvXnewoOD3ui5CRJ9Nq8SORcEN/npC9zJhg1Q+MRY86N+ULGZwPM3pWuO+h
B4xU+zVdzlKdDPYM6tMzS8YMlaBYCrfpRNI+nUApW4ZwZRoVcgo9JY1hAJ3Qjbv8
PxYyuH8xOHf+pZPUnpt18BKnmfjw8yKPjnF0P5T8ogN8T1SrqXEPBHvSbySS6DXn
2ZlQLEahEuPyCmWJApXfMcN2DCv8f6WbIRZkGrSNS464s7Ik6Ome90glY6/liFfq
aFNbMriQNq4SlB5T9nDpMc0tRKxcjw==
=+55b
-----END PGP SIGNATURE-----

--xis4wekxcxevmxqi--
