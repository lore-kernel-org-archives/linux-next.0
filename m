From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: fix for "error: implicit declaration of function 'devres_alloc'"
 in Mar9 tree
Date: Sun, 11 Mar 2012 12:48:47 +0000
Message-ID: <20120311124846.GA6081@opensource.wolfsonmicro.com>
References: <4F5A1DBC.3090701@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:44879 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751965Ab2CKMst (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Sun, 11 Mar 2012 08:48:49 -0400
Content-Disposition: inline
In-Reply-To: <4F5A1DBC.3090701@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 09, 2012 at 10:11:56AM -0500, Paul Gortmaker wrote:

> drivers/base/regmap/regmap.c:421: error: implicit declaration of function 'dev_err'
> make[4]: *** [drivers/base/regmap/regmap.o] Error 1

> This is caused by commit 19694b5ea1d3 which just appeared in today's next
> tree exposing another implicit device.h user.  Just a quick note that I'll
> take care of it by adding regmap.c to the below commit.

No, it's not caused by that - in the subsystem tree there's an explicit
inclusion of linux/device.h in the public header which is what is being
relied on here.  You've gone and deleted that inclusion without CCing
the patch to the subsystem and now you're sending a fix again without a
CC to either me or the relevant list, and without even a mention in the
subject line.

In order to avoid bisection breakage I've applied one of the several
fixes for this that were sent to me today, please drop your change.

This stuff would go a lot more smoothly if you were to at least let
people know when you make changes, especially when issues introduced by
your changes get noticed.

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPXJ8mAAoJEBus8iNuMP3dKWEP/ArMAGq097+3PMIkLK8CS9Aq
21S5DBEHn6M+eTr4Ha1VPZMqaVtK9aDJdSXZFK1pUqblQ0gW0L19u3tqFVf3vcUB
UkUa/QooUzIYwCbZec9/EJZ1szq1yvNrFh4wM9iAhGir3oazMq1zAmojgefzB4Fn
QdULzrPaBl6kqVXZjJZ7IHJTCPSWMpp4nZteD3ghWU09CZ8vNQ2dSddrBhX764OZ
6k8F+B7BqtfombYsrBKI1wN865JGD9kn7iDqZw7D5qEpzR3giztY+zPgR39Zj7Z3
cWVMsdjh2hKaAZir03YzPdlz0dyVwvA1C6aSEeHZ8eGeAsF+p+2TAcuLGTGW/9df
SfThudSpxqL3zcsE0I+SzpqFfprzEgUZMSNxtggHqtFuGlfvX9BkbAHGUgUk7eEn
KHab9Xty1JB0IqnA1IcgXUurCU4qodQUdRLyau19E+qG9wQhNDqFR4Hg/J7NpZso
j047xZnEBgC3FCWcyAlVm137J+HlD7f5tMP6gLTwbzs/hkqRj3pQHy+/jBwFcVpo
iXCo7hGk35QalZZUsLiUXoQH+I2ePB2FWM4iE9J7o43GQrU12aHpChQvxyyXPqaU
xDdPI8iGhYUz3lKC+tfuzZ6Wp4By7eH+Tnzp5dgMwyHLSRHb/jwgT4Ep+tq3mfxf
3nP0AEn8TQ53tlI7mAo/
=nu8v
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
