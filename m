From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Tue, 12 Feb 2019 16:23:31 +0000
Message-ID: <20190212162324.GU24706@mellanox.com>
References: <20190212162003.1aa1ffbd@canb.auug.org.au>
 <20190212161528.GN12668@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212161528.GN12668@bombadil.infradead.org>
Content-Language: en-US
Content-ID: <AE745D5970C34D44855AEF1CD75FDD55@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Feb 12, 2019 at 08:15:28AM -0800, Matthew Wilcox wrote:
> On Tue, Feb 12, 2019 at 04:20:03PM +1100, Stephen Rothwell wrote:
> > Caused by commit
> >=20
> >   a3e4d3f97ec8 ("XArray: Redesign xa_alloc API")
> >=20
> > interacting with commits
> >=20
> >   e59178d895af ("RDMA/devices: Use xarray to store the clients")
> >   0df91bb67334 ("RDMA/devices: Use xarray to store the client_data")
> >=20
> > from the rdma tree.
> >=20
> > Its a bit of a pain modifying a published API like this :-(
>=20
> Yes, it is.  I wasn't expecting people to actually start using it ;-)
>=20
> Seriously, there are several defects in the published API which do
> warrant a change.  The most severe one is that it's really easy to
> forget to initialise the start index.  And while I'm making that change,
> I should fix smaller things like the errno at the same time.

I hope you will send your tree in the 2nd week of the merge window
with all these merge fixes in it..

I think Linus will not like it if he has to fix this when merging
rdma.

> > I have added the following merge fixup patch for today (I assume some
> > of the assignments are also now redundant).
>
> I think the first of these should be using the alloc_cyclic API, like thi=
s:

Yes, it is waiting for you :)

> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/d=
evice.c
> index 283ecc2aee89..d0b56c70a553 100644
> +++ b/drivers/infiniband/core/device.c
> @@ -586,20 +586,8 @@ static int assign_name(struct ib_device *device, con=
st char *name)
>  	}
>  	strlcpy(device->name, dev_name(&device->dev), IB_DEVICE_NAME_MAX);
> =20
> -	/* Cyclically allocate a user visible ID for the device */
> -	device->index =3D last_id;
> -	ret =3D xa_alloc(&devices, &device->index, device,
> -		       XA_LIMIT(last_id, INT_MAX), GFP_KERNEL);
> -	if (ret =3D=3D -ENOSPC) {
> -		device->index =3D 0;
> -		ret =3D xa_alloc(&devices, &device->index, device,
> -			       XA_LIMIT(0, INT_MAX), GFP_KERNEL);
> -	}
> -	if (ret)
> -		goto out;
> -	last_id =3D device->index + 1;
> -
> -	ret =3D 0;
> +	ret =3D xa_alloc_cyclic(&devices, &device->index, device, xa_limit_31b,
> +			&last_id, GFP_KERNEL);
> =20
>  out:
>  	up_write(&devices_rwsem);
> @@ -750,7 +738,7 @@ int ib_register_device(struct ib_device *device, cons=
t char *name)
>  	int ret;
> =20
>  	ret =3D assign_name(device, name);
> -	if (ret)
> +	if (ret < 0)
>  		return ret;

This <0 should be near the xa_alloc_cyclic, I don't want the unusual
'1' to propogate.. Far too likely that someone will forget about
the special case.

Jason
