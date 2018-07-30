From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with the net-next tree
Date: Mon, 30 Jul 2018 13:22:53 +1000
Message-ID: <20180730132253.33633f56@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.2Lzkax8Y_tah6B68DEPXcQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/.2Lzkax8Y_tah6B68DEPXcQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got conflicts in:

  drivers/net/ethernet/freescale/fec_main.c
  drivers/net/ethernet/freescale/fs_enet/mac-fec.c

between commits:

  16f6e9835bcd ("net: ethernet: freescale: Use generic CRC32 implementation=
")
  d805f6a86829 ("net: ethernet: fs-enet: Use generic CRC32 implementation")

from the net-next tree and commit:

  5d258b48efbd ("net: ethernet: Use existing define with polynomial")

from the crypto tree.

I fixed it up (I used the net-next tree versions (but kept the rmeoval
of the CRC32_POLY and FEC_CRC_POLY defines) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/.2Lzkax8Y_tah6B68DEPXcQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltehI0ACgkQAVBC80lX
0GzO9Af+Lazi5sNSKTL+SrdZpV8CWyXRXYMN7RCl+rIcj0tJQKJ7A/DnFeinQse8
jKpTh6fYtLw+THR1UTipNZsZVw0gGRSp3fdo7KHMPdkwoIa0aeTSSACk1OqI+YOA
R3tLZK0kgzDm9v/LiydL0Smr78tAj56acgrRli7OV2rC483VWeeIhND9DomlZIGi
doYHj/NvvfNBKI+y29v4uqUu9pZNuxzDHwTfRt4TH//o8uK57yqkD8d8QThyOVxi
xUDYyfFBO7y+gh4RcdWHVJHt81lmbRa5MMTgKTHHQFP01tMpMnTo6+o3vQ/0tDtX
T7og/wdWCx6tQLrV1iijdL7+6cb2PQ==
=Xo+y
-----END PGP SIGNATURE-----

--Sig_/.2Lzkax8Y_tah6B68DEPXcQ--
