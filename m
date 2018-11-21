From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mlx5-next tree with the rdma tree
Date: Wed, 21 Nov 2018 11:04:32 +1100
Message-ID: <20181121110432.64a379f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pyprHO/yPcGEeMMfy9gn7bV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sagi Grimberg <sagi@grimberg.me>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/pyprHO/yPcGEeMMfy9gn7bV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Leon,

Today's linux-next merge of the mlx5-next tree got a conflict in:

  drivers/infiniband/hw/mlx5/main.c

between commit:

  9afc97c29b03 ("mlx5: remove support for ib_get_vector_affinity")

from the rdma tree and commit:

  f2f3df550139 ("net/mlx5: EQ, Privatize eq_table and friends")

from the mlx5-next tree.

I fixed it up (the former removed some of the code modified by the latter)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/pyprHO/yPcGEeMMfy9gn7bV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv0oRAACgkQAVBC80lX
0GwuGgf9EYSEx4Fk+Bpntuv8KPmtiRVqrfLMZMtKiHEyYR+9VqOLEDE0HQI2/Av7
aY4s7dnf0QJdlKIg9V51Qfzj1q14CLwuHb8NRJ5QqTtuK3OzwgvbuC9O3qX06L+c
ji2gtsfQqMmtE0rFAsoo11pvSLoc23jc2JdtgjOeq8NHr1iVWy5CbpabOChqTO7G
4nBkpzM2dLDKISIssHGa1+n9si/+duG5z3KomdJWEBmEeEK8mnytLBoC8WDYvpXW
IJGLCy1WEFFffvoJdVAVMXxm9LoRxNdMVghdJooqHZCUzevIibkrxsNJ0gsKAOFz
AzmvGW41/v/SCQEh0weKLsGLY8nDBw==
=HQhg
-----END PGP SIGNATURE-----

--Sig_/pyprHO/yPcGEeMMfy9gn7bV--
