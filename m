From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with the net tree
Date: Thu, 20 Dec 2018 13:07:44 +1100
Message-ID: <20181220130744.1c8db488@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nX28Uvr9Sab4uT5+YhSOABB"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gavi Teitz <gavi@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/nX28Uvr9Sab4uT5+YhSOABB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/ethernet/mellanox/mlx5/core/en_rep.c

between commit:

  8956f0014ea5 ("net/mlx5e: Fix default amount of channels for VF represent=
ors")

from the net tree and commit:

  d9ee0491c2ff ("net/mlx5e: Use dedicated uplink vport netdev representor")

from the net-next tree.

I fixed it up (I just used the net-next tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/nX28Uvr9Sab4uT5+YhSOABB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwa+XAACgkQAVBC80lX
0GxG6gf/RJAlX3eVz1oSmdp7VgDiJnlMtz7PpEm47mTpATHVZkJ1FXgv+1ha80Hj
h9EtQ4HVWjDYERs8tZz60VI5UbK8Bzbnl0RN1FZ/i/ZiBwzhl42QRisR7TNBhNF3
Hmi0DbjtRKF7UPwJbgJU4MIAvjAwX+MbTjd2Hu66outvpfkXXtP9V2uUDa6wFTNI
tBRvcgRMZhPbqeRocsfrpKTuCCwlUzq+gRIsW/8Qu+f2sDy9vxiW+8pZZ7h3vNHq
43ctfSZ145ELaeAqD6TcXPVESuKWb31maIbVQQIPSMOBndp7gqT6cXZWJn8b1nT/
IEZ/VoIrB4ZldUlPxHx8bzLXmh6hRQ==
=k3I5
-----END PGP SIGNATURE-----

--Sig_/nX28Uvr9Sab4uT5+YhSOABB--
