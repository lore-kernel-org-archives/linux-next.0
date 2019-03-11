From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Mon, 11 Mar 2019 12:13:54 +0000
Message-ID: <20190311121348.GD22862@mellanox.com>
References: <20190221171332.262cf619@canb.auug.org.au>
 <20190221123440.GD17501@mtr-leonro.mtl.com>
 <20190311024434.GA19508@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311024434.GA19508@bombadil.infradead.org>
Content-Language: en-US
Content-ID: <EBE5CE1B7C68F442BF1EABFF6745DAF5@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Leon Romanovsky <leonro@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Sun, Mar 10, 2019 at 07:44:34PM -0700, Matthew Wilcox wrote:
> On Thu, Feb 21, 2019 at 12:34:42PM +0000, Leon Romanovsky wrote:
> > On Thu, Feb 21, 2019 at 05:13:32PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the xarray tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this:
>=20
> [API change]
>=20
> So I ended up being really busy last week and not having time to send
> my merge request for XArray yet.  I'm going to send a request this week;
> Leon and Jason, how does this merge resolution look?
>=20
> Compile tested only.
>=20
> diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/d=
evice.c
> index a9f29156e486..8a93c0c95953 100644
> +++ b/drivers/infiniband/core/device.c
> @@ -668,19 +668,10 @@ static int assign_name(struct ib_device *device, co=
nst char *name)
>  	}
>  	strlcpy(device->name, dev_name(&device->dev), IB_DEVICE_NAME_MAX);
> =20
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
> =20
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

blank line after locals, but other wise these all looks fine..=20

Should have started out with the xa_insert version above..

Thanks,
Jason
