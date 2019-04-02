From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the nand tree
Date: Wed, 3 Apr 2019 10:22:39 +1100
Message-ID: <20190403102239.174fbe35@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q=JfJhV5EJO6hR.++ngTl6p"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-next.vger.kernel.org

--Sig_/q=JfJhV5EJO6hR.++ngTl6p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/mtd/nand/raw/ingenic/jz4725b_bch.c: In function 'jz4725b_bch_read_p=
arity':
drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:147:12: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
   dest8[2] =3D (val >> 16) & 0xff;
   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:148:2: note: here
  case 2: /* fall-through */
  ^~~~
drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:149:12: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
   dest8[1] =3D (val >> 8) & 0xff;
   ~~~~~~~~~^~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/raw/ingenic/jz4725b_bch.c:150:2: note: here
  case 1: /* fall-through */
  ^~~~

Introduced by commit

  acb29396f956 ("mtd: rawnand: ingenic: Add support for the JZ4725B")

I get this warning because I am building with -Wimplicit-fallthrough
in attempt to catch new additions early.  The gcc warning can be turned
off by adding a /* fall through */ comment at the point the fall through
happens (i.e. before the next case label).

--=20
Cheers,
Stephen Rothwell

--Sig_/q=JfJhV5EJO6hR.++ngTl6p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyj7r8ACgkQAVBC80lX
0Gzl1wf9F8tBlFkm/RNfUFHRI+y37bVEP4U4FPmEBApNFtOIUsIpsWzMz0g9ZOlT
o7YlySPP4CRcaT5L1w2vCOsAeA8ASVmT7q19IBdpioXblMN2NVrB381AwEwUlop8
NLKe4m8xhUHNT9bhidz79IOetiJnMow0IUDOUdg56l6pJrhR1tgraj5+DgtTH7CQ
JlWhgJQBKkSe7LwLytldW0fKDk0GZfAoxgsNULLDaNVirnlgvlqjC9Z3pxtgOF8o
046oL6tpOUtOzSupJlosNwlKcIKjudE2yJKxHjcDhNGnPgoJuoT00+YK6c8r5ogO
VKNrdMP9PIXLqikQKkQknWfZjpXXsg==
=zYtu
-----END PGP SIGNATURE-----

--Sig_/q=JfJhV5EJO6hR.++ngTl6p--
