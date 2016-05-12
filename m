From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160512 build: 0 failures 18 warnings (next-20160512)
Date: Thu, 12 May 2016 11:55:29 +0100
Message-ID: <20160512105529.GA6261@sirena.org.uk>
References: <E1b0m8y-0002hK-8Y@optimist>
 <6651930.C0tGb7p3a4@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PEpdcbHbO3kvNF3k"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48014 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752650AbcELKzg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 May 2016 06:55:36 -0400
Content-Disposition: inline
In-Reply-To: <6651930.C0tGb7p3a4@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org


--PEpdcbHbO3kvNF3k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 12, 2016 at 11:14:35AM +0200, Arnd Bergmann wrote:
> On Thursday 12 May 2016 09:38:52 Build bot for Mark Brown wrote:

> > 	../fs/gfs2/dir.c:1021:8: warning: 'leaf_no' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > 	../fs/reiserfs/ibalance.c:1156:2: warning: 'new_insert_key' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > 	../drivers/staging/iio/adc/ad7606_spi.c:24:18: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]

> I should check these all, these may have been uncovered by my change to not
> set CONFIG_CC_OPTIMIZE_FOR_SIZE for allmodconfig, which dropped the
> -Wno-maybe-uninitialized.

> Which compiler version are you using?

For v8 it's currently aarch64-linux-gnu-gcc (Linaro GCC 5.1-2015.08)
5.1.1 20150608.

> > 	../drivers/regulator/core.c:2536:1: warning: 'regulator_can_change_voltage' is deprecated [-Wdeprecated-declarations]

> Mark, are you planning to remove the definition for 4.7 when we get there?
> If not, maybe do a change so we don't get a warning for the EXPORT_SYMBOL?

Once the users are gone the function will go.

--PEpdcbHbO3kvNF3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXNGEgAAoJECTWi3JdVIfQFkkH/1j9r8mELV3vHNeo1xET1O4i
OfpyjK4RCD6mclwIIwqHFrkW3fWp5sE7t0nGRca2zxrWyvrObDhgN57D6P9HR9Nl
0CoYTsuxk4CFMSHE3NFqemuQZMf0YTY4ZJMMv1UjmztNgdkmjRgvXLg+woGeXCVB
5v4oqoHr/rLlw7+h7X9EVOB9TW7sddbhE1SsJgQW3Ry427IjsimXYTdFRZX8sICF
ytJyEZdJq3JssUWqdZnOoGolRT7O14Iy2fR0ntdcVFk08++deKUKh+RduFstgKP6
xS5h1WXvVT8ax+O8BXPXHYT1rKZuiby9T23XX+hCweb5HU2pYZn/FbnsXLOA87Y=
=+ASf
-----END PGP SIGNATURE-----

--PEpdcbHbO3kvNF3k--
