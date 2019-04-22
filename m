From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the rdma-fixes tree
Date: Tue, 23 Apr 2019 06:57:12 +1000
Message-ID: <20190423065712.7d0556b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ediXCgdp=3VX2QzEgGD/S41"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guy Levi <guyle@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ediXCgdp=3VX2QzEgGD/S41
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5efda3b6b122 ("IB/mlx5: Fix scatter to CQE in DCT QP creation")

Fixes tag

  Fixes: 5d6ff1babe ("IB/mlx5: Support scatter to CQE for DC transport type=
")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ediXCgdp=3VX2QzEgGD/S41
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+KqgACgkQAVBC80lX
0GwQxAf+JJ5wkBp7Q6O3j/mBPifO34ghfG60lN666idz/o6ToG4fxKvVnaviYD+Z
CWfxxQksw/2dvWZl1M9jkb1pU5bBNZou8LWc3u0/Z0417wCdZvWZjC8Zsuu+PORC
5H+BwZvCH5fLjN336Faek0UyBbMuFtK8s7whbiJq64X8nh0SmFEwcqbtIEnBC6Fp
3fECQY0uKOk2oNwDqbZXhzFyX5QKLmnKEcTF9ToPfgvM0R/hbKKPGIFGs57knNGt
TPszK2Y4NcjxiI1KcYuhrcjfW7vXCaulLqq1IGJ0kR4nX/FBmG4e7onAhbrBifAq
4FNWOxVmg0Yq8wlMgCKsObFQPgkdbg==
=Hz1f
-----END PGP SIGNATURE-----

--Sig_/ediXCgdp=3VX2QzEgGD/S41--
