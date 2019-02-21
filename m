From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in Linus' tree
Date: Fri, 22 Feb 2019 07:16:55 +1100
Message-ID: <20190222071655.31e0fdbd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lHrgtj6XcjRWGQLRBff+fWi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Darrick J. Wong" <darrick.wong@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/lHrgtj6XcjRWGQLRBff+fWi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

In commit

  1062af920c07 ("tmpfs: fix link accounting when a tmpfile is linked in")

Fixes tag

  Fixes: f4e0c30c191 ("allow the temp files created by open() to be linked =
to")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/lHrgtj6XcjRWGQLRBff+fWi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvBzcACgkQAVBC80lX
0GzWPgf/eJLLEeL9nQ+U1BVDfIDO7GHG7/kua8bUonZR+bQVf7gDw9D+WwRotbP1
9GVkOZA5TcwHh2F2TMgXj6UzL4W6U3VrvRDSnhByYw0LktQZyKZ1jDc0uvrP7jDA
kSj1rKf9dsUyvUkD8DSEZAfS1n3DgSXBbbnIUXPWUCO47f1yvClaD2pZRQ5gLHhZ
Dc5dzAz/xVLesmdnV3nEB5tlFrK2tc5DjdLrfLiuwMy18RvuX/3CPmZMSDxhFJyM
EvjsvKExk3n8LFAiMEgf4F9O3pR77NzyN2twqVrSOpb8LqocAWCAFw+nEIu02NdY
w43NLPvM0MFDSbaTGDorzrJxvja1Fw==
=yAbA
-----END PGP SIGNATURE-----

--Sig_/lHrgtj6XcjRWGQLRBff+fWi--
