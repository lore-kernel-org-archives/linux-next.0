From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ubi tree build warnings
Date: Wed, 8 Jul 2009 13:09:21 +1000
Message-ID: <20090708130921.a361f6d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Jul_2009_13_09_21_+1000_GMrqR7ySMmqQLiD+"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43561 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756942AbZGHDJ2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jul 2009 23:09:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__8_Jul_2009_13_09_21_+1000_GMrqR7ySMmqQLiD+
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Artem,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

drivers/mtd/ubi/io.c: In function 'nor_erase_prepare':
drivers/mtd/ubi/io.c:484: warning: passing argument 5 of 'ubi->mtd->write' =
from incompatible pointer type
drivers/mtd/ubi/io.c:484: note: expected 'const u_char *' but argument is o=
f type 'uint32_t *'
drivers/mtd/ubi/io.c:486: warning: format '%zd' expects type 'signed size_t=
', but argument 5 has type 'int'
drivers/mtd/ubi/io.c:486: warning: too many arguments for format
drivers/mtd/ubi/io.c:493: warning: passing argument 5 of 'ubi->mtd->write' =
from incompatible pointer type
drivers/mtd/ubi/io.c:493: note: expected 'const u_char *' but argument is o=
f type 'uint32_t *'

Introduced by commit ebf53f421308c2f59c9bcbad4c5c297a0d00199a ("UBI: fix
NOR flash recovery").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Jul_2009_13_09_21_+1000_GMrqR7ySMmqQLiD+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpUDeEACgkQjjKRsyhoI8xcPQCgrdliRS42dKGPQerclHFg4UUK
sSQAnjYO1SSBh/JCypbkNmb+H8HlWcdg
=MO8a
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Jul_2009_13_09_21_+1000_GMrqR7ySMmqQLiD+--
