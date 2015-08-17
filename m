From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20150817 build: 2 failures 16 warnings (next-20150817)
Date: Mon, 17 Aug 2015 10:39:04 -0700
Message-ID: <20150817173904.GR10748@sirena.org.uk>
References: <E1ZRJRP-0003Sa-92@optimist>
 <20150818000125.2225c713@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eOjGLwyQwZ6mtm8V"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from [216.4.250.2] ([216.4.250.2]:43239 "EHLO p2012.superclick.com"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1750867AbbHQRru (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 13:47:50 -0400
Content-Disposition: inline
In-Reply-To: <20150818000125.2225c713@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org


--eOjGLwyQwZ6mtm8V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 18, 2015 at 12:01:25AM +1000, Stephen Rothwell wrote:
> On Mon, 17 Aug 2015 13:23:04 +0100 Build bot for Mark Brown <broonie@kernel.org> wrote:

> > 	arm64-allmodconfig
> > ../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
> > ../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

> > 	arm-allmodconfig
> > ../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
> > ../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

> allmodconfig builds will now need libssl-dev or the equivalent installed
> to build the host programs for the new signing code that came in the
> security tree today.

Ugh.  This is going to be broken until I get home next Monday :(

--eOjGLwyQwZ6mtm8V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV0hw3AAoJECTWi3JdVIfQOKIH/1fZuLr0aGBlv8J7fKyxY51M
/J8lllAEVTSNtQ8odybnORrS2VHJ5q3aVNv8aOjLt9PbPT9ZEu0WW7wkpLmQjWPd
Ny0kMn35IyRx7papFMpHozHZqLcU161Cp+NYP2UIubf+2w+7JOwKnrH0qxPmK4Ci
Xkng7O2zvEEf+Q+noXkHpPvODTxkvxrfKRdgrju3nCseAgF1Mg9BB6CrSqI4yPm3
61+US3m9Bv7W5Fd+hc6eKQ8HjSo6J/Pa9tEdWTQEOMbJB/c7JXQwmW2nmTDdQ0cN
BRvuIlFCpgADqqMQIlG+Sn8gfSMF2lWu6I937VJsDt651znq0T4tp9Dp+MZcrrE=
=JUOt
-----END PGP SIGNATURE-----

--eOjGLwyQwZ6mtm8V--
