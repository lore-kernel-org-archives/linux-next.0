From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the xarray tree
Date: Wed, 27 Jun 2018 13:09:50 +1000
Message-ID: <20180627130950.43922340@canb.auug.org.au>
References: <20180618132712.4b4eddc9@canb.auug.org.au>
        <CAPcyv4idNE8ErxNm5bb3rG4jUeZU9HJRmO03omMJxSN-8FYN+w@mail.gmail.com>
        <20180618170920.GC28748@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Hgc937KfImDIgoXlsGBE6Hd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618170920.GC28748@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Dan Williams <dan.j.williams@intel.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Hgc937KfImDIgoXlsGBE6Hd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Jun 2018 10:09:20 -0700 Matthew Wilcox <willy@infradead.org> wro=
te:
>
> On Mon, Jun 18, 2018 at 09:50:33AM -0700, Dan Williams wrote:
> > On Sun, Jun 17, 2018 at 8:27 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote: =20
> > > Hi all,
> > >
> > > After merging the xarray tree, today's linux-next build (powerpc
> > > ppc64_defconfig) failed like this: =20
> [...]
> > > from the nvdimm tree.
> > >
> > > Willy thanks for the heads up about this.
> > >
> > > I have applied the following merge fix patch (taken from the diff bet=
ween
> > > the -next tree at this point and the xarray-20180615 branch from the
> > > xarray tree) for today. =20
> >=20
> > I was hoping that dax_lock_page() and the memory_failure() handling
> > could go in before the xarray rework. This helps -stable and distros
> > that need to backport this error handling support. Willy, would you be
> > amenable to rebasing on top of the next rev of the
> > dax+memory_failure() work?
> >=20
> > Apologies for the thrash. =20
>=20
> I am absolutely amenable to rebasing.  The only problem is that I'm
> in Tokyo for the next two weeks.  I can put some work in on this, but
> coordination may be a little off.  If somebody else wants to do the work,
> the only (serious) difference between the xarray-20180615 and xarray
> branches in my repo is that the former is based on the dax_lock_page()
> changes having gone in.
>=20
> The differences sum up to:
>=20
> +@@ -414,8 +413,7 @@ struct page *dax_lock_page(unsigned long pfn)
> +=20
> +               entry =3D __radix_tree_lookup(&mapping->i_pages, index, N=
ULL,
> +                               &slot);
> +-              if (!entry ||
> +-                  WARN_ON_ONCE(!radix_tree_exceptional_entry(entry))) {
> ++              if (!entry || WARN_ON_ONCE(!xa_is_value(entry))) {
> +                       xa_unlock_irq(&mapping->i_pages);
> +                       break;
> +               } else if (!slot_locked(mapping, slot)) {
>=20
> (in "xarray: Replace exceptional entries")
>=20
> then dax_entry_waitqueue() changing its argument in "dax: Hash on XArray =
instead of mapping".
>=20
> and finally the patch converting dax_lock_page() and dax_unlock_page().
>=20
> I really wanted to keep the thrash here to a minimum, but this is the
> best I could come up with in terms of minimising conflicts :-(

This has all gone away today as the conflicting commits have been
removed from the nvdimm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Hgc937KfImDIgoXlsGBE6Hd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsy//4ACgkQAVBC80lX
0GxlwQf/VJ9c2xUlU1cAdGS5FsKxVc7cz8esTDMQdbjCXPspyL9mAr1iBSCuqc2+
Fdq5rfTWqxln+qcnOTu5p99s2d9ACpS0bq2OOYWUUnpHOAhxbgONjoDB79M82uab
lX5vyH0ItNmRjaNOPLc+3IX0zvmIavdRIcD6xCVCZ8s+dy5H4ewhRdXwXpHZQlG9
VlR0ntmZRsgrf4y96c8IIsYllDAa9eB3zD3TIBnCDzqYfoJaT6Ypr3ifEVgRPxAz
ECRmA3eAQKoUOvJ/14xZhyia4acxZXCQ0KDHhaYM9UgkFSNzrn6lEqas+h2seyWX
B4w4ZnAAqYrpOG5XATOKs7wnM9BeJg==
=ddow
-----END PGP SIGNATURE-----

--Sig_/Hgc937KfImDIgoXlsGBE6Hd--
