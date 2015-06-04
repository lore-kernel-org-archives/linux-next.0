From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20150603 build: 5 failures 55 warnings (next-20150603)
Date: Thu, 4 Jun 2015 11:48:12 +1000
Message-ID: <20150604114812.26c95e0c@canb.auug.org.au>
References: <E1Z08Mt-0006dU-4j@optimist>
	<CAP=VYLojVYPwC7N5ePFQ08aTd0a3G5SEirME8bfDuSASyM4jpw@mail.gmail.com>
	<CAP=VYLpdw76=RzBt0rHwQOsytoOeoZtewzCBjnsD+4oWuKhmbA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/=4HygR6MbYDR+WvBIgWLBGR"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53311 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750812AbbFDBsV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Jun 2015 21:48:21 -0400
In-Reply-To: <CAP=VYLpdw76=RzBt0rHwQOsytoOeoZtewzCBjnsD+4oWuKhmbA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Greg KH <greg@kroah.com>

--Sig_/=4HygR6MbYDR+WvBIgWLBGR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, 3 Jun 2015 20:26:25 -0400 Paul Gortmaker <paul.gortmaker@windriver.=
com> wrote:
>
> On Wed, Jun 3, 2015 at 6:38 PM, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
> > On Wed, Jun 3, 2015 at 9:06 AM, Build bot for Mark Brown
> > <broonie@kernel.org> wrote:
>=20
> [...]
>=20
> >
> >> ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: erro=
r: type defaults to 'int' in declaration of 'module_init' [-Werror=3Dimplic=
it-int]
> >> ../drivers/hwtracing/coresight/coresight-replicator-qcom.c:214:1: erro=
r: type defaults to 'int' in declaration of 'module_exit' [-Werror=3Dimplic=
it-int]
> >
> > I can't fix this one from my tree since the code only exists in next.
> > But I've passed the fix onto Greg since it comes via his staging tree:
> >
> > https://lkml.kernel.org/r/1433364777-29651-1-git-send-email-paul.gortma=
ker@windriver.com
>=20
> BTW, A similar one is in arm64 in drivers/hwtracing/coresight/coresight-e=
tm4x.c.
> I've sent that fix to Greg as well, since I can't apply it locally to my =
trees.
>=20
> https://lkml.kernel.org/r/1433376236-7347-1-git-send-email-paul.gortmaker=
@windriver.com

I will add both those patches to linux-next until Greg takes them (or
some other solution happens).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/=4HygR6MbYDR+WvBIgWLBGR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVb65jAAoJEMDTa8Ir7ZwVKn0P/ix1EfV7NUAZreOe5FK49Hz8
JuMd1TgBin4f3Mw/z9GL/LNEC1eXJEEXQLCexsWTEyI5oymUOz79PHzFMR/UqXua
1SUxNxR2kWaI9H193PhbtP62HAR2w84XxxvlrZYxSwRtHV+hMefa90S2ypSpsWnq
CYs+KNbg5tkDqcbJk5S2FxYk5PQ2WvXTbegSLhqcsj4UITeHXP7z6JuMvMflO3wd
CSu6dMOBvAt4QzhTEAjfD7Vs9RodOhLS6m6DamtWR58Y7Uenm+8pBIg96bwO4pqv
4HpFy7e51DYjTz/o3UmatRjxNsyJb8BnkDrQKjSmuXJQSHrjvHP/7Rf1AjpwIhPw
b4/INNfSNKAFHvIkaSgwJm/V6ZYGyJ4f/7PvpYkLiiiVc/DF7Olrg3fk0Be7OlEL
YhoxYDEYVu3SqzoUwUAvPiQL9eCl8vkEhEEzpwBJ8ponQh2oeylOknqU1EH9j3AU
vhDNWOWzJpV/INWHxCqb7n6DvC3Ojv4bD8VuCGqK95S/yLRCFAWwn9+awDX9ioKa
Yvi6d8bnowj2uj+/g3TMSNqZjIDghksGCG3/Yt6PReMjCNBJfLfIs81DkZZGzSx5
Y+yfRbRyO5DS8cpsXW92RX6GjWRZ4WfMVw7HcvWaKi4KAZjNLXUdD2+wqqEAF5o4
Q+Rr0a6eGJwKAMJ9C8k0
=d3Hb
-----END PGP SIGNATURE-----

--Sig_/=4HygR6MbYDR+WvBIgWLBGR--
