From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rtc tree with the omap tree
Date: Tue, 9 Apr 2019 15:22:26 +1000
Message-ID: <20190409152226.5fecccd1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IIXaJ5r=mv4x_tHbswY/UGJ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tony Lindgren <tony@atomide.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keerthy <j-keerthy@ti.com>
List-Id: linux-next.vger.kernel.org

--Sig_/IIXaJ5r=mv4x_tHbswY/UGJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rtc tree got a conflict in:

  drivers/rtc/rtc-omap.c

between commit:

  6256f7f7f217 ("rtc: OMAP: Add support for rtc-only mode")

from the omap tree and commit:

  35118b7a4ea0 ("rtc: omap: let the core handle range")

from the rtc tree.

I fixed it up (I used the latter resolution around tm2bcd() changes) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/IIXaJ5r=mv4x_tHbswY/UGJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlysLBIACgkQAVBC80lX
0GxMygf/cmV0uz/fSC/lh0Ddj4K3RTH8cg9alDqqG08JNV0EV/NdlbzLC1RxViPS
yrDIjDMtvMlyEofVBtxhGntPaphGMV1lKQGwyGWqF+jEk8qvL4sJGD+G1oraN8/H
mHaq/Epiaklnwl4iZK1euWH9t8jYUQMWUlBUh0kgp0INd7qvgbJxiZqGKMC7VT97
bcwhZOn8Z2APmdtZMxrhAZ02fac7t26V3K8WgdI340MLlrj35dbzVuPQnDjqbpJT
4P3kJA7PJwoRN++kXk9aGByYlcY5kHHvLDkkYwPaaP5SxZUehqgzDMf/KdbFbZEa
nRhb63hl2NnMSisjYbzl+tdfuiQXCQ==
=w1Am
-----END PGP SIGNATURE-----

--Sig_/IIXaJ5r=mv4x_tHbswY/UGJ--
