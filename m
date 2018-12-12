From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the bpf-next tree
Date: Thu, 13 Dec 2018 07:32:45 +1100
Message-ID: <20181213073245.5b2d2536@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/JF2wAiMkZ1gy6srZ9wd20.V"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/JF2wAiMkZ1gy6srZ9wd20.V
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  3bdc28aa2340 ("selftests/bpf: add btf annotations for cgroup_local_storag=
e maps")
  1dfd1959fed4 ("bpf: add bpffs pretty print for cgroup local storage maps")
  3adc62d9a5be ("bpf: pass struct btf pointer to the map_check_btf() callba=
ck")
  9cf3a785dc4c ("selftests/bpf: use __bpf_constant_htons in test_prog.c")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/JF2wAiMkZ1gy6srZ9wd20.V
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwRcG0ACgkQAVBC80lX
0Gzmugf/c3PQiufxOJr8T1wO62M8NbddLU0l3CHBWa4LzGt6+K042ZqBUzPfDXJT
jLj8wABpjn7w8SiEsYahmN0hq19tVVtjGft7nQVgsUstlkzzYn+oNZwqoq5v9X6q
A/anE530ejRmHAehZEbIsxRkseZi23yDF3aSEvaVcx/nOnsTBggv4M0cxiBf8/4l
omkNDBg4pvSCb9mPmtbYxWB4N4W8jHK+hQ6zKM4teu6K2a+KZCa3QRDxyNzSzF15
I1R8Wr5K9M4yvrh5Styvqns3VqQc6WF/upks4yiWPN58XjWtdHWq3VAdtbKOLcuR
+mJ8eYD7piR+ce0cB5zjjlFvEMXtQw==
=H2iu
-----END PGP SIGNATURE-----

--Sig_/JF2wAiMkZ1gy6srZ9wd20.V--
