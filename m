From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please clean up the v4l-dvb-next tree
Date: Wed, 20 Feb 2019 10:57:03 +1100
Message-ID: <20190220105703.69c9b582@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/K_B8T43XAryDoJ6zl_PUVi6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/K_B8T43XAryDoJ6zl_PUVi6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

It seems most (if not all) of the commits in the v4l-dvb-next tree are
also in the v4l-dvb tree and are now causing lots of conflicts when I
merge them both.  Please clean it up.

--=20
Cheers,
Stephen Rothwell

--Sig_/K_B8T43XAryDoJ6zl_PUVi6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxsl88ACgkQAVBC80lX
0GxaMwf6A+gpGs2vkgWY9iBnIVQ2FudZoKz6zhpOWx/ZAebtqUTkrCzR6IjDZ5FV
n2zR3FDylV7IiOEZHtMqhqbK9emb4f3AGE9tYWUZYuqJ1nle2Ru9WYrbBoBU7Lo/
efdrNSAZ72YLt3o9pDOi1+t28/RKvEKPa26u+pqW1RKv8QKHFKve7eJ8MkoWHdTJ
V2EukCXvICW5PEjgk3czzMx3HvxL9P55TL19dvpxlex0vfcspiIhqqjgy7HBi2KX
xH8dMebs4VjdvPnbnhKTbFFcCENA2L5IfSLerU4U2xd+bWcbtY9I9TOP1ATn9PjY
S2fArRS+WCscvez8KxL959LdU2Zwqg==
=+aMG
-----END PGP SIGNATURE-----

--Sig_/K_B8T43XAryDoJ6zl_PUVi6--
