From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Thu, 21 Feb 2019 13:16:31 +0000
Message-ID: <20190221131628.GA23561@mtr-leonro.mtl.com>
References: <20190221171332.262cf619@canb.auug.org.au>
 <20190221123440.GD17501@mtr-leonro.mtl.com>
 <20190221234801.7cc07a7c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221234801.7cc07a7c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matthew Wilcox <willy@infradead.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 21, 2019 at 11:48:01PM +1100, Stephen Rothwell wrote:
> Hi Leon,
>
> On Thu, 21 Feb 2019 12:34:42 +0000 Leon Romanovsky <leonro@mellanox.com> wrote:
> >
> > Matthew, really? change of API in -rc7? And it after you pushed us to
> > base our -next on -rc5 after another API change? What should we do now?
>
> The xarray API changes (to xa_alloc and __xa_alloc) have been in
> linux-next for about 2 weeks ...

I looked on the latest update of pulled branch
http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/heads/xarray

>
> > Can you please ensure that you are sending your pull request to Linus,
> > after RDMA pull request will be successfully merged?
>
> It doesn't matter which goes in first, but whoever goes in last should
> inform Linus about these (now 2) API change fixups.  In fact you should
> probably both let him know as he sometimes batches up similar groups of
> merge requests (like fs or net) and doesn't do them in the order they
> are submitted.

OK, we will do.

Thanks

>
> --
> Cheers,
> Stephen Rothwell



--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcbqSsAAoJEORje4g2clin2KQP/0xyZAp+dEVyy2sxhV64hXxN
PRcfY3qwTDZaAYLyfbASgNT7JIVZpGVT2LP+u0gwj7s1arv6XOKmr2Zkl3LpocPi
CtssucoDmJniIRq/XeZWjpvq+fWa6Pg1E0rzLDhPPK9nqNkGo2kyWAFpE9agPKcn
1xDzPLdnz7XxzCHTVandYb5IvDsNDlDNlK4muvALrrbQlOy6Cac2w2ZXqsguVK3i
eGp+gr0oSFLeJSJnG4O8e5z79HfnWVjRp/2OVu0MafcBrjlLQxLU+dyhd3GSM8uQ
QSVEOqvV1JJyHSu/gUGAX5vQ9vbNAcJS9fZZ08c+fzai8NOWx/V7v4sCdT0HSSmp
+DHbEw0lCkW+A7qDG4bzvobTGF/vyZxzTlnhLyKKt/s1pN7ykOlckvFRBLX4Y5o7
T0cY95ofDiymyCVeAGtEju3dKYif+sZdEttOXboCe5oJv18Pw0zXRU19jU5T1K0c
+aTRr7FKSc+1xgCf5QxCELIyJ+sxeQSZ/zeMJ0QSrx5IYVvv24XqjihD7ttylD2A
gPlQrsvDuHN6O3TtR02puJfmH5fe37eyCQ9rsCcWT7cYYg/rapSaavx5n9Mv2dp3
k0Jtnva0ngTxZ/Fcsm0g2tgFFGzuw7aXKmmMjhhh0yZBt9ks7ag5xQq6ZYDKH/Ih
9L0HbwWDwQbkmKncWXNI
=Amvs
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
