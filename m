From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the hwmon-staging tree
Date: Fri, 5 Apr 2019 07:54:38 +1100
Message-ID: <20190405075438.12f98275@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RUYEN55DHEtgzUPI3Ya1w2K"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/RUYEN55DHEtgzUPI3Ya1w2K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

In commit

  742ad88f0440 ("hwmon: (smsc47b397) Use request_muxed_region for Super-IO =
accesses")

Fixes tag

  Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

In commit

  4d730440042d ("hwmon: (smsc47b397) Use request_muxed_region for Super-IO =
accesses")

Fixes tag

  Fixes: 8d5d45fb1468 ("I2C: Move hwmon drivers (2/3)")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

In commit

  2f38d5d31508 ("hwmon: (f71805f) Use request_muxed_region for Super-IO acc=
esses")

Fixes tag

  Fixes: e53004e20a58e ("hwmon: New f71805f driver")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

--=20
Cheers,
Stephen Rothwell

--Sig_/RUYEN55DHEtgzUPI3Ya1w2K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlymbw4ACgkQAVBC80lX
0GzZGQf+ImWg5fJO857xqIEzCOY9mNJEEk+4n+FEMEwi3FI/QDrgNGdegm9D37PJ
gFHRSzX7wJPgvpbhTJTUFdPaqNrHIs/nIZLjyygWoPyIh1kZm4ZyiDyarJQb3wJq
G1bJx8k6J/snctmOLtHEfToAR219pe3MixQSexdNg58PNfONeIyxWBL/NbD7T94S
Ger1QUjgBNYO+LJHKh3dEzYmZOvmCscIKvC/AuuJxvpDJkPwa681w6Zg+u9zUh/m
EljHj7bS2DDicu7GpKmMR8kgMx2m8Ke1cX1FcwGTJCF6Iolq38p+pn8t3Jv8Z+nt
b//zGjAQYvDIc1JQTWA9hqzwLFbzrg==
=eXAO
-----END PGP SIGNATURE-----

--Sig_/RUYEN55DHEtgzUPI3Ya1w2K--
