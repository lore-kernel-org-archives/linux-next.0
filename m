From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rdma-fixes tree with Linus' tree
Date: Tue, 30 Apr 2019 08:13:46 +1000
Message-ID: <20190430081346.3196b60f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/aGqEJja6r4eSE9GIBbFg4sy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/aGqEJja6r4eSE9GIBbFg4sy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma-fixes tree got a conflict in:

  drivers/infiniband/core/uverbs_main.c

between commit:

  6a5c5d26c4c6 ("rdma: fix build errors on s390 and MIPS due to bad ZERO_PA=
GE use")

from Linus' tree and commit:

  d79a26b99f5f ("RDMA/uverbs: Fix compilation error on s390 and mips platfo=
rms")

from the rdma-fixes tree.

I fixed it up (I just used the version from Linus' tree) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/aGqEJja6r4eSE9GIBbFg4sy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHdxoACgkQAVBC80lX
0GwG3Af/a5q4L1kD5ptbcU8ulRUg1b6T7gFVsjTSYvloLMDOMxABY+duRjRaipTe
FQl2rELZkLkt/7wXWv5NtRJgaBTLQ4Q+zV8liInIsypEOCjK5VWenuPzwxw3bJQ8
WsqEObsNpBKTFJeqxSrgELc/mxHP4sn6Mt/c6silZ0FPodzCl4JSEFwWSm7HNzK/
4SHP672W926uo4woPwUq1oRxmQnk0LHEMyPxJZ48wV/Z3U0F4vGYMfvQeJfYtCrW
fPidonA254Mfg9TxwdOej3h9OZpu+yr7GRXJwfo1gvLn7ggtU4xQD83Cr41rclwf
5FzB5nJ0z1DHrrwaJZfNk7eN4pGH8g==
=oXyz
-----END PGP SIGNATURE-----

--Sig_/aGqEJja6r4eSE9GIBbFg4sy--
