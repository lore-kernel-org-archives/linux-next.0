From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Fri, 7 Dec 2018 13:41:08 +1100
Message-ID: <20181207134108.0abc681a@canb.auug.org.au>
References: <20181204114731.48b18bfc@canb.auug.org.au>
        <20181204015247.GR12288@mellanox.com>
        <20181204094256.GX6462@mtr-leonro.mtl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gcP/NiGqojFUI51DhDFM8j0"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204094256.GX6462@mtr-leonro.mtl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leonro@mellanox.com>
Cc: Jason Gunthorpe <jgg@mellanox.com>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Guy Levi(SW)" <guyle@mellanox.com>, Majd Dibbiny <majd@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gcP/NiGqojFUI51DhDFM8j0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 4 Dec 2018 09:42:59 +0000 Leon Romanovsky <leonro@mellanox.com> wro=
te:
>
> On Tue, Dec 04, 2018 at 01:52:54AM +0000, Jason Gunthorpe wrote:
> > On Tue, Dec 04, 2018 at 11:47:31AM +1100, Stephen Rothwell wrote: =20
> > >
> > > After merging the rdma tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > ERROR: "mlx5_get_send_wqe" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] un=
defined!
> > >
> > > Caused by commit
> > >
> > >   34f4c9554d8b ("IB/mlx5: Use fragmented QP's buffer for in-kernel us=
ers")
> > >
> > > mlx5_get_send_wqe() is still used in drivers/infiniband/hw/mlx5/cq.c
> > > and declared in drivers/infiniband/hw/mlx5/mlx5_ib.h ...
> > >
> > > I have used the version of the rdma tree from next-20181203 for today=
. =20
> >
> > Huh. So apparently every compiler that tested this patch (0-day, mine,
> > the submitters) optimized this call away because is_atomic_response()
> > always returns 0: meaning mlx5_get_atomic_laddr is never callable and
> > can be deleted entirely, including the call to mlx5_get_send_wqe.
> >
> > Not sure what compiler setup will hit this, but it is clearly wrong
> > code..
> >
> > Guy/Leon, please send a fixup.. Maybe just delete all this
> > handle_atomics stuff? =20
>=20
> I deleted it and will wait for the results of regression prior to send th=
e patch.

I am still getting this error.

--=20
Cheers,
Stephen Rothwell

--Sig_/gcP/NiGqojFUI51DhDFM8j0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwJ3cQACgkQAVBC80lX
0GyItAf9FvphDCI5EvBs04a8UQkDV4gtTtTtrXDrKPrI92z34gRHAOlAtiCIRQXY
K6S85AYP95aN/ocOjR+DAb1tk9oOWAiMI3xUL/RFauxWF+q0yMXO0JhDyRMXsCPK
GOhrxGzKC1dl2WWuaNxapRg92W5Q4U2EXWXRepFT/ZJH+nmH0MESEGLjEzYDXSxt
485XWOLNESYR/9y6hxlWsmaCi9qit4e0bzrne8aLmyjHh+8sWJaLbVbSSLzdvqaS
15DienmVveQePTcpHazrw3U8aBTJ5+ABwYBBGjl0WnVutEyFHhdhMuitGElLchoZ
+emd3VHSObcBWNM0rNTU8ayZNjx/sQ==
=b4Ih
-----END PGP SIGNATURE-----

--Sig_/gcP/NiGqojFUI51DhDFM8j0--
