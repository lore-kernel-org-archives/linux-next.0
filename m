From: Leon Romanovsky <leon@kernel.org>
Subject: Re: linux-next: manual merge of the mlx5-next tree with the rdma tree
Date: Mon, 6 May 2019 07:13:12 +0300
Message-ID: <20190506041312.GJ6938@mtr-leonro.mtl.com>
References: <20190430135846.0c17df6e@canb.auug.org.au>
 <20190506140147.23d41ac1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190506140147.23d41ac1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vu Pham <vuhuong@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Mark Bloch <markb@mellanox.com>
List-Id: linux-next.vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2019 at 02:01:47PM +1000, Stephen Rothwell wrote:
> Hi all,
>
> On Tue, 30 Apr 2019 13:58:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Leon,
> >
> > Today's linux-next merge of the mlx5-next tree got a conflict in:
> >
> >   drivers/infiniband/hw/mlx5/main.c
> >
> > between commit:
> >
> >   35b0aa67b298 ("RDMA/mlx5: Refactor netdev affinity code")
> >
> > from the rdma tree and commit:
> >
> >   c42260f19545 ("net/mlx5: Separate and generalize dma device from pci device")
> >
> > from the mlx5-next tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc drivers/infiniband/hw/mlx5/main.c
> > index 6135a0b285de,fae6a6a1fbea..000000000000
> > --- a/drivers/infiniband/hw/mlx5/main.c
> > +++ b/drivers/infiniband/hw/mlx5/main.c
> > @@@ -200,12 -172,18 +200,12 @@@ static int mlx5_netdev_event(struct not
> >
> >   	switch (event) {
> >   	case NETDEV_REGISTER:
> >  +		/* Should already be registered during the load */
> >  +		if (ibdev->is_rep)
> >  +			break;
> >   		write_lock(&roce->netdev_lock);
> > - 		if (ndev->dev.parent == &mdev->pdev->dev)
> >  -		if (ibdev->rep) {
> >  -			struct mlx5_eswitch *esw = ibdev->mdev->priv.eswitch;
> >  -			struct net_device *rep_ndev;
> >  -
> >  -			rep_ndev = mlx5_ib_get_rep_netdev(esw,
> >  -							  ibdev->rep->vport);
> >  -			if (rep_ndev == ndev)
> >  -				roce->netdev = ndev;
> >  -		} else if (ndev->dev.parent == mdev->device) {
> > ++		if (ndev->dev.parent == mdev->device)
> >   			roce->netdev = ndev;
> >  -		}
> >   		write_unlock(&roce->netdev_lock);
> >   		break;
> >
>
> This is now a conflict between the net-next tree and the rdma tree.

Thanks Stephen,
Looks good.

>
> --
> Cheers,
> Stephen Rothwell



--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQT1m3YD37UfMCUQBNwp8NhrnBAZsQUCXM+0OwAKCRAp8NhrnBAZ
sc9RAQDmnIWke/N+pH96y3NysRRPQo5qL4qm8zgCrYToys2YcgEAqTnEoZ5Y/T4A
E1YB7CSiFyMI3G6S6lzNHE4EgrcehAk=
=ruXy
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
