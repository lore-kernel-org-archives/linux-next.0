From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 20 Dec 2018 13:00:38 +1100
Message-ID: <20181220130038.753df0d5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/npEXLpUcHsugbpdsDGuUCiw"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Petr Machata <petrm@mellanox.com>, Paolo Abeni <pabeni@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/npEXLpUcHsugbpdsDGuUCiw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/net/Makefile

between commit:

  55cbe0794294 ("selftests: net: Add test_vxlan_fdb_changelink.sh")

from the net tree and commit:

  e87f53b4fab7 ("selftests: add some benchmark for UDP GRO")

( and following ones) from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/net/Makefile
index 923570a9708a,9543a4c2f9be..000000000000
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@@ -4,14 -4,15 +4,16 @@@
  CFLAGS =3D  -Wall -Wl,--no-as-needed -O2 -g
  CFLAGS +=3D -I../../../../usr/include/
 =20
- TEST_PROGS :=3D run_netsocktests run_afpackettests test_bpf.sh netdevice.=
sh rtnetlink.sh
+ TEST_PROGS :=3D run_netsocktests run_afpackettests test_bpf.sh netdevice.=
sh \
+ 	      rtnetlink.sh xfrm_policy.sh
  TEST_PROGS +=3D fib_tests.sh fib-onlink-tests.sh pmtu.sh udpgso.sh ip_def=
rag.sh
  TEST_PROGS +=3D udpgso_bench.sh fib_rule_tests.sh msg_zerocopy.sh psock_s=
nd.sh
 +TEST_PROGS +=3D test_vxlan_fdb_changelink.sh
+ TEST_PROGS +=3D udpgro_bench.sh udpgro.sh test_vxlan_under_vrf.sh reusepo=
rt_addr_any.sh
  TEST_PROGS_EXTENDED :=3D in_netns.sh
  TEST_GEN_FILES =3D  socket
- TEST_GEN_FILES +=3D psock_fanout psock_tpacket msg_zerocopy
- TEST_GEN_FILES +=3D tcp_mmap tcp_inq psock_snd
+ TEST_GEN_FILES +=3D psock_fanout psock_tpacket msg_zerocopy reuseport_add=
r_any
+ TEST_GEN_FILES +=3D tcp_mmap tcp_inq psock_snd txring_overwrite
  TEST_GEN_FILES +=3D udpgso udpgso_bench_tx udpgso_bench_rx ip_defrag
  TEST_GEN_PROGS =3D reuseport_bpf reuseport_bpf_cpu reuseport_bpf_numa
  TEST_GEN_PROGS +=3D reuseport_dualstack reuseaddr_conflict tls

--Sig_/npEXLpUcHsugbpdsDGuUCiw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwa98YACgkQAVBC80lX
0GyBywgAmHV8ZPbG0QV+24AXch5IayeUfU97UlMKAGJvi42wxJCrPUQpXaBgOl6e
nIEMr/AZZUYw5BR3bbDktsFg/8A2ckKiC8ParTf6mUvcguV7JggDx5PmoUsRwyp4
CyWrUqvNndvVQ2UX+oJRGMLNoRJoSjWd9I7YGm2yS84vYLIBxB8cHassX5dg/IU9
vtdRsnYLnlVaSoxgfx0X1SApukea8nG5IdRoPW9E2kTrGkV+0nu4rgxFMrKIbHsK
EOblA0Y+8b+yuRZc03DP1lsQ+nxtgx3EtIdeaF/sOD81FPrI2NDvvF7fBghjWS5X
eFJIJMuMrWGmnFYVHe9MbD/A3Hlw7w==
=ApKF
-----END PGP SIGNATURE-----

--Sig_/npEXLpUcHsugbpdsDGuUCiw--
