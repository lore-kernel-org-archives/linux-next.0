From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160215 build: 3 failures 14 warnings (next-20160215)
Date: Mon, 15 Feb 2016 14:49:01 +0000
Message-ID: <20160215144901.GL18988@sirena.org.uk>
References: <E1aVFDg-00066P-6L@optimist>
 <20160215121922.GH18988@sirena.org.uk>
 <20160215132425.GA21048@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iAzLNm1y1mIRgolD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:52370 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753299AbcBOOtL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2016 09:49:11 -0500
Content-Disposition: inline
In-Reply-To: <20160215132425.GA21048@ulmo>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org


--iAzLNm1y1mIRgolD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2016 at 02:24:25PM +0100, Thierry Reding wrote:
> On Mon, Feb 15, 2016 at 12:19:22PM +0000, Mark Brown wrote:

> > Presumably some missing select or dependency there...

> I think this is caused by the MSI IRQ domain API not being exported.
> I've just sent out a couple of patches that I've been carrying in my
> local tree for a few days now.

Yeah, that'd do it. =20

--iAzLNm1y1mIRgolD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWweVSAAoJECTWi3JdVIfQCRAH/R84196vClh2TuwSWYRUaZAx
kNKH5kE4XSrsB/mRSg5cPnyNe9FDvOrE6vu+fkxYzlJleoaLhRGJpN14HVbpShzq
JAZ8JnsM0SXDBp7S7ksES7EMoAIm0cZzy8EzxsIBrzmfVDQGot3RuDy0MrsJxWoh
SlPSIobNnroA4RCqK8XsWfSvLlr+mwHdZIOllSeDA3COdtw5Ltt2+Qof89VYCFV4
7JAwq3vJakQxiucvjmhoDmgN/QkrDS597w+jWPn4NBLkFc892pORTN6Qrw3cvWjh
byAdgOO906RPwrbVtEIGx1iuTfA8NBxgoHkJnVSKMdsa+QZlxSe5wvYNptKylc4=
=6F4m
-----END PGP SIGNATURE-----

--iAzLNm1y1mIRgolD--
