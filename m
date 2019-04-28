From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the input-current tree
Date: Sun, 28 Apr 2019 16:54:53 +1000
Message-ID: <20190428165453.30c1dff0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sfDooC91NRA3T80DjEs1=nR"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lucas Stach <l.stach@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/sfDooC91NRA3T80DjEs1=nR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

In commit

  3a349763cf11 ("Input: synaptics-rmi4 - write config register values to th=
e right offset")

Fixes tag

  Fixes: ff8f83708b3e (Input: synaptics-rmi4 - add support for 2D

has these problem(s):

  - Subject has leading but no trailing parentheses

Please do not split Fixes tags across more than one line.  Just use:

  git log -1 --format=3D'Fixes: %h ("%s")' <commit>

--=20
Cheers,
Stephen Rothwell

--Sig_/sfDooC91NRA3T80DjEs1=nR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzFTj0ACgkQAVBC80lX
0GzPLwf9EC7TLYHfLDgW4R+8XVrxnrDBrWNxZW0de6ZQJDPxlP9rIenfapJrWrvb
gsx4dZeL42zKn9s/EU0YyuG/CZUbq/HaMl7vpt0Fc6beUfJIlza5UzdhGexw4ihL
E9tMvql2w+rj8MYrUEy1FKSuI5tU93yL41djPFaiqS07E3a87fcGESlgOqovI8RE
eJqoA5ebF+UbFfhKgZK7oid1T6kJlekuad/OqQ4tIhlsS7ht7j6vbCUZFtl5D7Jz
Wf57Ag7WMm7VWpoA7ZrwG4RkV1fkkb8S4agofPvnN5Um8gdUXAXuLZi3YkXAqOaq
PrsBQb+jdQAuayM3bTakovlQCyfjkw==
=oJFM
-----END PGP SIGNATURE-----

--Sig_/sfDooC91NRA3T80DjEs1=nR--
