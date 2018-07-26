From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 26 Jul 2018 18:45:47 +1000
Message-ID: <20180726184547.67a3fc8e@canb.auug.org.au>
References: <20180726145624.13a604ed@canb.auug.org.au>
        <20180726084833.GA23310@lst.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/70p9RtVLeQqjD+QhWGJrsdY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180726084833.GA23310@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Steve Wise <swise@opengridcomputing.com>
List-Id: linux-next.vger.kernel.org

--Sig_/70p9RtVLeQqjD+QhWGJrsdY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Thu, 26 Jul 2018 10:48:33 +0200 Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jul 26, 2018 at 02:56:24PM +1000, Stephen Rothwell wrote:
> > diff --git a/drivers/nvme/target/rdma.c b/drivers/nvme/target/rdma.c
> > index 86121a7a19b2..8c30ac7d8078 100644
> > --- a/drivers/nvme/target/rdma.c
> > +++ b/drivers/nvme/target/rdma.c
> > @@ -891,7 +891,7 @@ nvmet_rdma_find_get_device(struct rdma_cm_id *cm_id)
> > =20
> >  	inline_page_count =3D num_pages(port->inline_data_size);
> >  	inline_sge_count =3D max(cm_id->device->attrs.max_sge_rd,
> > -				cm_id->device->attrs.max_sge) - 1;
> > +				cm_id->device->attrs.max_send_sge) - 1; =20
>=20
> This should be max_recv_sge.

Thanks, I will fix up my resolution for tomorrow.

--=20
Cheers,
Stephen Rothwell

--Sig_/70p9RtVLeQqjD+QhWGJrsdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltZijsACgkQAVBC80lX
0GxAygf/XFg0MfBLbXfHngI2FwBMjRTkdEzxg+2C50gqm9q7Rp4+XEK7fBgKZEJ8
b8eifsulcO8JdjqJc7BzDMI25Us18AGoZAhzAFckj0w6VU1P1KcmOIOEzmg6G1CB
PEt0AbJ0c1lhQMUy1ZP5zu6SqJMHcledv9h2UwjdJOdXUvfIOH3oSFYfe97jzzrn
gtUgPuKvYT2NZ7+Hio5h03NhZyqnFpIuWrFgTaooG4UVbGbzdTEBw05Gid+Byz3p
cEQbrcEZvKoLL3OkMuRkAMnmUodWrkBOONdnBV7mjjJLvjyo/fFk+mcXcKZm000l
Xl1z2lMzi866pAwMn8snHqmLaveUug==
=GNdC
-----END PGP SIGNATURE-----

--Sig_/70p9RtVLeQqjD+QhWGJrsdY--
