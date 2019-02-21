From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Thu, 21 Feb 2019 23:47:16 +1100
Message-ID: <20190221234716.2144eba3@canb.auug.org.au>
References: <20190212162003.1aa1ffbd@canb.auug.org.au>
        <20190212161528.GN12668@bombadil.infradead.org>
        <20190212162324.GU24706@mellanox.com>
        <20190213212621.GW12668@bombadil.infradead.org>
        <20190213220929.GO24706@mellanox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/c_h/E.UVLxT+_wKJIoRLxXt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213220929.GO24706@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Matthew Wilcox <willy@infradead.org>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/c_h/E.UVLxT+_wKJIoRLxXt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Wed, 13 Feb 2019 22:09:36 +0000 Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> I personally think it is not good to put major logic changes in merge
> commits, so I would prefer the #2 approach for this case.

These are not difficult merge fixes or logic changes.

> Also, the general philosophy that the person doing the tree-wide
> change should do the work :)

In fact, I have done the work :-)  All you guys have to do is inform
Linus and give him my resolutions.  The change to xa_alloc_cyclic could
just be a followup patch once the air clears.

> SFR's tree is just a reference. Who ever takes care to resolve these
> conflicts has to manually do the fixing up. If you do send your tree
> early I will fix it up as part of prepping the RDMA tree PR. Otherwise
> you will have to fix it.

Neither of you need to fix it ...

> What I don't want to see is we send both trees at the same time and
> neither gives merge guidance to Linus.

Well, I have now reminded you both, so hopefully you will both tell
Linus.

--=20
Cheers,
Stephen Rothwell

--Sig_/c_h/E.UVLxT+_wKJIoRLxXt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxundQACgkQAVBC80lX
0GzB6gf/UpBD366BoU94lj2JPVdQdYryZbK1+Pt6NiSoAIcSD7JDqyjnWJmJ8/aH
v34W8q0FxDn4CSBIUuXhzkogIEau4wu7/9MeViFcFUjEl5tbDKTXaHXoAy4rKmhm
mCnT4d0fkaqh506NMi5kGVZw0yx42i9okssVej/rNYk/+y0+hAzNExBY9UYOiWnG
yvPfcgoj7c/IxysXsPo/aAMGHUxY9bkRufpm2XmqcCBO6V8zc3uSAI1pv+93SkUh
O3lwTjaTZ11iYBrNbyn8ym+yas4CxQ18d0seEPAHoixSSJU34wqH7tz9wgrcxo5/
9YIeAMyeLKSvnj4tEk0xtaNTqqOHbg==
=5mxv
-----END PGP SIGNATURE-----

--Sig_/c_h/E.UVLxT+_wKJIoRLxXt--
