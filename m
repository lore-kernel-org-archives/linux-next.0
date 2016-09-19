From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20160914 build: 2 failures 3 warnings (next-20160914)
Date: Mon, 19 Sep 2016 11:54:29 +0100
Message-ID: <20160919105429.GK10189@sirena.org.uk>
References: <E1bk5OS-0000Vu-1C@optimist>
 <20160914171137.GF27974@sirena.org.uk>
 <20160919102150.GI10189@sirena.org.uk>
 <2300987.vYzazfRX5F@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j/HO4hzKTNbM1mOX"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57564 "EHLO
        mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751694AbcISKys (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Sep 2016 06:54:48 -0400
Content-Disposition: inline
In-Reply-To: <2300987.vYzazfRX5F@wuerfel>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--j/HO4hzKTNbM1mOX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 19, 2016 at 12:31:04PM +0200, Arnd Bergmann wrote:

> My guess is that this is indeed the correct fix, but I don't understand
> at all what the function does, and Marcin Niestroj said the same thing,
> he just copied the code from a driver that is always built-in.

Yes, most of the code is copied from regmap-irq.  Setting the parent is
needed for edge triggered interrupts that don't latch state when
disabled but isn't needed in the general case.

--j/HO4hzKTNbM1mOX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJX38PkAAoJECTWi3JdVIfQ0bUH/1W7tEouNsjiP7IJRf0vPEWp
pMMCOxKm2a0togI2Jm7/iJ/EMihjA7smyUy0JBXVVJF+pQIRsKR+7zMRC0Lm/yNp
26o/G/qOYtASAM3XSctOJFoOYJd2dOfdX3yGNh7+8WIrDyAPElRL2/DvIGJpoBXc
Abp+dMkCObGIRPTG9c6nKfC8x18qWJ/83VF4HJEJhxO3fNzj6YaD8yQp7KTBnF0U
pR1k0QSw6Xo6khPGJq9q+/mwfyXen1WMfqF2S2TI7UfVLVQWJ7oigMJVgCltG3l9
IgYdZXk+GUsbXqPMt+ciQToPujeWl7C+jiTUClLI99SQ1ZKKA28A3PfB2bcnYuI=
=s0TX
-----END PGP SIGNATURE-----

--j/HO4hzKTNbM1mOX--
