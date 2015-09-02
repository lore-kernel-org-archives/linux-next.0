From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150902 build: 2 failures 71 warnings (next-20150902)
Date: Wed, 2 Sep 2015 17:15:00 +0100
Message-ID: <20150902161500.GC5313@sirena.org.uk>
References: <E1ZX9l4-0001aE-7y@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6jDZ2N1G6US2iTyc"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:48710 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619AbbIBQPM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Sep 2015 12:15:12 -0400
Content-Disposition: inline
In-Reply-To: <E1ZX9l4-0001aE-7y@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--6jDZ2N1G6US2iTyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 02, 2015 at 04:15:30PM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an arm allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/net/ethernet/broadcom/bgmac.c:1450:2: error: too few arguments to function 'fixed_phy_register'

Caused by a5597008dbc230876d (phy: fixed_phy: Add gpio to determine link
up/down) which added a new argument to the function and updated most
drivers but not the bgmac driver.

--6jDZ2N1G6US2iTyc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV5yCDAAoJECTWi3JdVIfQvrMH/A7UdhXpMLPYJ/8TvIbTQHMP
GS5YYaBTKCXGvoWHabO5Xnt2ZUq804zs6uD2KcJ54tZjKYNI05W7B8p8fV8cMwpI
0ifufWSk3Q45P9Hfue8lMEX6NNEX5sNykvm/SwM+BHmfIFVGvdazC5hxdIQefpRD
hi3nu/5pxg9xPT7p4pFRl9mQA/69o4a1fCpBgi4Q3Jq4ENE+2gpV87REwrWEHWnY
3e9VfNlFSi0ppryiTOverBGscfP9/Wo3AHqp9rzef3c2vPuhyB2V6gp6m6xNa5Xf
Nw/sEw6xuWgYCJuJWD2Zv1sBZPT8ZjKAoZXLvcTEAUinH7c3+UVvABksv9Cux0k=
=74K1
-----END PGP SIGNATURE-----

--6jDZ2N1G6US2iTyc--
