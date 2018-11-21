From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the net-next
 tree
Date: Thu, 22 Nov 2018 10:36:21 +1100
Message-ID: <20181122103621.548afe8b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e8HMKaQm.7cH_t+OJtiBLs_"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Nikita V. Shirokov" <tehnerd@tehnerd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/e8HMKaQm.7cH_t+OJtiBLs_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  tools/testing/selftests/bpf/Makefile

between commit:

  bd8e1afe6436 ("selftests: add dummy xdp test helper")

from the net-next tree and commit:

  b1957c92eba5 ("bpf: adding tests for map_in_map helpber in libbpf")

from the bpf-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/bpf/Makefile
index 4a54236475ae,43157bd89165..000000000000
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@@ -38,7 -39,7 +39,7 @@@ TEST_GEN_FILES =3D test_pkt_access.o test
  	get_cgroup_id_kern.o socket_cookie_prog.o test_select_reuseport_kern.o \
  	test_skb_cgroup_id_kern.o bpf_flow.o netcnt_prog.o \
  	test_sk_lookup_kern.o test_xdp_vlan.o test_queue_map.o test_stack_map.o \
- 	xdp_dummy.o
 -	test_map_in_map.o
++	xdp_dummy.o test_map_in_map.o
 =20
  # Order correspond to 'make run_tests' order
  TEST_PROGS :=3D test_kmod.sh \

--Sig_/e8HMKaQm.7cH_t+OJtiBLs_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv16/UACgkQAVBC80lX
0Gxa4gf+PIzgBvnF/4pwqCduKBz1GItnzqRVlfZ1JyY7Pw3WrsswhbXRBZwoxdFs
USHhhVx6tbyqGn/OeJ66B+xxuya+43gT4mlmvy/q/jykMvtP/TgWZim+w0av/PCq
dRGtptLYQRqoV92TXHfo0dkT1pwrVmo2vNYDh9m060i+lmoJu6ZrgeUpfNsbyP2V
r2sM9q3JuzSrR3433YyCgD6yDwTqhDIOBzb7V4HJMJuhn7QkWgFIMVFkGJQkSl1k
lNmB3g8WgqkEWgj2ZvvJSbgjq6a1fwNDDIQOCtZiAELVH5Ar7LjoOxk3sa/f4OSk
+RnooyQ4Me3GIuBQ3HtFrQ6JGv0qSw==
=3Xy3
-----END PGP SIGNATURE-----

--Sig_/e8HMKaQm.7cH_t+OJtiBLs_--
