From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Mon, 11 Mar 2019 12:46:33 +0000
Message-ID: <20190311124630.GG32625@mtr-leonro.mtl.com>
References: <20190221171332.262cf619@canb.auug.org.au>
 <20190221123440.GD17501@mtr-leonro.mtl.com>
 <20190311024434.GA19508@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311024434.GA19508@bombadil.infradead.org>
Content-Language: en-US
Content-ID: <2E402DCA1758E844B9A841313708E52F@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Mar 10, 2019 at 07:44:34PM -0700, Matthew Wilcox wrote:
> On Thu, Feb 21, 2019 at 12:34:42PM +0000, Leon Romanovsky wrote:
> > On Thu, Feb 21, 2019 at 05:13:32PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the xarray tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this:
>
> [API change]
>
> So I ended up being really busy last week and not having time to send
> my merge request for XArray yet.  I'm going to send a request this week;
> Leon and Jason, how does this merge resolution look?
>
> Compile tested only.
>
> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/d=
evice.c
> index a9f29156e486..8a93c0c95953 100644
> --- a/drivers/infiniband/core/device.c
> +++ b/drivers/infiniband/core/device.c
> @@ -668,19 +668,10 @@ static int assign_name(struct ib_device *device, co=
nst char *name)
>  	}
>  	strlcpy(device->name, dev_name(&device->dev), IB_DEVICE_NAME_MAX);
>
> -	/* Cyclically allocate a user visible ID for the device */
> -	device->index =3D last_id;
> -	ret =3D xa_alloc(&devices, &device->index, INT_MAX, device, GFP_KERNEL)=
;
> -	if (ret =3D=3D -ENOSPC) {
> -		device->index =3D 0;
> -		ret =3D xa_alloc(&devices, &device->index, INT_MAX, device,
> -			       GFP_KERNEL);
> -	}
> -	if (ret)
> -		goto out;
> -	last_id =3D device->index + 1;
> -
> -	ret =3D 0;
> +	ret =3D xa_alloc_cyclic(&devices, &device->index, device, xa_limit_31b,
> +			&last_id, GFP_KERNEL);
> +	if (ret > 0)
> +		ret =3D 0;
>
>  out:
>  	up_write(&devices_rwsem);
> @@ -1059,14 +1050,14 @@ static int assign_client_id(struct ib_client *cli=
ent)
>  	 * to get the LIFO order. The extra linked list can go away if xarray
>  	 * learns to reverse iterate.
>  	 */
> -	if (list_empty(&client_list))
> +	if (list_empty(&client_list)) {
>  		client->client_id =3D 0;
> -	else
> -		client->client_id =3D
> -			list_last_entry(&client_list, struct ib_client, list)
> -				->client_id;
> -	ret =3D xa_alloc(&clients, &client->client_id, INT_MAX, client,
> -		       GFP_KERNEL);
> +	} else {
> +		struct ib_client *last =3D list_last_entry(&client_list,
> +				struct ib_client, list);
> +		client->client_id =3D last->client_id + 1;
> +	}
> +	ret =3D xa_insert(&clients, client->client_id, client, GFP_KERNEL);
>  	if (ret)
>  		goto out;
>
> diff --git a/drivers/infiniband/core/restrack.c b/drivers/infiniband/core=
/restrack.c
> index fa804093fafb..3b5ff2f7b5f8 100644
> --- a/drivers/infiniband/core/restrack.c
> +++ b/drivers/infiniband/core/restrack.c
> @@ -13,28 +13,6 @@
>  #include "cma_priv.h"
>  #include "restrack.h"
>
> -static int rt_xa_alloc_cyclic(struct xarray *xa, u32 *id, void *entry,
> -			      u32 *next)
> -{
> -	int err;
> -
> -	*id =3D *next;
> -	if (*next =3D=3D U32_MAX)
> -		*id =3D 0;
> -
> -	xa_lock(xa);
> -	err =3D __xa_alloc(xa, id, U32_MAX, entry, GFP_KERNEL);
> -	if (err && *next !=3D U32_MAX) {
> -		*id =3D 0;
> -		err =3D __xa_alloc(xa, id, *next, entry, GFP_KERNEL);
> -	}
> -
> -	if (!err)
> -		*next =3D *id + 1;
> -	xa_unlock(xa);
> -	return err;
> -}
> -
>  /**
>   * rdma_restrack_init() - initialize and allocate resource tracking
>   * @dev:  IB device
> @@ -226,7 +204,8 @@ static void rdma_restrack_add(struct rdma_restrack_en=
try *res)
>  	kref_init(&res->kref);
>  	init_completion(&res->comp);
>  	if (res->type !=3D RDMA_RESTRACK_QP)
> -		ret =3D rt_xa_alloc_cyclic(&rt->xa, &res->id, res, &rt->next_id);
> +		ret =3D xa_alloc_cyclic(&rt->xa, &res->id, res, xa_limit_32b,
> +				&rt->next_id, GFP_KERNEL);

restrack.c part looks good.
Thanks


>  	else {
>  		/* Special case to ensure that LQPN points to right QP */
>  		struct ib_qp *qp =3D container_of(res, struct ib_qp, res);
