From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Mon, 30 Apr 2018 10:10:40 +1000
Message-ID: <20180430101028.00917282@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t0LjNKxU63/IcPHegPYlPLL"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>, Willem de Bruijn <willemb@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/t0LjNKxU63/IcPHegPYlPLL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/net/Makefile

between commit:

  9faedd643fd9 ("selftests: net: add in_netns.sh TEST_GEN_PROGS_EXTENDED")

from the net tree and commit:

  a160725780e3 ("selftests: udp gso")

from the net-next tree.

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
index daf5effec3f0,df9102ec7b7a..000000000000
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@@ -5,12 -5,14 +5,15 @@@ CFLAGS =3D  -Wall -Wl,--no-as-needed -O2=20
  CFLAGS +=3D -I../../../../usr/include/
 =20
  TEST_PROGS :=3D run_netsocktests run_afpackettests test_bpf.sh netdevice.=
sh rtnetlink.sh
- TEST_PROGS +=3D fib_tests.sh fib-onlink-tests.sh pmtu.sh
 -TEST_PROGS +=3D fib_tests.sh fib-onlink-tests.sh in_netns.sh pmtu.sh udpg=
so.sh
++TEST_PROGS +=3D fib_tests.sh fib-onlink-tests.sh pmtu.sh udpgso.sh
+ TEST_PROGS +=3D udpgso_bench.sh
 +TEST_GEN_PROGS_EXTENDED :=3D in_netns.sh
  TEST_GEN_FILES =3D  socket
  TEST_GEN_FILES +=3D psock_fanout psock_tpacket msg_zerocopy
+ TEST_GEN_FILES +=3D tcp_mmap
  TEST_GEN_PROGS =3D reuseport_bpf reuseport_bpf_cpu reuseport_bpf_numa
  TEST_GEN_PROGS +=3D reuseport_dualstack reuseaddr_conflict
+ TEST_GEN_PROGS +=3D udpgso udpgso_bench_tx udpgso_bench_rx
 =20
  include ../lib.mk
 =20

--Sig_/t0LjNKxU63/IcPHegPYlPLL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrmXwAACgkQAVBC80lX
0GwcpAf/dHdozQ19lkpqdL/BHYGblHduAEcXK5tOYpdCTaH/w14DfBGB3ZtetYyX
VsHsUkwDdaiEpaKF8T65kCzlgju7xKVNw40f6AoSVJTFy6X965sWAGdxg1ciZEDZ
ZR0xc19x2Ri0iYbfQXFSWLm4Y1t6+P+Bteiyv8TG78UO5G8jbfIuHnxAu0cjTBOF
nc7VEXAG9f5ZzXVHwEva8exInTsNgGI61nxn7c77YZ5tk1u+0K3WJpCkk1CALaMS
OW8uoaToA6E1HksolSyN8MXWQTMZ/IlZaeHfO/zc6EU5U9gwAqOu+pszIEObbygR
lL4qctgRnUfidxefzCoI7a8u0hLhMQ==
=feGQ
-----END PGP SIGNATURE-----

--Sig_/t0LjNKxU63/IcPHegPYlPLL--
