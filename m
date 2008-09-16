From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH -next] blkdev.h: fix warnings when CONFIG_BLOCK=n
Date: Wed, 17 Sep 2008 08:16:08 +1000
Message-ID: <20080917081608.46744774.sfr@canb.auug.org.au>
References: <20080916173415.14012569.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0809161226230.32267@shark.he.net>
	<20080916215039.GZ20055@kernel.dk>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__17_Sep_2008_08_16_08_+1000_Fp2qHQHVdRVggxYy"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48252 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751370AbYIPWQZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2008 18:16:25 -0400
In-Reply-To: <20080916215039.GZ20055@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Jens Axboe <jens.axboe@oracle.com>, "Randy.Dunlap" <rdunlap@xenotime.net>, linux-next@vger.kernel.org, akpm@linux-foundation.org, LKML <linux-kernel@vger.kernel.org>

--Signature=_Wed__17_Sep_2008_08_16_08_+1000_Fp2qHQHVdRVggxYy
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

On Tue, 16 Sep 2008 23:50:40 +0200 Jens Axboe <jens.axboe@oracle.com> wrote:
>
> On Tue, Sep 16 2008, Randy.Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> >=20
> > Fix lots of build warnings when CONFIG_BLOCK=3Dn:
> >=20
> > linux-next-20080916/include/linux/blkdev.h:1093: warning: 'struct block=
_device' declared inside parameter list
> > linux-next-20080916/include/linux/blkdev.h:1093: warning: its scope is =
only this definition or declaration, which is probably not what you want
> > linux-next-20080916/include/linux/blkdev.h:1097: warning: 'struct gendi=
sk' declared inside parameter list
> > linux-next-20080916/include/linux/blkdev.h:1105: warning: 'struct hd_ge=
ometry' declared inside parameter list
> >=20
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > ---
> >  include/linux/blkdev.h |    4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > --- linux-next-20080916.orig/include/linux/blkdev.h
> > +++ linux-next-20080916/include/linux/blkdev.h
> > @@ -1089,6 +1089,10 @@ static inline long nr_blockdev_pages(voi
> > =20
> >  #endif /* CONFIG_BLOCK */
> > =20
> > +struct block_device;
> > +struct gendisk;
> > +struct hd_geometry;
> > +
> >  extern int __blkdev_driver_ioctl(struct block_device *, fmode_t, unsig=
ned int,
> >  				 unsigned long);
> > =20
>=20
> Not sure which tree that build problem came from, it isn't from the
> block git tree.

I suspect this is caused by commit
44e95e9e8be95ec9ac6b0678e491883d99c0cfd8 ("beginning of methods
conversion") from your bdev tree. (the commit id is from next-20090816)

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__17_Sep_2008_08_16_08_+1000_Fp2qHQHVdRVggxYy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkjQMCgACgkQjjKRsyhoI8zVegCbBlbRRddmzZhDihDsfym5m+Px
MkgAn3NHiaqKbAAOQTcPX+Ex/vZNJ0Au
=Qv0/
-----END PGP SIGNATURE-----

--Signature=_Wed__17_Sep_2008_08_16_08_+1000_Fp2qHQHVdRVggxYy--
