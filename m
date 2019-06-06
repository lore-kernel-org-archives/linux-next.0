From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the bpf tree
Date: Thu, 6 Jun 2019 11:34:37 +1000
Message-ID: <20190606113437.7d5bb929@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iKHmU36oxS/Xg5SYhaFXmoo"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, Andrii Nakryiko <andriin@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/iKHmU36oxS/Xg5SYhaFXmoo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/bpf/Makefile

between commit:

  25a7991c84f6 ("selftests/bpf: move test_lirc_mode2_user to TEST_GEN_PROGS=
_EXTENDED")

from the bpf tree and commit:

  2d2a3ad872f8 ("selftests/bpf: add btf_dump BTF-to-C conversion tests")

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

diff --cc tools/testing/selftests/bpf/Makefile
index e36356e2377e,2b426ae1cdc9..000000000000
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@@ -21,9 -23,10 +23,10 @@@ LDLIBS +=3D -lcap -lelf -lrt -lpthrea
  # Order correspond to 'make run_tests' order
  TEST_GEN_PROGS =3D test_verifier test_tag test_maps test_lru_map test_lpm=
_map test_progs \
  	test_align test_verifier_log test_dev_cgroup test_tcpbpf_user \
- 	test_sock test_btf test_sockmap get_cgroup_id_user test_socket_cookie \
- 	test_cgroup_storage test_select_reuseport test_section_names \
- 	test_netcnt test_tcpnotify_user test_sock_fields test_sysctl
 -	test_sock test_btf test_sockmap test_lirc_mode2_user get_cgroup_id_user \
++	test_sock test_btf test_sockmap get_cgroup_id_user \
+ 	test_socket_cookie test_cgroup_storage test_select_reuseport test_sectio=
n_names \
+ 	test_netcnt test_tcpnotify_user test_sock_fields test_sysctl test_hashma=
p \
+ 	test_btf_dump test_cgroup_attach xdping
 =20
  BPF_OBJ_FILES =3D $(patsubst %.c,%.o, $(notdir $(wildcard progs/*.c)))
  TEST_GEN_FILES =3D $(BPF_OBJ_FILES)

--Sig_/iKHmU36oxS/Xg5SYhaFXmoo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz4ba0ACgkQAVBC80lX
0GyHbAgAln49vKCDkQ3VGwN1IIYxfXnotkYxdi5uixRZJfmjdnhHpc2VWQsb8uYJ
ui7lrin0L9RkWcdrxkr3jfQqBvD89Vqu+BXdijfkQoXR2vdxWHbN0VRcLJc9+ZV8
ZDuCUiVcWfJPM06vJnqqpaUdq+sHp7lKnerrfGXxkoK64r76tFIJ5+Ca9Zta2wR5
u1wLVwRfzQX/fsbulIzrr44+4e5NAC1gjS9VFju1QZe+Wzkl7nO3JCR9D5NlDuOt
Z63noy2gUY2pShCUW5Rzl7F7WW9Y2RhokXVUOUSuRiklt8OhC9WlsSVhvaXW/HLO
uiuELnaaxAjULvPns+03BrZwWxYw9w==
=tqUs
-----END PGP SIGNATURE-----

--Sig_/iKHmU36oxS/Xg5SYhaFXmoo--
