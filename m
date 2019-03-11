From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Mon, 11 Mar 2019 14:12:39 +0000
Message-ID: <20190311141235.GH22862@mellanox.com>
References: <20190221171332.262cf619@canb.auug.org.au>
 <20190221123440.GD17501@mtr-leonro.mtl.com>
 <20190311024434.GA19508@bombadil.infradead.org>
 <20190311121348.GD22862@mellanox.com>
 <20190311123105.GC19508@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311123105.GC19508@bombadil.infradead.org>
Content-Language: en-US
Content-ID: <B42EC11540708545932D74D1D2F716D7@eurprd05.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Leon Romanovsky <leonro@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Mar 11, 2019 at 05:31:05AM -0700, Matthew Wilcox wrote:
> On Mon, Mar 11, 2019 at 12:13:54PM +0000, Jason Gunthorpe wrote:
> > > @@ -1059,14 +1050,14 @@ static int assign_client_id(struct ib_client =
*client)
> > >  	 * to get the LIFO order. The extra linked list can go away if xarr=
ay
> > >  	 * learns to reverse iterate.
> > >  	 */
> > > -	if (list_empty(&client_list))
> > > +	if (list_empty(&client_list)) {
> > >  		client->client_id =3D 0;
> > > -	else
> > > -		client->client_id =3D
> > > -			list_last_entry(&client_list, struct ib_client, list)
> > > -				->client_id;
> > > -	ret =3D xa_alloc(&clients, &client->client_id, INT_MAX, client,
> > > -		       GFP_KERNEL);
> > > +	} else {
> > > +		struct ib_client *last =3D list_last_entry(&client_list,
> > > +				struct ib_client, list);
> > > +		client->client_id =3D last->client_id + 1;
> >=20
> > blank line after locals, but other wise these all looks fine..=20
>=20
> Would you rather see this rendered as:
>=20
>         if (list_empty(&client_list)) {
>                 client->client_id =3D 0;
>         } else {
>                 struct ib_client *last;=20
>=20
>                 last =3D list_last_entry(&client_list, struct ib_client, =
list);
>                 client->client_id =3D last->client_id + 1;
>         }

Don't care much either way. Only that the Linux style guide is to
always have the blank line after variable declarations in any block

> or move the declaration of 'last' up to the top of the function?

This one I dislike, variables should be in their narrowest scope for
clarity

> > Should have started out with the xa_insert version above..
>=20
> I didn't spot it until last night either ...

It is a leftover weird thinking logic from an earlier attempt I had
that was trying to get the last ID out of the xarray without the
linked list..

Jason
