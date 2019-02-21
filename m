From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Fri, 22 Feb 2019 00:23:56 +1100
Message-ID: <20190222002356.269ec801@canb.auug.org.au>
References: <20190221171332.262cf619@canb.auug.org.au>
        <20190221123440.GD17501@mtr-leonro.mtl.com>
        <20190221234801.7cc07a7c@canb.auug.org.au>
        <20190221131628.GA23561@mtr-leonro.mtl.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CHoKaR6d.48P86L+2vNrJNs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221131628.GA23561@mtr-leonro.mtl.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leonro@mellanox.com>
Cc: Matthew Wilcox <willy@infradead.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/CHoKaR6d.48P86L+2vNrJNs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Leon,

On Thu, 21 Feb 2019 13:16:31 +0000 Leon Romanovsky <leonro@mellanox.com> wr=
ote:
>
> > The xarray API changes (to xa_alloc and __xa_alloc) have been in
> > linux-next for about 2 weeks ... =20
>=20
> I looked on the latest update of pulled branch
> http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/heads/xa=
rray

Yeah, there were 3 commits added today, but the API changing commit is olde=
r.

> > It doesn't matter which goes in first, but whoever goes in last should
> > inform Linus about these (now 2) API change fixups.  In fact you should
> > probably both let him know as he sometimes batches up similar groups of
> > merge requests (like fs or net) and doesn't do them in the order they
> > are submitted. =20
>=20
> OK, we will do.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/CHoKaR6d.48P86L+2vNrJNs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxupmwACgkQAVBC80lX
0Gx14gf+LbqFhLHErbrJQrAMrlzbTjS+QDO3ubfnVwIc5MIZg3LsRpLx6DabeHk7
Y1g+r/Db2CbN0Ncc2YeS7ivfxJ2/xd3rFOx6qCti2IM1fpYYL91sMjx2JcxoFt5x
yw1jknRgeIEJIpV4/E7I5Y/CsdtNZKRzq6eNOutjt91oHIIswOfvOpebEMjd+Ntv
E5FUFHQGo5wUeIm74dRBF1GscF+FLQ8ctlrSJYfkABZ9TshHS1v2hIl/oTZvc4ag
m3jL4+Zx61szBV67CEexG6XDRNYgsVqJ5RVKVCkb4LtSb3F0Ysd1CzSt0vHd32LC
1dAWQs/uAQxUlwrNlm+NIY7/1+8pDg==
=MgXk
-----END PGP SIGNATURE-----

--Sig_/CHoKaR6d.48P86L+2vNrJNs--
