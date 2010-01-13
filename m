From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: origin tree build failure
Date: Wed, 13 Jan 2010 13:55:07 +1100
Message-ID: <20100113135507.165a2e3a.sfr@canb.auug.org.au>
References: <20100112121434.49930eea.sfr@canb.auug.org.au>
	<alpine.LFD.2.00.1001111720290.17145@localhost.localdomain>
	<20100112133252.8b4591bd.sfr@canb.auug.org.au>
	<20100112133900.f22b3b72.sfr@canb.auug.org.au>
	<4B4D1055.7070605@lougher.demon.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Jan_2010_13_55_07_+1100_mwRUewf1KuEhzviA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38690 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753009Ab0AMCzP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jan 2010 21:55:15 -0500
In-Reply-To: <4B4D1055.7070605@lougher.demon.co.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Phillip Lougher <phillip@lougher.demon.co.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Albin Tonnerre <albin.tonnerre@free-electrons.com>

--Signature=_Wed__13_Jan_2010_13_55_07_+1100_mwRUewf1KuEhzviA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Phillip,

On Wed, 13 Jan 2010 00:14:13 +0000 Phillip Lougher <phillip@lougher.demon.c=
o.uk> wrote:
>
> > Phillip, you need to merge Linus' tree (or rebase on it) and fix those =
up
> > for the introduction of the LZO decompression stuff.
>=20
> Done.

Excellent, thanks.  I will pick it up tomorrow.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Jan_2010_13_55_07_+1100_mwRUewf1KuEhzviA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktNNgsACgkQjjKRsyhoI8zvSQCeI5lOun5Ib+s5j5RIXfMcCC9Z
x9UAn2FdTqRsjuSr/Xy1/dk+b9bC5/Et
=iR8S
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Jan_2010_13_55_07_+1100_mwRUewf1KuEhzviA--
