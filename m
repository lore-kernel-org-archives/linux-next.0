From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: make distclean problem with next-20141124?
Date: Tue, 25 Nov 2014 08:09:59 +1100
Message-ID: <20141125080959.5c987e8e@canb.auug.org.au>
References: <CA+r1Zhhkjnb8Pa-ALB9Q6TsQ5e_oRTMJYqY50A1=2u2yYfZ4dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HjT6QEb=9HcddJ5koA8yFA6"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47386 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750967AbaKXVKL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2014 16:10:11 -0500
In-Reply-To: <CA+r1Zhhkjnb8Pa-ALB9Q6TsQ5e_oRTMJYqY50A1=2u2yYfZ4dg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jim Davis <jim.epost@gmail.com>
Cc: linux-next <linux-next@vger.kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@infradead.org>

--Sig_/HjT6QEb=9HcddJ5koA8yFA6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Mon, 24 Nov 2014 11:11:11 -0700 Jim Davis <jim.epost@gmail.com> wrote:
>
> jim@krebstar:~/linux2$ git describe
> next-20141124
> jim@krebstar:~/linux2$ git status
> HEAD detached at next-20141124
> nothing to commit, working directory clean
> jim@krebstar:~/linux2$ make distclean
> ./scripts/Makefile.clean:17: drivers/staging/media/omap24xx/Makefile: No
> such file or directory
> make[4]: *** No rule to make target
> `drivers/staging/media/omap24xx/Makefile'.  Stop.
>=20
> Though git log does show commit db85a0403be4a59cf536a25622fe110feefba8d3,
> which should have removed the line from drivers/staging/media/Makefile th=
at
> make is tripping over:
>=20
> -obj-$(CONFIG_VIDEO_OMAP2)       +=3D omap24xx/

There is another line in drivers/staging/media/Makefile immediately
below the one that was removed that was clearly missed:

obj-$(CONFIG_VIDEO_TCM825X)     +=3D omap24xx/

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/HjT6QEb=9HcddJ5koA8yFA6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUc56wAAoJEMDTa8Ir7ZwVFqsP/3l/oLfeQaI+gFbPStHxpYIU
DzdPKtttesrWB495xqyBSSHxzewdtDiPaUa03E8cJjiB2tcTBXuwfXJJPgqjB74W
D/RsL9cuusaQ8XDRkhn/5TCQ2MomgU6JT1yZqDBr+9Mpd841Ym4VwvrH8IbUQnAm
/bSYwmnLXa35zisvkOlhdQZwFsFjQUayEu+Un8qVRBI+pYxzmYdxp587QlHBIW7e
IE6WZSE+tgBLvdOYwZwhfKvb05SuJIZ6aPHAO0CyYSp5GO4raLGW222IWOjnqaSp
nEz8q3oMTkQLkCGBQkMa2f2+l8CFo9FFdkc1KU57ggXKS//HcSDgWpr6JHazC6Rw
XnA7ggP/y7Su8khsyDaSU1LYdU2Eekcmul1VItUNR1wRdXcCdigu11/9uXOoWhTU
3OUIajRe2HoeoZm+EivaWrPP7mGFo6+WY2HLJ+S0+pK7ZF8aORnnLNLpU87M1ZOx
d8uJJ8xWt9Xjqds0e8fYe+o+n7JPYjvtb4IpD8+bgTl4FI8P0aIiB6eX/1L9Srl9
pAQh+TXDBC79xQKu4pPIJPD8nmtSmpKAteLuDcDPJ6iI8hNfeIQFFUdYtU6horfS
/rpSPtoRnTfIHaSM5ZLSyGqX1hgu4Fk8zRjvout5lLRYp6FYhmevn8xgDIG/21rT
6MMKOoOFjC9JXoPTArcV
=4Nhi
-----END PGP SIGNATURE-----

--Sig_/HjT6QEb=9HcddJ5koA8yFA6--
