From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the pwm tree with the regulator tree
Date: Tue, 3 May 2016 12:03:43 +0100
Message-ID: <20160503110343.GM6292@sirena.org.uk>
References: <20160503182509.42658c4f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AQYPrgrEUc/1pSX1"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:44304 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728AbcECLDw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 3 May 2016 07:03:52 -0400
Content-Disposition: inline
In-Reply-To: <20160503182509.42658c4f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>


--AQYPrgrEUc/1pSX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2016 at 06:25:09PM +1000, Stephen Rothwell wrote:

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Please send me a pull request for the regulator commits you've added.

--AQYPrgrEUc/1pSX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXKIWOAAoJECTWi3JdVIfQ06kH/ic0re39TbKEmDnkQhbamft+
ZSBbuc94TYoclTv6OAIx5bcGorU4zfZVulSc+2jYqkyG6PwZsXEO3PtqT2okRijF
lgQb3sm8V5plPgMgnEDLq0b4zV8PHyQL9iRODcPP2TNYJ39J+5VwmB7889DDfO11
C2D6yYxqzb3hFTmuWC7fAsqS2dg0jrWypjlTONTdF2+f6wfR749+frHbqqQAOJlM
8ATWNawX8d03CUa8zYtQV2EJcIOSg0xIOL3atpohPEGbO+I2yfiAJQTwDFAS2HGP
j4/q+4CUTMHEsK6bLWGoTAJHQWTRinQHtT6oT2NpKWXu4SFV/swDYpSTbByAUNM=
=Pv/L
-----END PGP SIGNATURE-----

--AQYPrgrEUc/1pSX1--
