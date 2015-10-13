From: Mark Brown <broonie@kernel.org>
Subject: Re: next-20151013 build: 1 failures 50 warnings (next-20151013)
Date: Tue, 13 Oct 2015 13:50:26 +0100
Message-ID: <20151013125026.GG14956@sirena.org.uk>
References: <E1ZlxDc-0000ea-U4@optimist>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jt0yj30bxbg11sci"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56786 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752235AbbJMMux (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2015 08:50:53 -0400
Content-Disposition: inline
In-Reply-To: <E1ZlxDc-0000ea-U4@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Seiji Aguchi <seiji.aguchi@hds.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Mike Waychison <mikew@google.com>, Matt Fleming <matt.fleming@intel.com>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org


--jt0yj30bxbg11sci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 13, 2015 at 11:54:09AM +0100, Build bot for Mark Brown wrote:

Today's linux-next fails to build an ARM allmodconfig due to:

> 	arm-allmodconfig
> ../drivers/firmware/broadcom/bcm47xx_nvram.c:110:30: error: macro "DIV_ROUND_UP" requires 2 arguments, but only 1 given
> ../drivers/firmware/broadcom/bcm47xx_nvram.c:110:4: error: 'DIV_ROUND_UP' undeclared (first use in this function)

triggered by f6e734a8c16229 (MIPS: BCM47xx: Move NVRAM driver to the
drivers/firmware/).  Presumably this works due to an implicit inclusion
on MIPS.

I've CCed a lot of people listed in the changelog of the patch, though
the list there appears somewhat random - apologies if this is irrelevant
to you.

--jt0yj30bxbg11sci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWHP4SAAoJECTWi3JdVIfQ+FkH+QETm0uoq8QzKkCB1+hL6nhz
OSnimOD7kPHYQhYoxtep3eA5jgSl5z/QtjdtLw7QItWmRpvkhnq71AfB0ulVes76
cs5seo5qnangpHKI/BA+PozcFVuiK9/4X4gR0A2jaHL6s4MP/d3mGxbWbm+cVRgt
3ij4avFF7aG6UP7YCJdtFNtnH8ih3+HC15ZyVPBacxphzhVxUBDC4w2FoEy/Z72i
IdlXgAWbdGKk+BLkhvAZSviJzORXBwwKsSZFPACWwuF39d7EZd86NUOjP+Vw6gKn
bExHLUrBmc2f3DVwBS1xNPiXKf6r8262FuCBzT8EI0SzT6v4eiy8zfJqVvo8IPg=
=IHqc
-----END PGP SIGNATURE-----

--jt0yj30bxbg11sci--
