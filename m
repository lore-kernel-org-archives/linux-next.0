From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150729 build: 2 failures 49 warnings (next-20150729)
Date: Wed, 29 Jul 2015 13:44:10 +0100
Message-ID: <20150729124410.GE20130@sirena.org.uk>
References: <E1ZKPJk-0007VU-Fg@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45085 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751228AbbG2Moi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2015 08:44:38 -0400
Content-Disposition: inline
In-Reply-To: <E1ZKPJk-0007VU-Fg@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, Daniel Kurtz <djkurtz@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>


--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2015 at 12:14:36PM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an arm64 allmodconfig due to:

> 	arm64-allmodconfig
> ../include/linux/platform_device.h:245:1: error: type defaults to 'int' in declaration of 'module_init' [-Werror=implicit-int]
> ../include/linux/platform_device.h:250:1: error: type defaults to 'int' in declaration of 'module_exit' [-Werror=implicit-int]

caused by c84e358718a66f76 (soc: Mediatek: Add SCPSYS power domain
driver) which does not include module.h.  Arguably platform_device.h
should do that, though it's only an issue if the macro is used so...

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVuMqZAAoJECTWi3JdVIfQfMgIAIN6Nt4ab8F/qomeMbtG+Zxy
U01KVvo8HKPij2/QWbBcKrtsRBjQ900ekP5c5wcU8ealju0v+V1tvThJFHndrSln
YC16gB9/xhhhZPkKOTrXmxv7Q1j7/G6wRHLBrwEHcUqFEQGcDQKxDRNPZAzeXpsR
xpQPDZAbZR2gVrzLbGiT2svsoMQvV7R7G6Yo/+AeDhIfjcrzek8lqofVPun6pRFm
Zx1qYoSd+q4stqBpq0ojFha63t5yZOHSofk6xoc3BedDL2B58MiiejJTcbUlH392
HE5kTfMlupoSZYExe6hV1kzpTOu5w0XCGkEZL4PObIoHNWawMyomSPj0v9bf6eI=
=Kqno
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
