From: James Hogan <james.hogan@imgtec.com>
Subject: Re: next-20150806 build: 2 failures 52 warnings (next-20150806)
Date: Thu, 6 Aug 2015 22:52:05 +0100
Message-ID: <20150806215205.GB14493@jhogan-linux.le.imgtec.org>
References: <E1ZNIul-0007IF-Ev@optimist>
 <20150806172752.GA20873@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:17948 "EHLO
	imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753045AbbHFVwU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 Aug 2015 17:52:20 -0400
Content-Disposition: inline
In-Reply-To: <20150806172752.GA20873@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, Aug 06, 2015 at 06:27:52PM +0100, Mark Brown wrote:
> On Thu, Aug 06, 2015 at 12:00:47PM +0100, Build bot for Mark Brown wrote:
>=20
> Today's linux-next fails to build an ARM allmodconfig with:
>=20
> > 	arm-allmodconfig
> > ../lib/test_user_copy.c:67:2: error: implicit declaration of function '=
copy_in_user' [-Werror=3Dimplicit-function-declaration]
> > ../lib/test_user_copy.c:94:2: error: implicit declaration of function '=
__copy_in_user' [-Werror=3Dimplicit-function-declaration]
>=20
> due to 3a646f02c7 (lib/test_user_copy.c: check
> __copy_in_user()/copy_in_user()) which attempts to test copy_in_user()
> which doesn't appear to be defined, at least with the set of include
> files and/or config options you get with an allmodconfig and not at all
> as far as I can tell.

Yeh, the copy_in_user ones need to be conditional upon CONFIG_COMPAT.
Sorry for the breakage. I've asked Andrew to drop them until I can get a
v2 patchset out tomorrow.

Cheers
James

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJVw9cFAAoJEGwLaZPeOHZ6R4YQAMBgPyFOeVzk++MFXICYcO40
xYmC1HiqEZ1didasBfvpZ9I4+ZbZFtbz5tkYW7JJ+gyQct5t32xAQ+N0kma7TpFz
BnXYV0CE5UuTuQWhQGNZPqPBc1LvEaqfdRCVtBj+K15xeQCjl7Az2luW2qqa4abM
ZTbzsj90W8q/AoBLGDr2k2pE70k5Z6KA4vrpXSywZCVkx6KAG8Z4MyrK/QDhEdD3
HxK6BdV/FtBNVpNqlssdIEaI2kLxgU89C8ZhKuc8bqY+NqITEe+Kl0R7jlzvlKST
OpSX6Tzcm6k+B+YZCOUripk4/iw1wUkU797m9FljkO5pS4PHkBkSnIGv2c0nE8TN
3k/AwdY/hgalIMNmR+ho493YBEMQG1J/5wBK0yRALccpFTVVSIjnaBN+5wP/wsKk
zSIpS/p8NakCsRlh3eFCGmZUs8rmRy7c4+B7UmiZSajSY2cctVQka/AI2ii7/2It
0+9QvmFbCAUUvYbl1C5s3P+kqhozWtSAp35pA2iQVN2ED+1XdFOe5s7jnneZaeQv
AjfJj6mzlKW5fNawmgPbHldQjJASPB7e302aB58hDD02c2qeV+2NicWQjF+h3bmz
OziEIxmeQmgp+d7PcetKm0axZtZ6fNE1Ai0I+IepMuh5U99AP1XMOcxgbVh0komC
z6BM0vce7mgtKN0vo0dZ
=DQ0F
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
