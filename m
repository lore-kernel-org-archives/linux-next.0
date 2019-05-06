From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the mlx5-next tree with the rdma
 tree
Date: Mon, 6 May 2019 14:01:47 +1000
Message-ID: <20190506140147.23d41ac1@canb.auug.org.au>
References: <20190430135846.0c17df6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vW/eo0iJa5WsE4O1KPNByGd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190430135846.0c17df6e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vu Pham <vuhuong@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Mark Bloch <markb@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/vW/eo0iJa5WsE4O1KPNByGd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 30 Apr 2019 13:58:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi Leon,
>=20
> Today's linux-next merge of the mlx5-next tree got a conflict in:
>=20
>   drivers/infiniband/hw/mlx5/main.c
>=20
> between commit:
>=20
>   35b0aa67b298 ("RDMA/mlx5: Refactor netdev affinity code")
>=20
> from the rdma tree and commit:
>=20
>   c42260f19545 ("net/mlx5: Separate and generalize dma device from pci de=
vice")
>=20
> from the mlx5-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/infiniband/hw/mlx5/main.c
> index 6135a0b285de,fae6a6a1fbea..000000000000
> --- a/drivers/infiniband/hw/mlx5/main.c
> +++ b/drivers/infiniband/hw/mlx5/main.c
> @@@ -200,12 -172,18 +200,12 @@@ static int mlx5_netdev_event(struct not
>  =20
>   	switch (event) {
>   	case NETDEV_REGISTER:
>  +		/* Should already be registered during the load */
>  +		if (ibdev->is_rep)
>  +			break;
>   		write_lock(&roce->netdev_lock);
> - 		if (ndev->dev.parent =3D=3D &mdev->pdev->dev)
>  -		if (ibdev->rep) {
>  -			struct mlx5_eswitch *esw =3D ibdev->mdev->priv.eswitch;
>  -			struct net_device *rep_ndev;
>  -
>  -			rep_ndev =3D mlx5_ib_get_rep_netdev(esw,
>  -							  ibdev->rep->vport);
>  -			if (rep_ndev =3D=3D ndev)
>  -				roce->netdev =3D ndev;
>  -		} else if (ndev->dev.parent =3D=3D mdev->device) {
> ++		if (ndev->dev.parent =3D=3D mdev->device)
>   			roce->netdev =3D ndev;
>  -		}
>   		write_unlock(&roce->netdev_lock);
>   		break;
>  =20

This is now a conflict between the net-next tree and the rdma tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/vW/eo0iJa5WsE4O1KPNByGd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzPsasACgkQAVBC80lX
0GzZWgf/eqG/54nzJcLhDHl6eODVDtlhnjK246o4r1hZcOY9BPPCZzfnt7UhQeuZ
bgrHLsNtf80Et97a6omcAWmIhsIthwgYj9TMet67FdHov8m81rPnOrcewGjoXVLZ
t43y04hZRMdyrMAaPyHYl2O9O/aYRAgPvn7kWZYzpruvmLm/dRE4kNRO40PDA3mz
3CaaFAbKgowu+T6W77q6NZeNhW6z5mi1lWIx8ODd2nGLrIawX4NtlXmZ7kNZRFZQ
Ckerg8IawE08QNoj7f11Fe+DdOcQdbdS8gtzZvlQ09rUPA6MqtT4yFn//JnPlFcR
PUreXiO2/oZ/+NKszPVhyG5n44X8bw==
=wKty
-----END PGP SIGNATURE-----

--Sig_/vW/eo0iJa5WsE4O1KPNByGd--
