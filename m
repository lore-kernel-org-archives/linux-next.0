From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the bpf tree
Date: Tue, 12 Feb 2019 17:14:59 +1100
Message-ID: <20190212171459.294fb74c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sINFGrBoyrRI+Bmmjq1ZRaL"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>
List-Id: linux-next.vger.kernel.org

--Sig_/sINFGrBoyrRI+Bmmjq1ZRaL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  net/xdp/xdp_umem.c

between commit:

  e451eb510684 ("xsk: share the mmap_sem for page pinning")

from the bpf tree and patch:

  "net/xdp/xdp_umem.c: do not use mmap_sem"

from the akpm tree.

I fixed it up (I dropped the akpm tree patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/sINFGrBoyrRI+Bmmjq1ZRaL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxiZGMACgkQAVBC80lX
0GxuOgf/VFKxHbtCV3uqyCiE8qQUzfvpfmuqLvUKzx6fdZx5wUrwE/9IOcqSiY5P
Fs5WP3poIqs6OWNPElKspGBCmiWnBzqTBdVVKC8BYlo0AVJmrrqGqq72aMU0WIm8
gfJjwXI8naczhVPQRO/OzQsTlcvGLEX/Xi7DEGIVDzTYPqxuRXsIaTG7XtxPiW47
JqE3+aTqEtjwOYKCKdQJ5FhhniWuyAY2Sp+vBJAiBG1Ltt6UhnSc53G1w6uTtikF
GXWXQxgVrBIH9qhSBCV4kqU9BoA9lbES0b8NG1aNsRpbFApBHjzS5WpVc2ewqT17
3wiZ6gtFN8mVIkbuwrUefr1BEFZinw==
=sd5n
-----END PGP SIGNATURE-----

--Sig_/sINFGrBoyrRI+Bmmjq1ZRaL--
