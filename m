From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] regulator: rk808: make better use of the gpiod API
Date: Tue, 21 Jul 2015 12:04:15 +0100
Message-ID: <20150721110415.GS11162@sirena.org.uk>
References: <20150721132945.7ffc443b@canb.auug.org.au>
 <1437461993-14860-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <CACRpkda5DrDx77514uBT+3-8svcRWQ9vONA6Dg39F5ZNPHz3rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5IDXfeaYASUQeHv7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33071 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751236AbbGULE0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Jul 2015 07:04:26 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkda5DrDx77514uBT+3-8svcRWQ9vONA6Dg39F5ZNPHz3rA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Zhong <zyw@rock-chips.com>, Sascha Hauer <kernel@pengutronix.de>


--5IDXfeaYASUQeHv7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2015 at 11:56:49AM +0200, Linus Walleij wrote:
> On Tue, Jul 21, 2015 at 8:59 AM, Uwe Kleine-K=F6nig

> > The gpiod functions include variants for managed gpiod resources. Use it
> > to simplify the remove function.

> > As the driver handles a device node without a specification of dvs gpios
> > just fine, additionally use the variant of gpiod_get exactly for this
> > use case. This makes error checking more strict.

> > As a third benefit this patch makes the driver use the flags parameter
> > of gpiod_get* which will not be optional any more after 4.2 and so
> > prevents a build failure when the respective gpiod commit is merged.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Mark, please apply this.

=2E..and reverted since it doesn't build as it's adding a use of a new API
which doesn't actually exist in Linus' tree yet (hopefully it's in
-next).  I need a tag to pull if I'm going to use this patch.

--5IDXfeaYASUQeHv7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVricvAAoJECTWi3JdVIfQNkwH/1yH8y5FrLlLscZzO31Mlh8p
XlTep6AKRmDmFTEDncHvBhbnosBqgmfSbJlJUzB9+jmPf+MdT6XdeKbwhfv6gb5z
Najaown44kC0fEQj5MuyjTtSOkNGbYgeKLgPTk6xghh/xnOXEes89g606r4SCn6B
aO90HDpP2vZqLV7cA0XYrrMMyjdArRaLXDSOSvn7xsbK+CwROKYedEykhtENTHnK
Av5+F/ID9K9XZUJJ+agiAw+0IlUv69LVlNhy0u3HbJksXgp7yBdl0FbxAFOSZhIK
//VK4cAgCA7hd1MdYDyL0zvWsNAMelVgvtCQWsMZAfF0ns73bKlOuIEn2SYSNaA=
=rO3F
-----END PGP SIGNATURE-----

--5IDXfeaYASUQeHv7--
