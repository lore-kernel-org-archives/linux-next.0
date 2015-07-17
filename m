From: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: build warnings after merge of the regmap tree
Date: Fri, 17 Jul 2015 11:34:50 +0100
Message-ID: <20150717103450.GJ11162@sirena.org.uk>
References: <20150717143934.4f0ce5d7@canb.auug.org.au>
 <20150717094436.GC21939@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2IWEGlOlRvYPWKAG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:55447 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757724AbbGQKfA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2015 06:35:00 -0400
Content-Disposition: inline
In-Reply-To: <20150717094436.GC21939@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nariman Poushin <nariman@opensource.wolfsonmicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>


--2IWEGlOlRvYPWKAG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 17, 2015 at 10:44:36AM +0100, Nariman Poushin wrote:

> What is the best course of action here? I am more than happy to help with
> whatever is needed but unsure of the etiquette here and also not sure
> what I can do.

> Clearly there are some clients that need updating but they were not
> present in the regmap tree, so is the correct thing to do to merge
> in the mfd and sound-asoc tree and provide a fixup commit?

> Just let me know and I am happy to do whatever is deemed correct.

Please send patches fixing the problems you have introduced.

--2IWEGlOlRvYPWKAG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVqNpKAAoJECTWi3JdVIfQwMwH/0JZUmYSf17oNjDBCXOauOOE
xleILEd1ndzRazQNu6uDNxTByCMWbagnlv3gQbewmZj3CqaxtRwtB4D6FWegYvAr
VgRSVc+v/UxybMwKeLD0CWuHBKpUlnOPm2EzqqDmaoXmCE1yMYz9FPgmlFZYHtO/
SK2UX7akiWwDrtA+zClKNv24B2UQPpS2pLUbxt0c9ZHoG0Pib9e8biOvmOL2K0Pu
hrR8ELm/tBKt6U9Ah2bE67wUCgSgpM2FfkDzeEKIIwq6ATJtqYjLFN+U1x27bJqL
Xj1HsSHS7uWsH9ZglknVnfTso0i4DxAlrPgZ9dsbzwfK3A+iDhc78uetbFK+APU=
=gScY
-----END PGP SIGNATURE-----

--2IWEGlOlRvYPWKAG--
