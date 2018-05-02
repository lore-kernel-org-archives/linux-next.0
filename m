From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bpf-next tree with the bpf tree
Date: Wed, 2 May 2018 12:09:21 +1000
Message-ID: <20180502120921.654cc338@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_k_JFlMG2Jm7dvySI/MN3oN"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_k_JFlMG2Jm7dvySI/MN3oN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bpf-next tree got a conflict in:

  tools/testing/selftests/bpf/test_progs.c

between commit:

  a4e21ff8d9a3 ("bpf: minor fix to selftest test_stacktrace_build_id()")

from the bpf tree and commit:

  79b453501310 ("tools/bpf: add a test for bpf_get_stack with tracepoint pr=
og")

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

diff --cc tools/testing/selftests/bpf/test_progs.c
index fac581f1c57f,aa336f0abebc..000000000000
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@@ -1137,9 -1193,14 +1193,14 @@@ static void test_stacktrace_build_id(vo
  		  err, errno))
  		goto disable_pmu;
 =20
+ 	stack_amap_fd =3D bpf_find_map(__func__, obj, "stack_amap");
+ 	if (CHECK(stack_amap_fd < 0, "bpf_find_map stack_amap",
+ 		  "err %d errno %d\n", err, errno))
+ 		goto disable_pmu;
+=20
  	assert(system("dd if=3D/dev/urandom of=3D/dev/zero count=3D4 2> /dev/nul=
l")
  	       =3D=3D 0);
 -	assert(system("./urandom_read if=3D/dev/urandom of=3D/dev/zero count=3D4=
 2> /dev/null") =3D=3D 0);
 +	assert(system("./urandom_read") =3D=3D 0);
  	/* disable stack trace collection */
  	key =3D 0;
  	val =3D 1;
@@@ -1188,8 -1249,15 +1249,15 @@@
  		previous_key =3D key;
  	} while (bpf_map_get_next_key(stackmap_fd, &previous_key, &key) =3D=3D 0=
);
 =20
- 	CHECK(build_id_matches < 1, "build id match",
- 	      "Didn't find expected build ID from the map\n");
+ 	if (CHECK(build_id_matches < 1, "build id match",
 -		  "Didn't find expected build ID from the map"))
++		  "Didn't find expected build ID from the map\n"))
+ 		goto disable_pmu;
+=20
+ 	stack_trace_len =3D PERF_MAX_STACK_DEPTH
+ 		* sizeof(struct bpf_stack_build_id);
+ 	err =3D compare_stack_ips(stackmap_fd, stack_amap_fd, stack_trace_len);
+ 	CHECK(err, "compare_stack_ips stackmap vs. stack_amap",
+ 	      "err %d errno %d\n", err, errno);
 =20
  disable_pmu:
  	ioctl(pmu_fd, PERF_EVENT_IOC_DISABLE);

--Sig_/_k_JFlMG2Jm7dvySI/MN3oN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrpHdEACgkQAVBC80lX
0Gyj6gf/aZzO0mkQ2ixocOBeZd0aMqsiUhprVRtqjOxYDuXWR6EYXcIH/obgxtvU
E1yEgZ1eKsKiWYdOwvV0qL0LYq/o9e5AqiEp1T5uh5LN969j6II/xIM3DZe/4zoV
+74vrwR+meSqMKb84wmXKZbcmOeWUepkoQsx1FDOFWgVYTLO3gRb7tBqL/iAa95e
LFXtZWPh90KuNeIWQekXF0KOwXcrMxTmuHBrsZkxVKo54fRaIO7sktX4vqUDNWdp
FTblv+9tWzWdZTPfPCMhFMkdlQUiRV+KW3t+I0YHUYhtr1zHuc6lvj0Bh5lozF8d
u695GQGw990B6coNOYWpcbVxxDCiig==
=WoIr
-----END PGP SIGNATURE-----

--Sig_/_k_JFlMG2Jm7dvySI/MN3oN--
