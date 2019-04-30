From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mlx5-next tree with the rdma tree
Date: Tue, 30 Apr 2019 13:58:46 +1000
Message-ID: <20190430135846.0c17df6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/x6h10r0CWB.mHV.8Wd_JDuP"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vu Pham <vuhuong@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Mark Bloch <markb@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/x6h10r0CWB.mHV.8Wd_JDuP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Leon,

Today's linux-next merge of the mlx5-next tree got a conflict in:

  drivers/infiniband/hw/mlx5/main.c

between commit:

  35b0aa67b298 ("RDMA/mlx5: Refactor netdev affinity code")

from the rdma tree and commit:

  c42260f19545 ("net/mlx5: Separate and generalize dma device from pci devi=
ce")

from the mlx5-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/hw/mlx5/main.c
index 6135a0b285de,fae6a6a1fbea..000000000000
--- a/drivers/infiniband/hw/mlx5/main.c
+++ b/drivers/infiniband/hw/mlx5/main.c
@@@ -200,12 -172,18 +200,12 @@@ static int mlx5_netdev_event(struct not
 =20
  	switch (event) {
  	case NETDEV_REGISTER:
 +		/* Should already be registered during the load */
 +		if (ibdev->is_rep)
 +			break;
  		write_lock(&roce->netdev_lock);
- 		if (ndev->dev.parent =3D=3D &mdev->pdev->dev)
 -		if (ibdev->rep) {
 -			struct mlx5_eswitch *esw =3D ibdev->mdev->priv.eswitch;
 -			struct net_device *rep_ndev;
 -
 -			rep_ndev =3D mlx5_ib_get_rep_netdev(esw,
 -							  ibdev->rep->vport);
 -			if (rep_ndev =3D=3D ndev)
 -				roce->netdev =3D ndev;
 -		} else if (ndev->dev.parent =3D=3D mdev->device) {
++		if (ndev->dev.parent =3D=3D mdev->device)
  			roce->netdev =3D ndev;
 -		}
  		write_unlock(&roce->netdev_lock);
  		break;
 =20

--Sig_/x6h10r0CWB.mHV.8Wd_JDuP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHx/YACgkQAVBC80lX
0Gzdcwf/TE5ogvk+bySoFuMFWxuO8ThJFKEgBwtNn3z3FV1lPop11h70cpNlLj0G
2ZHQE5KFv3hos740rD/WELzVBnJUjPndb4OPV3VtRj0WAdiI1XemQ7i5Jf87j6yd
LnpbcwtAF9jV2wjhJh5o9btd3RfqMpP4FDl6ew7PT5lMqcbyP+bBuWHScCsvW0jj
pT7xo3Pf6zwfxiJoRlVRt1aW9QR1XJPIaxAKna5PKrvYRo1Y2Q00KU7yJv0ub8WB
xfZJT6l8+Fa/jfqaZHHXZ8G9n16GHgYvq+6+OxkVYW4tIjRWgq1dwRAFja3M92up
EESHkiDITShEDV5vj04TQnCMGfORsQ==
=0oRm
-----END PGP SIGNATURE-----

--Sig_/x6h10r0CWB.mHV.8Wd_JDuP--
