From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150729 build: 2 failures 49 warnings (next-20150729)
Date: Tue, 4 Aug 2015 18:38:49 +0100
Message-ID: <20150804173849.GD20873@sirena.org.uk>
References: <E1ZKPJk-0007VU-Fg@optimist>
 <20150729124410.GE20130@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x4r6DwZcugHrY484"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:54769 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752415AbbHDRjD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2015 13:39:03 -0400
Content-Disposition: inline
In-Reply-To: <20150729124410.GE20130@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>


--x4r6DwZcugHrY484
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2015 at 01:44:10PM +0100, Mark Brown wrote:
> On Wed, Jul 29, 2015 at 12:14:36PM +0100, Build bot for Mark Brown wrote:

> Today's linux-next fails to build an arm64 allmodconfig due to:

> > 	arm64-allmodconfig
> > ../include/linux/platform_device.h:245:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> > ../include/linux/platform_device.h:250:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

> caused by c84e358718a66f76 (soc: Mediatek: Add SCPSYS power domain
> driver) which does not include module.h.  Arguably platform_device.h
> should do that, though it's only an issue if the macro is used so...

This is still breaking the build and the fix should be trivial - is
there any ETA for a fix getting into -next?

--x4r6DwZcugHrY484
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVwPioAAoJECTWi3JdVIfQVsUH/2XtUIqaoTVljdoIMk1yLOFE
yfQFEsfUK+JLF8JefKp7btC4VKi1pHSFeR1qKO2zxMejaA1gHPvge+6FDBd0S5N4
GTmqvVhgV5frqS9CKBcv/uXJu9vB9TJJBpd0lle3C0g0B2B0gimLBSwxewui3m8e
pysqHYLKMIlhwJSHGgQIMneZZP5Sa6z0O0zpBsUU1JgweT6pFNiMm9dy2Iossk6M
f2GRmw78LB5Eh5aAW7lBAvFMIQQQKyN09wMSxY/4RfFCdlkl2hcl9zx3fqJZ/+R1
eSwNN+RuO/Jh/oLbP8g62EEvrhLcDZaEzN8wi482cfn9J3Ra+6oMi+R2ASZnF4c=
=oDfJ
-----END PGP SIGNATURE-----

--x4r6DwZcugHrY484--
