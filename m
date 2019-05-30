From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Fri, 31 May 2019 07:52:41 +1000
Message-ID: <20190531075241.63c45a9a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/APS2ye.u3t/PPPabyavOeAO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Parav Pandit <parav@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/APS2ye.u3t/PPPabyavOeAO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9414277a5df3 ("net/mlx5: Avoid double free in fs init error unwinding pat=
h")

Fixes tag

  Fixes: 40c3eebb49e51 ("net/mlx5: Add support in RDMA RX steering")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 905f6bd30bb6 ("net/mlx5: Avoid double free of root ns in the error f=
low path")

--=20
Cheers,
Stephen Rothwell

--Sig_/APS2ye.u3t/PPPabyavOeAO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwUKkACgkQAVBC80lX
0Gwb6Qf/WbXbNdJOvEKybT0z9SB+Ts6v8F2pQ3rKuW3RpXSwxg1qKSHfJc7To/rg
VEdinIe7DURap+dkR5LzWHl/nN28iAENzCSPSXaAlGoMl3Rag3XDG94H7TEF8s9G
vPQ4YX98Yl2GySnO60gMPxcPRVj6AKMBk/MNtwE/0kXKy9xeUwf/bd9F7FOcQoCv
eWZv8MreB8o4CA/dYYalShE4hx+UyB8O39nv5uYa3hUZ+jjc8Hc/mQEJTIID9JVl
Qd4F85ZmdO/Cknvd4K75TRdIKjd3r8xINQez6727buS4yH4HxLEJhy9F7mOylVGe
KYBKrJM/J2fi1F7UpGkb0NudTzZRxQ==
=Iy6v
-----END PGP SIGNATURE-----

--Sig_/APS2ye.u3t/PPPabyavOeAO--
