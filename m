From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build warning after merge of the regulator tree
Date: Mon, 18 Apr 2016 10:15:23 +0100
Message-ID: <20160418091523.GJ3217@sirena.org.uk>
References: <20160418134351.087823c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8jNwmpfkpox/fiJK"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:50672 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751420AbcDRJPe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Apr 2016 05:15:34 -0400
Content-Disposition: inline
In-Reply-To: <20160418134351.087823c5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


--8jNwmpfkpox/fiJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 18, 2016 at 01:43:51PM +1000, Stephen Rothwell wrote:

> In the future, please fix up all the current users of an interface
> *before* marking it deprecated.  All these extra warnings just muddy the
> "real" warnings ...

Ideally but sadly all the issues are in the graphics stack and while
they seem relatively responsive to build issues there seems to be some
strange way of working there which means that getting changes integrated
or responses when issues like this come up has always been extremely
difficult and unfortunately cut'n'paste also seems to be quite common
(most of these look like they came from one place) so something to try
to at least give people pause for thought when they introduce new
issues seems sensible.

I really wish I could figure out what's going on there.

--8jNwmpfkpox/fiJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXFKWqAAoJECTWi3JdVIfQyLYH/3iQ9OgT2l/FyyaOyxj/3IVo
tqiKoW21D60zB3tylTsNYar0wDSEBAK/HNcJi3xo8osve3jRaZ2ef86nrmfUwRto
eVYOEak4rZy776lhSBqW6ylKNpPIxLG2mXIIlSChHybSrzvYJ0Cfc4f/zwuwgrYU
nEemCEcFA+0LzrxFPVKpukFNb7IsIwx3nMWKUuHiK/qXnOkyXo+fp15TweLj4gRy
YjRRvLM8C2hjo2Kozo0Y7TlnitFtIj/bFB4XTBZ6nzfTw2lV3IvHBhhEHyHSPV4U
Kq1NB23DevWe+Qg+Kgs4RmJ5tNa+gbXEiP/PM2M1SkuolSRHiRJCcwqb+4+nT6s=
=Jg/1
-----END PGP SIGNATURE-----

--8jNwmpfkpox/fiJK--
