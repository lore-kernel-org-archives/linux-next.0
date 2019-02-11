From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rtc tree with the clk tree
Date: Mon, 11 Feb 2019 16:17:31 +1100
Message-ID: <20190211161731.56897159@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ldsDebFNaTF3D0e3jIOOtKD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWljaGHFgiBNaXJv?= =?UTF-8?B?c8WCYXc=?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-next.vger.kernel.org

--Sig_/ldsDebFNaTF3D0e3jIOOtKD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rtc tree got a conflict in:

  drivers/clk/at91/sama5d2.c

between commit:

  77977b800451 ("clk: at91: enable AUDIOPLL as source for PCKx on SAMA5D2")

from the clk tree and commit:

  34d2ff2a6019 ("clk: at91: fix masterck name")

from the rtc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/clk/at91/sama5d2.c
index ade063622531,cd0ef7274fdb..000000000000
--- a/drivers/clk/at91/sama5d2.c
+++ b/drivers/clk/at91/sama5d2.c
@@@ -240,8 -240,7 +240,8 @@@ static void __init sama5d2_pmc_setup(st
  	parent_names[1] =3D "mainck";
  	parent_names[2] =3D "plladivck";
  	parent_names[3] =3D "utmick";
- 	parent_names[4] =3D "mck";
+ 	parent_names[4] =3D "masterck";
 +	parent_names[5] =3D "audiopll_pmcck";
  	for (i =3D 0; i < 3; i++) {
  		char name[6];
 =20

--Sig_/ldsDebFNaTF3D0e3jIOOtKD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxhBWsACgkQAVBC80lX
0GyRCwf/YOZwRJZK39xyxAlkUtNWIr27TxWvgXUKN4UML9nh2KZmD1qTd+1voWul
ELbXviG2WY0MJxBc2Cgnn8lAvxP0JZpiATTNQayi2PKO5Qn6GoHyw+GJPVlVPNQi
+292lhcUUnigkig8zksUAJaaWdD18icnFtsAOQSm2hXNplkaVnvnMZdIDuds8hOR
aiUuRyI9GJUMOfBdyT/AU0Ou8bc49OA0bUAehr1lIS0WAQWpGiCqQm7iz/jlAngJ
lUunnWtBREjzbSuhZjuPVutGTc+t5d+eKjnjSPIIrjshDjmqWvqYIgGXYzxWQuIn
q7reBZLapWKABSUF+X+cmFq+NxL7cg==
=S4x3
-----END PGP SIGNATURE-----

--Sig_/ldsDebFNaTF3D0e3jIOOtKD--
