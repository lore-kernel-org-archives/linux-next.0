From: Mark Brown <broonie@kernel.org>
Subject: Re: ASoC: cs4349: Add support for Cirrus Logic CS4349 breaks on
 multiple arch
Date: Sat, 18 Jul 2015 22:16:14 +0100
Message-ID: <20150718211614.GZ11162@sirena.org.uk>
References: <20150718192822.GB4477@windriver.com>
 <CAOMZO5AX_Aj3DR4fp9Cv+dySD41_91vZN6bnSNWy_aDzszGfhg@mail.gmail.com>
 <CAOMZO5B98KvAwJppqzi0RcCf-harrO9FXJrfRybwVZYH1r5vJw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QkVZ4Vgb6v/48gn5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57617 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750853AbbGRVQY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jul 2015 17:16:24 -0400
Content-Disposition: inline
In-Reply-To: <CAOMZO5B98KvAwJppqzi0RcCf-harrO9FXJrfRybwVZYH1r5vJw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, tim.howe@cirrus.com, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, akpm@linux-foundation.org


--QkVZ4Vgb6v/48gn5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 18, 2015 at 06:04:48PM -0300, Fabio Estevam wrote:

> -       select SND_SOC_CS4349 if I2C
> +       select SND_SOC_CS4349 if I2C && GPIOLIB

We don't need Kconfig, we need to include the relevant header for the
stubs - gpiolib is like regulator and should stub itself out.  akpm has
a fix in his tree but he hasn't sent it as a patch so I need to go fish
it out of the notification e-mail which will probably happen on Monday
or something.

Though quite why an arch would have I2C and not GPIOs...

--QkVZ4Vgb6v/48gn5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVqsIdAAoJECTWi3JdVIfQkKkIAIb+BADDVnbIqFCbQ9JOB/KZ
DnReUt6IeV1XMayGVNJXpevuWbjDX1wDOoi/XFkEd+8hmiu6xsD8chOASmZYsfcz
HXlw0bWM9UbJFlHBUDHHHerTMoIFp8Fhf59l8NptsHTk2DA3QMjmAjuH5p3nvf0x
DSJBOwbNC3xkSZT1v6+cPpSdb6hx7GB4v7C/UNGXtWwz7tjUqt3lxdds5tYKeRWS
WdC8LciPaBZkDdB+FAj83f4/lRp0P3aeaOZOzOO18cvaM0NSbUEJUDrE8+vbyeuR
9ILLukOgITpL8UpW4WdfMJoIlB9DD83EQK01bmF7N0PmA9pVK1os6p+UELafX9Y=
=uAXR
-----END PGP SIGNATURE-----

--QkVZ4Vgb6v/48gn5--
