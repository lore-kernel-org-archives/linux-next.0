From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the xfs tree
Date: Wed, 30 Jan 2019 10:06:40 +1100
Message-ID: <20190130100640.5c2512a4@canb.auug.org.au>
References: <20190130075647.53e86078@canb.auug.org.au>
        <20190129220802.GC4205@dastard>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/iLFP5jwk9YbZv+n5EqBFhBM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129220802.GC4205@dastard>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Chinner <david@fromorbit.com>
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/iLFP5jwk9YbZv+n5EqBFhBM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Wed, 30 Jan 2019 09:08:02 +1100 Dave Chinner <david@fromorbit.com> wrote:
>
> Might be worth adding this to the boiler plate code:
>=20
> 	This can be fixed by adding the following to your ~/.gitconfig file:
>=20
> 	[core]
> 		abbrev =3D 12

Actually, since git v2.11 (released Nov 29, 2016), abbrev =3D auto (which
is the default) means that the default scales with the size of the
repository.  For Linus' tree, that currently produces 12 digit commit
SHA1 abbreviations, but will probably soon become 13.  So the best
currently, is to *not* set core.abbrev (or set it to something above 12
(for future robustness).

See
https://lore.kernel.org/lkml/20181220000112.24891-1-avarab@gmail.com/

--=20
Cheers,
Stephen Rothwell

--Sig_/iLFP5jwk9YbZv+n5EqBFhBM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxQ3IAACgkQAVBC80lX
0Gx37Qf9FSpK4OGd25bXQtiBYLML04zl/2Do252BnI4Gzn0uuvVPIrqh/d7585gs
nF2aL/pWKIDFXge+WzbD+Ki/J3XKMj3NnTHKw6ODd5b2H2EViO+RRv/6hmRdFRIU
8bD8LwsMIudDw43IF25XvOGTEyIAawjwXJhWplho2nciAg30PgsSMsw7UHp7JFF/
vHP3QTI70IC0xjyVH0PloBbhWbTK451LtqbIuum5JVftmy4w1trpm3QHGWfMUS+a
3Mk3JYgcNofj6d7g3TovqaNDAnMQ/CPMox5T2bUs4JZGMtJVcYyHzYJe40L2UY5T
uTZUQFUBPqwbqPYwKZqBxEbCder43A==
=dZmb
-----END PGP SIGNATURE-----

--Sig_/iLFP5jwk9YbZv+n5EqBFhBM--
