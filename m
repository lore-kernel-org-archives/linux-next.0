From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the jc_docs tree with the fscrypt
 tree
Date: Wed, 2 Jan 2019 11:37:02 +1100
Message-ID: <20190102113702.6e8888b4@canb.auug.org.au>
References: <20181207115340.2465a854@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//ETDC9oO9CAGT2bX_9x3odt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207115340.2465a854@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_//ETDC9oO9CAGT2bX_9x3odt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Dec 2018 11:53:40 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Hi all,
>=20
> Today's linux-next merge of the jc_docs tree got a conflict in:
>=20
>   Documentation/filesystems/index.rst
>=20
> between commit:
>=20
>   1b71a6809f96 ("fs-verity: add a documentation file")
>=20
> from the fscrypt tree and commit:
>=20
>   7bbfd9ad8eb2 ("Documentation: convert path-lookup from markdown to rest=
urctured text")
>=20
> from the jc_docs tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc Documentation/filesystems/index.rst
> index 818390c32be6,ba921bdd5b06..000000000000
> --- a/Documentation/filesystems/index.rst
> +++ b/Documentation/filesystems/index.rst
> @@@ -360,13 -360,13 +360,24 @@@ encryption of files and directories
>  =20
>       fscrypt
>  =20
>  +Verity API
>  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  +
>  +A library which filesystems can hook into to support transparent
>  +authentication of read-only files.
>  +
>  +.. toctree::
>  +    :maxdepth: 2
>  +
>  +    fsverity
> ++
> + Pathname lookup
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=20
> + Pathname lookup in Linux is a complex beast; the document linked below
> + provides a comprehensive summary for those looking for the details.
> +=20
> + .. toctree::
> +    :maxdepth: 2
> +=20
> +    path-lookup.rst

This is now a conflict between the fscrypt tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//ETDC9oO9CAGT2bX_9x3odt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwsB64ACgkQAVBC80lX
0GxG/gf+Mecmp6Kpm4B6lOe72Tj4ghgmOuAyqo2AtmmWjVFC82CmnlXbbAi39qPX
zzBjVV6twLwKMdWJbHGw4PClld30n3iup1o5LguljlhLJrbpHXs0mXIrmZsQx7H/
ATIfONXJwpF/M9Yzoi0RmAnoYf5V0yIQIa7sPLDptSpWwoBECvJAtk/8xDhtnm07
+WnDoMHucuVqd8BELHdoOGN86hO8Lw4yQYheKxGeikNj4JCj25Ob6KzOe6zvxj3t
I9Yz3UaZOZlnarg/YUUl32iKEXDdpRIHqbm5zFxxFaZd495Z1+ZrR1zS3/U56GZY
IRSKpkrDVCFucZMQKrYBuLYNWtXNmg==
=tEHw
-----END PGP SIGNATURE-----

--Sig_//ETDC9oO9CAGT2bX_9x3odt--
