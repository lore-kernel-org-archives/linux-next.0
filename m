From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150806 build: 2 failures 52 warnings (next-20150806)
Date: Thu, 6 Aug 2015 18:27:52 +0100
Message-ID: <20150806172752.GA20873@sirena.org.uk>
References: <E1ZNIul-0007IF-Ev@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="28KEV0d44fEAywNn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59631 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754254AbbHFR2F (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2015 13:28:05 -0400
Content-Disposition: inline
In-Reply-To: <E1ZNIul-0007IF-Ev@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--28KEV0d44fEAywNn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 06, 2015 at 12:00:47PM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an ARM allmodconfig with:

> 	arm-allmodconfig
> ../lib/test_user_copy.c:67:2: error: implicit declaration of function 'copy_in_user' [-Werror=implicit-function-declaration]
> ../lib/test_user_copy.c:94:2: error: implicit declaration of function '__copy_in_user' [-Werror=implicit-function-declaration]

due to 3a646f02c7 (lib/test_user_copy.c: check
__copy_in_user()/copy_in_user()) which attempts to test copy_in_user()
which doesn't appear to be defined, at least with the set of include
files and/or config options you get with an allmodconfig and not at all
as far as I can tell.

--28KEV0d44fEAywNn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVw5kXAAoJECTWi3JdVIfQru0IAIK6hWS7u5ZfuWDxdiK0RigQ
dpDAQKwRK8ijCFl4pemMy2+A2UY/YOwjh/zeutA5uHUyp1RgqnUQDFqxcvPGppDg
eGtZDLRz0vNP476qWTsMAUVoqJqBMsZOlSn6nh2aonZ4Zyjav3XOTDCbmUsud3SW
LK5IfFupqmbxY8Fz/siuex5/hv7rYpbFjLVLK4cM+TCAWHY+lybKE7G7oq6S4uSC
wibtgp+1DlO9y9eiy5axofD0FSD64e2atbatOGzJMXkN3UrOpRVuAo6vHLsbOZvg
x8P5wsJURA9tky5b68wFBJrrkxqVTGZ8smg0v3tZkdxccS1jpPVpYq7UUqAAsBI=
=CxdB
-----END PGP SIGNATURE-----

--28KEV0d44fEAywNn--
