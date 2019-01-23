From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tags need some work in the dma-mapping-fixes
 tree
Date: Wed, 23 Jan 2019 23:13:59 +1100
Message-ID: <20190123231359.286ac584@canb.auug.org.au>
References: <20190123074747.7cd44f12@canb.auug.org.au>
        <20190123071933.GA24861@lst.de>
        <20190123230915.18046ca7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NR0=vs/oLSJSiJsEbEoN_CO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190123230915.18046ca7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NR0=vs/oLSJSiJsEbEoN_CO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Wed, 23 Jan 2019 23:09:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 23 Jan 2019 08:19:33 +0100 Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, Jan 23, 2019 at 07:47:47AM +1100, Stephen Rothwell wrote: =20
> > >   - SHA1 should be at least 12 digits long   =20
> >=20
> > When did we decide on that?  As far as I know it was bumped to 10
> > a while ago.  12 basically makes the line even more unreadable. =20
>=20
> From Documentation//process/submitting-patches.rst:
>=20
> "If your patch fixes a bug in a specific commit, e.g. you found an issue =
using
> ``git bisect``, please use the 'Fixes:' tag with the first 12 characters =
of
> the SHA-1 ID, and the one line summary."

That paragraph was added by commit

  8401aa1f59975 ("Documentation/SubmittingPatches: describe the Fixes: tag")

commited by Linus on 2014-06-07 (before it got moved to the .rst file).

--=20
Cheers,
Stephen Rothwell

--Sig_/NR0=vs/oLSJSiJsEbEoN_CO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxIWocACgkQAVBC80lX
0GxWAgf/dHViaPxy3pHznsrUeJM4vuvnMe/ZKRAZUdkpHSnxbJAD3F7jAAZH0XIY
sUprMmITVjVjW7Yr8Z8g8s08E9eojrUp4K7FmHLKmDlyoKrYtQxCAXb4Vw6G4h9t
+S8VMo2sB6GR/9z/ABfro6HVVMm97aIlCbCkAQkYeoJWuHRRRC8O0ppUG5TRdQNY
IL1smDGdYvzlGdSnHwCCjA/d8eUuJ+YQlqsIEcW1vr+g7Ynp2kyF9q8xLcTvAFMi
Mwu0k9QACS8+9fG+4l0RlxBMtacgwSB/ugnCYURcjgBbysPsQnrGv80iE3a1zvoi
XgOcZ0U7mObkZZMPlHPBVF5WWTwSPg==
=bXTq
-----END PGP SIGNATURE-----

--Sig_/NR0=vs/oLSJSiJsEbEoN_CO--
