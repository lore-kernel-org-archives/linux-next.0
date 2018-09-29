From: Parav Pandit <parav@mellanox.com>
Subject: RE: linux-next: manual merge of the rdma tree with Linus' tree
Date: Sat, 29 Sep 2018 02:57:21 +0000
Message-ID: <VI1PR0501MB227163173354F5F3D7BE298CD1ED0@VI1PR0501MB2271.eurprd05.prod.outlook.com>
References: <20180928100125.61d3e9b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180928100125.61d3e9b6@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen,

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Thursday, September 27, 2018 7:01 PM
> To: Doug Ledford <dledford@redhat.com>; Jason Gunthorpe
> <jgg@mellanox.com>
> Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Parav Pandit
> <parav@mellanox.com>
> Subject: linux-next: manual merge of the rdma tree with Linus' tree
>=20
> Hi all,
>=20
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   drivers/infiniband/core/cache.c
>=20
> between commit:
>=20
>   5c5702e259dc ("RDMA/core: Set right entry state before releasing
> reference")
>=20
> from Linus' tree and commit:
>=20
>   43c7c851b9bc ("RDMA/core: Use dev_err/dbg/etc instead of pr_* + ibdev-
> >name")
>=20
> from the rdma tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This is now=
 fixed
> as far as linux-next is concerned, but any non trivial conflicts should b=
e
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer o=
f
> the conflicting tree to minimise any particularly complex conflicts.
>=20

Sorry for the late reply. For some reason mail ended up in spam folder whic=
h I noticed now.
I should have watched the device naming series.
My fix went to for-rc and I guess it wasn't applied to for-next which resul=
ted into this merge conflict.
My understanding is, maintainers usually try to avoid merge conflict betwee=
n for-next and for-rc branches before sending pull request from rdma tree.
I will try to be more careful in future to notify maintainer about it.

Your changes below looks good. Thanks.
Reviewed-by: Parav Pandit <parav@mellanox.com>=20
> --
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/infiniband/core/cache.c index
> 3208ad6ad540,ebc64418d809..000000000000
> --- a/drivers/infiniband/core/cache.c
> +++ b/drivers/infiniband/core/cache.c
> @@@ -337,39 -335,6 +335,38 @@@ static int add_roce_gid(struct ib_gid_t
>   	return 0;
>   }
>=20
>  +/**
>  + * del_gid - Delete GID table entry
>  + *
>  + * @ib_dev:	IB device whose GID entry to be deleted
>  + * @port:	Port number of the IB device
>  + * @table:	GID table of the IB device for a port
>  + * @ix:		GID entry index to delete
>  + *
>  + */
>  +static void del_gid(struct ib_device *ib_dev, u8 port,
>  +		    struct ib_gid_table *table, int ix)
>  +{
>  +	struct ib_gid_table_entry *entry;
>  +
>  +	lockdep_assert_held(&table->lock);
>  +
> - 	pr_debug("%s device=3D%s port=3D%d index=3D%d gid %pI6\n", __func__,
> - 		 ib_dev->name, port, ix,
> - 		 table->data_vec[ix]->attr.gid.raw);
> ++	dev_dbg(&ib_dev->dev, "%s port=3D%d index=3D%d gid %pI6\n",
>__func__, port,
> ++		ix, table->data_vec[ix]->attr.gid.raw);
>  +
>  +	write_lock_irq(&table->rwlock);
>  +	entry =3D table->data_vec[ix];
>  +	entry->state =3D GID_TABLE_ENTRY_PENDING_DEL;
>  +	/*
>  +	 * For non RoCE protocol, GID entry slot is ready to use.
>  +	 */
>  +	if (!rdma_protocol_roce(ib_dev, port))
>  +		table->data_vec[ix] =3D NULL;
>  +	write_unlock_irq(&table->rwlock);
>  +
>  +	put_gid_entry_locked(entry);
>  +}
>  +
>   /**
>    * add_modify_gid - Add or modify GID table entry
>    *
