From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160722 build: 1 failures 5 warnings (next-20160722)
Date: Fri, 22 Jul 2016 11:38:29 +0100
Message-ID: <20160722103829.GY6509@sirena.org.uk>
References: <E1bQXSf-0008Uu-Ej@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pEAjBjStGYT6H+Py"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:43982 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752452AbcGVKio (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Jul 2016 06:38:44 -0400
Content-Disposition: inline
In-Reply-To: <E1bQXSf-0008Uu-Ej@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matthew Wilcox <matthew.r.wilcox@intel.com>, Christoph Hellwig <hch@lst.de>, Dave Chinner <dchinner@redhat.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, xfs@oss.sgi.com, linux-arm-kernel@lists.infradead.org


--pEAjBjStGYT6H+Py
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 22, 2016 at 11:13:41AM +0100, Build bot for Mark Brown wrote:

Today's -next fails to build an ARM allmodconfig due to:

> 	arm-allmodconfig
> ERROR: "dax_do_io" [fs/xfs/xfs.ko] undefined!

due to 16d4d43595b47 (xfs: split direct I/O and DAX path) which added an
unconditional reference to dax_do_io().  DAX is explicitly disabled on
32 bit ARM due to problems with virtual aliasing caches (it's not clear
to me that it shouldn't also be disabled for arm64 for the same reason).

--pEAjBjStGYT6H+Py
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXkfekAAoJECTWi3JdVIfQGPQH/i+nFfpAASn0YIlZ+0FcuS3o
xTGm+YTGKFNWFPlb2SIKSpjno8qvP7VJ7b/RUNYLTJqbw2+URrYEUPOf0I0OTY9/
JOpiadKohd12LxzM1xDOp7RTz8k2fCtrSaAWy5HgRWtdEdtedoFILLs8E1YjQW+T
UyYegdMkf04PrcoGZjt0q1iu+7ZvT2y2KOBc+BlWy5Xf2TMeevxNZXTzzY1FCgvS
/XMFjbe4Kr/NjTuh7anZwjX0uF7upVwLJ9XRd8/u1bNM8/I1DyNP2WqAP+DITYDd
l4KYOMrngXuAxWTRclgNZ5fU8BsX02SBDvGOMF58klZHPwVYmooXAvFKXIeuO7E=
=Jr/k
-----END PGP SIGNATURE-----

--pEAjBjStGYT6H+Py--
