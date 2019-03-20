From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the hwmon-fixes tree
Date: Thu, 21 Mar 2019 07:48:37 +1100
Message-ID: <20190321074837.455ce23c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ldfzovifLuA+5x5wTb0r.=="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eddie James <eajames@linux.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ldfzovifLuA+5x5wTb0r.==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

In commit

  9940b52b73e4 ("hwmon: (occ) Fix power sensor indexing")

Fixes tag

  Fixes: 54076cb ("hwmon (occ): Add sensor attributes and register ...")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/ldfzovifLuA+5x5wTb0r.==
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlySpyUACgkQAVBC80lX
0GwdxAgApA07TST/GYz44x6VzeKT86zGIYlCqDnF/vIDd9o/8eiab8lEWtai6HJ2
4gCUSEVA1KLTFnxiQXHdyp1fuSoMRjph0EcF3fl+jMMe8DanSU3ryQ8D7c6WNhGC
Pjdo03oUv6sn3gNYXLAFEgwvFReVhbfqFvZZSUuyljuUAnqaoiA/PY4S0+IdYkiE
QkbagHSSPbsyj31i8jFpBZryU7wGiP6K3MHhXoV8PgD9etLMz1NlTP1CQB8Rxtce
qQarZCn1gIdwbH2LN6ZfVcR7psuPa/VG+1dyNO6xkQvuRQRd64jF27N1Y+UvSrSY
6sIeIAF866X9/ADR3pGcJ5gbN5mt2Q==
=w2kI
-----END PGP SIGNATURE-----

--Sig_/ldfzovifLuA+5x5wTb0r.==--
