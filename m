From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Fri, 27 Jul 2018 08:16:31 +1000
Message-ID: <20180727081631.6ff269f3@canb.auug.org.au>
References: <20180726145624.13a604ed@canb.auug.org.au>
        <011b01d424dc$b0a69820$11f3c860$@opengridcomputing.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wt27Km8KLsVssy_rgxtCJoy"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <011b01d424dc$b0a69820$11f3c860$@opengridcomputing.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve Wise <swise@opengridcomputing.com>
Cc: 'Jens Axboe' <axboe@kernel.dk>, 'Doug Ledford' <dledford@redhat.com>, 'Jason Gunthorpe' <jgg@mellanox.com>, 'Linux-Next Mailing List' <linux-next@vger.kernel.org>, 'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>, 'Christoph Hellwig' <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/wt27Km8KLsVssy_rgxtCJoy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Steve,

On Thu, 26 Jul 2018 07:32:16 -0500 "Steve Wise" <swise@opengridcomputing.co=
m> wrote:
>
> > diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
> > index 86121a7a19b2..8c30ac7d8078 100644
> > --- a/drivers/nvme/target/rdma.c
> > +++ b/drivers/nvme/target/rdma.c
> > @@ -891,7 +891,7 @@ nvmet_rdma_find_get_device(struct rdma_cm_id
> > *cm_id)
> >=20
> >  	inline_page_count =3D num_pages(port->inline_data_size);
> >  	inline_sge_count =3D max(cm_id->device->attrs.max_sge_rd,
> > -				cm_id->device->attrs.max_sge) - 1;
> > +				cm_id->device->attrs.max_send_sge) - 1; =20
>=20
> This should actually be max_recv_sge.

Yeah, Christoph pointed that out as well.  I will correct it today.

Thanks
--=20
Cheers,
Stephen Rothwell

--Sig_/wt27Km8KLsVssy_rgxtCJoy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltaSD8ACgkQAVBC80lX
0Gzr7AgAg+5MfrWwP3KVTHw++7ts7KFnKaOxr6zNy+MsZbGDYFddVg6me5ACm2yX
87Q2uFRg78bk+eE7smqsWbn+iMJ+G6VhDXqJ+H/ZaW4R5A9LPtAO5mSi47oKB6rs
SvIk7Mh4yhbgbsDdxbUrmwAM72hLQJtAxspnrvAdelo49//RVHGJgA5cv+t8nWzo
c4YLntNOyZxrw1/uispe29f0xq2YablEYBUIiqYTl9hfNEdDQ8Vr3h0x7XjhraMN
FPlZNT0uVEfMF9F4lm3xer0igSsybx5I2tYl7dBV8D+vjRvTh2xgfM2QywOOeZoO
Q3aaqXaA576itEUJRrsdUuJIJ7/w5w==
=XlMQ
-----END PGP SIGNATURE-----

--Sig_/wt27Km8KLsVssy_rgxtCJoy--
