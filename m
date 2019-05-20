From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the jc_docs tree
Date: Tue, 21 May 2019 07:44:35 +1000
Message-ID: <20190521074435.7a277fd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V4O.sG0YFJXoinnNPT=P0d="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sven Eckelmann <sven@narfation.org>
List-Id: linux-next.vger.kernel.org

--Sig_/V4O.sG0YFJXoinnNPT=P0d=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9eaa65e8aad5 ("scripts/spdxcheck.py: Add dual license subdirectory")

Fixes tag

  Fixes: 99871f2f9a4d ("scripts/spdxcheck.py: Fix path to deprecated licens=
es")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: e6d319f68d4d ("scripts/spdxcheck.py: Fix path to deprecated licenses=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/V4O.sG0YFJXoinnNPT=P0d=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzjH8MACgkQAVBC80lX
0GzBOgf/QfSfS+HQRpf3I36LDtv+x/5+F5QiUXWyRAx1FTTkCf53Z7QRNu+qhyQn
yBM0eHrOdluiX4DpBKNC2VheMFeSY5Ic8i30fHM2JPvOE8mSpDJ52UIg7qptA1nS
q6Lv+GmOtwNpXFUF35SXGrkllTluTri8hiRU51zq6VOOumBMrZSsnMXfxrs4whck
8kuFTZcL0Lma5ZGx1WaYsTizaj2BdFuIzAWUyvdBVWO7FVMA2xqc6DDyEh1C2U+J
pt5m8Jp1cT2CYT01Z+N2h0Hjxe9WvdJh9zmewSP0Lf0UUsOkxNOYLz+yfW2D9RlR
fCXU6vvYdAbtxaocFlnzfR5TyArCrg==
=FpY+
-----END PGP SIGNATURE-----

--Sig_/V4O.sG0YFJXoinnNPT=P0d=--
