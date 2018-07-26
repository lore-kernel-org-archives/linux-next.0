From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the xarray tree
Date: Thu, 26 Jul 2018 10:03:52 +1000
Message-ID: <20180726100352.2d7c9c21@canb.auug.org.au>
References: <20180726072814.6c93b595@canb.auug.org.au>
        <20180725233621.GA20272@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SVpBEgyhG6eN5FgH7xs5lSx"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725233621.GA20272@bombadil.infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/SVpBEgyhG6eN5FgH7xs5lSx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On Wed, 25 Jul 2018 16:36:21 -0700 Matthew Wilcox <willy@infradead.org> wro=
te:
>
> On Thu, Jul 26, 2018 at 07:28:14AM +1000, Stephen Rothwell wrote:
> >=20
> > Commits
> >=20
> >   890e537e2b42 ("filesystem-dax: Introduce dax_lock_mapping_entry()")
> >   aaf149902c79 ("filesystem-dax: Set page->index")
> >=20
> > are missing a Signed-off-by from their committers. =20
>=20
> Oh, hah.  I assume this is an automated email?

Well, semi-automatic :-)

> These two commits I cherry-picked from the nvdimm tree so that XArray can
> be rebased on top of it.  Is there some other way I should be doing this,
> like rebasing on top of the nvdimm tree?

Ideally, the nvdimm tree would have just those two commits in a branch
that you could merge (so that you both have the same commits (as
opposed to patches)) that way these changes cannot cause conflicts when
the files are further modifed in either tree.  Alternatively, if you do
have to cherry-pick them, then you need to add your Signed-off-by to
the copy that you commit.

As things are now, you could merge commit

  c2a7d2a11552 ("filesystem-dax: Introduce dax_lock_mapping_entry()")

from the nvdimm tree into your tree before the conflicting commits in
your tree (or just rebase your tree on top of that commit).  You need
to make sure that Dan and/or Dave (cc'd) will never rebase that part of
their tree.  Also, you will pick up some other commits (which may not
be a problem for you).
--=20
Cheers,
Stephen Rothwell

--Sig_/SVpBEgyhG6eN5FgH7xs5lSx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltZD+gACgkQAVBC80lX
0Gxv5Qf+OCqn81Iw9tHqUcywVWSKZYQHrfz6r96elRGsRmQzf5+ISrtqxh1MFIn2
uX0kJxXf6/ZD/4Xt6TWH/BDEECJ4Gw4sc7zM2QrigcANWPSZskZt25iVJzn9FEQa
n27uGdFsaOd1yCVAiyCPGUKsca/wTlqrhYZe6lbBlCqdmjDFhQHZqD4sA9chruY3
yhez20dCkNik+jUloZqBjZcI8SedNXsGA7vQpS84WxskIwwTzbNK+0y6PFt3hhOF
pjAo5JuEofOsUqVkvj2jojTcD3Gbx7oztxBWLHn9TFT+MChIUgr++3O/iUzgD9cF
LHrQ6qchM7sG00JQ2f2IF2DbYtMavg==
=2c05
-----END PGP SIGNATURE-----

--Sig_/SVpBEgyhG6eN5FgH7xs5lSx--
