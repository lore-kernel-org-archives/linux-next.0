From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20151221 build: 2 failures 13 warnings (next-20151221)
Date: Mon, 21 Dec 2015 15:41:49 +0000
Message-ID: <20151221154149.GK5727@sirena.org.uk>
References: <E1aAyjj-0007DR-4T@optimist>
 <201512211505.34074.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hPB2oXVi+7W5/ekT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:45044 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751042AbbLUPmF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Dec 2015 10:42:05 -0500
Content-Disposition: inline
In-Reply-To: <201512211505.34074.arnd@arndb.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org


--hPB2oXVi+7W5/ekT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 21, 2015 at 03:05:33PM +0100, Arnd Bergmann wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> Just looking at the remaining warnings/errors in linux-next:

> > Warnings:
> >         <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

> Not sure how we can improve this, the same thing seems to happen every time a new syscall gets
> introduced. The actual change is trivial, but we need a better method to sync all architectures.

Now we've got the warning count down sufficiently the autobuilders may
actually be just fine here.

> > arm-multi_v7_defconfig : PASS, 0 errors, 8 warnings, 0 section mismatches

> > Warnings:
> >         arch/arm/configs/multi_v7_defconfig:433:warning: symbol value 'm' invalid for MFD_DA9063

> I need to look into this, probably the result of a defconfig change we merged, but it's not
> clear whether the driver should be a module, or the defconfig should have it built-in.

The driver should at least support building modularly, there was a patch
sent to MFD IIRC but I guess it's not applied yet (Lee is on vacation I
believe which probably won't help).

--hPB2oXVi+7W5/ekT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWeB28AAoJECTWi3JdVIfQmzMH/AiIOl9Xix5zUyWSExg6QBsD
ZB1ZUOvkZv1KogDw2dzM54OXqEvbppzGbfaOqgHpGaaK5mQ+6AiljvB4HT7T5JyO
+/e8NIXvifX4IaZvIs/cTR4mOYe9ad2ME10fFNw4/XIIauPmYh5GUOwDg/Eosmhk
rmDMGJyxgTncC1wxoZjCn3mz3saBzN13I5Ckdwukc9x1QnLwdCs1+ljX6g3HtTPh
6slHVcmCDFQ/m7r9AwuDY0ITcjyQdi1K9nc79I+knfD+bKFa261W0dM9moy8qBVY
9SHANxCwAT7O16wimNxWXBD6LJwjhPeRPGbMppyWP7vo8v1drAhz9eEGFro65xU=
=Tb/U
-----END PGP SIGNATURE-----

--hPB2oXVi+7W5/ekT--
