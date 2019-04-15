From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the netfilter-next tree with the
 netfilter tree
Date: Mon, 15 Apr 2019 11:22:16 +1000
Message-ID: <20190415112216.451541f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iOfTixBwxjYaL/xdyiLQNRZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pablo Neira Ayuso <pablo@netfilter.org>, NetFilter <netfilter-devel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Westphal <fw@strlen.de>
List-Id: linux-next.vger.kernel.org

--Sig_/iOfTixBwxjYaL/xdyiLQNRZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the netfilter-next tree got a conflict in:

  tools/testing/selftests/netfilter/Makefile

between commit:

  becf2319f320 ("selftests: netfilter: check icmp pkttoobig errors are set =
as related")

from the netfilter tree and commit:

  26f7fe4a5db5 ("selftests: netfilter: add ebtables broute test case")

from the netfilter-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/netfilter/Makefile
index a37cb1192c6a,80dae72a25c7..000000000000
--- a/tools/testing/selftests/netfilter/Makefile
+++ b/tools/testing/selftests/netfilter/Makefile
@@@ -1,6 -1,6 +1,6 @@@
  # SPDX-License-Identifier: GPL-2.0
  # Makefile for netfilter selftests
 =20
- TEST_PROGS :=3D nft_trans_stress.sh nft_nat.sh conntrack_icmp_related.sh
 -TEST_PROGS :=3D nft_trans_stress.sh nft_nat.sh bridge_brouter.sh
++TEST_PROGS :=3D nft_trans_stress.sh nft_nat.sh conntrack_icmp_related.sh =
bridge_brouter.sh
 =20
  include ../lib.mk

--Sig_/iOfTixBwxjYaL/xdyiLQNRZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyz3MgACgkQAVBC80lX
0GzjNgf/ZwehfdOYLgn3vj+PmNnPfX5E4sW6tOwrR5hmfSGKJNgaMEaBf6W/7Fkn
yIof8g2A64z1NdAtBFcvSrMMPOFUCJ2hXGUViFlo9cdjcEGXY+5Ls4RceKsBhWQk
noq0DVyYWT1DDp5DP+hPB8A4uOPTBF5luIoGEi2SFoIG2qAet5EbU23tu9PKm60k
OsqN9juYTuzbdzohO8oNBPM6T+hmkytEP/6+1II/VvVW0/Qz+rovYneytJqn0Fuw
/tqJQYLzcYiWRwC/WQUoibX1y+LRFeiY7fPgDNAE3vO51JFWVoVrW+HvgRMWhjby
+ckbpw+X50ATjR3rrs3uHAAethwIbQ==
=A7mt
-----END PGP SIGNATURE-----

--Sig_/iOfTixBwxjYaL/xdyiLQNRZ--
