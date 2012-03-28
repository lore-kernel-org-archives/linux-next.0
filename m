From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: pxa: fix build failure for regulator consumer in
 em-x270.c
Date: Wed, 28 Mar 2012 16:27:44 +0100
Message-ID: <20120328152743.GW3232@opensource.wolfsonmicro.com>
References: <CAP=VYLp-weNj35OHtmZ6pf5-t7OUxWREeu8r5sSOLhFYu0CppQ@mail.gmail.com>
 <1331244366-6147-1-git-send-email-paul.gortmaker@windriver.com>
 <4F732C97.2030804@compulab.co.il>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w3FC1ngOohd+pYSp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51605 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756518Ab2C1P1t (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 28 Mar 2012 11:27:49 -0400
Content-Disposition: inline
In-Reply-To: <4F732C97.2030804@compulab.co.il>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Igor Grinberg <grinberg@compulab.co.il>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, haojian.zhuang@gmail.com, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org


--w3FC1ngOohd+pYSp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 28, 2012 at 05:21:59PM +0200, Igor Grinberg wrote:
> On 03/09/12 00:06, Paul Gortmaker wrote:

> > +REGULATOR_CONSUMER(ldo3, "reg-userspace-consumer", "vcc gps");

> If you make this:
> REGULATOR_CONSUMER(ldo3, NULL, "vcc gps");

> > +REGULATOR_CONSUMER(ldo19, "reg-userspace-consumer", "vcc gprs");
>=20
> and this:
> REGULATOR_CONSUMER(ldo19, NULL, "vcc gprs");

These don't look like good fixes, you should be specifying the
dev_name() for the consumer device?  Presumably it's two separate
consumers and should be .0 and .1 or something?

--w3FC1ngOohd+pYSp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPcy2fAAoJEBus8iNuMP3dY8MP/3UzQyoZe+rtc+/zVu0JjPeI
RElvgRN4a4k4XUKgiVKpy6I4HKLzRC+xxaCtLOGaZMqBcwzn699oNDAZCLMsOw8R
zxGydBSpykHVCltfyw1SUnkYWF9LLlZWiXiQnFL/x8JAsbGr3Ns7/C5Tbvcm05i5
FheymQB929lnzw38uoyq+VhsAza9zJkQv6sgN5QiG3AcSw5zvvU0Gav7lrrUkxdR
ceqHujB6XBMiUm/QRKt+0MHeK9Jhq3cROyasJt5lWRu2nH9vkXUsPTQhvSBzEmlU
F1VhA+CYZroJ8wQc8p4atGQmfkTrW+rkBiMp7UHESaJNYAlL5oWiJFVnk/L4SIHi
71SgZgfs6BDVrYaS4thzmrMj3XI+Dlkhpb60Oh0KzqDoIaNMtm51FP3NMtdu6luc
x67WVle0w7frqkTRdnTiD3eEJSxQaJmEGUbc+PtpBC1RXTX4i7sHgsGlM+t+K6mx
J5vSI6J+702euYMSa44PvLqtDHidEL+ep/1jsqe3pP/e+U649a3XuCy+lzA5Yos7
0HE4WIYDLyGb3wCewo3/iu/9L+x8i/Q2e+rV2DOsX3yadSDT616ys4GG74tu6oja
I7V1C5hVXc2y9uCYXvxVOqz6/qDRS2S7Ssi2NORL8pa9Q+zcADkPipU0acr+JA2p
qlSoYdV3AB9oKF/zBeXf
=qlbA
-----END PGP SIGNATURE-----

--w3FC1ngOohd+pYSp--
