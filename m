From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160217 build: 3 failures 14 warnings (next-20160217)
Date: Thu, 18 Feb 2016 13:43:26 +0000
Message-ID: <20160218134326.GD7129@sirena.org.uk>
References: <E1aVxTQ-0000zq-U4@optimist>
 <20160217112225.GM7544@sirena.org.uk>
 <20160218113142.452fd8a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AkbCVLjbJ9qUtAXD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45146 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1426185AbcBRNnk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 18 Feb 2016 08:43:40 -0500
Content-Disposition: inline
In-Reply-To: <20160218113142.452fd8a0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "J. German Rivera" <German.Rivera@freescale.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--AkbCVLjbJ9qUtAXD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 18, 2016 at 11:31:42AM +1100, Stephen Rothwell wrote:
> On Wed, 17 Feb 2016 11:22:25 +0000 Mark Brown <broonie@kernel.org> wrote:

> > The fsl-mc code is still breaking the build in -next, can we please drop
> > the code or mark the driver as built in only until the MSI symbol
> > exports are available?  This is making it difficult to spot other
> > errors.

> I will add a merge fixup patch for the staging tree that makes
> CONFIG_FSL_MC_BUS depend on CONFIG_BROKEN.  Sorry, I should have done
> this when it first came to light.

Thanks!  It'd still be good to get an actual fix in there though...

--AkbCVLjbJ9qUtAXD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWxcp9AAoJECTWi3JdVIfQc7QH/R4M6JjJJcaVVeo5uA30id5A
4qgzZbvNmpJyZ56RKwB2uaPfyXF/icI5l7/cRPmjDmIcFE46sU5IiNagTwpv9CaF
Px+ZfpMTASKcmkpiU7WuRoywL2bQddETXa9T6II6Vc1+socSj27XQncl6L5g3ztc
bmGzzra0XFQK0irHyfSihmWe8nfcKYqZRbtG7WPXhhCwK+1VHNDUnJ8g22V6TYTC
CU6Zx93Wfhhz1XpnBdQVN8u1oDUVYo7C9Qb8b9p1yWeOBXT1iv1MaiVZv0at5jCM
UIMEMadN/s58kQlHUmivQRxxq52laTBXBYI82UhpjoBe+5domPQLb8BWhpztzBo=
=otrC
-----END PGP SIGNATURE-----

--AkbCVLjbJ9qUtAXD--
