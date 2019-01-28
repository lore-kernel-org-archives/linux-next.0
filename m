From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the hwmon-fixes tree
Date: Mon, 28 Jan 2019 12:18:55 +1100
Message-ID: <20190128121855.55ef0b9c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5.SzisS3xg0ya0Y=1hBFfo."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/5.SzisS3xg0ya0Y=1hBFfo.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

In commit

  315fd42cc1f8 ("hwmon: (nct6775) Fix fan6 detection for NCT6793D")

Fixes tag

  Fixes: 2d99925a15b6 ("hwmon: (nct6775) Separate fan/pwm configuration

has these problem(s):

  - Subject has leading but no trailing quotes

Pleas do not split the subject over more than 1 line.

--=20
Cheers,
Stephen Rothwell

--Sig_/5.SzisS3xg0ya0Y=1hBFfo.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxOWH8ACgkQAVBC80lX
0Gx0fgf/eZxT5Es2cZhjd6jEDsBGQgTH5lAecKkuRyG1KFj8uZ7YF5qsQ8e0j7Qo
7TZ8r0tz876sPHwiJ+W6O1ebnziN5RIEksfbaCunokdsYWY3zQrdphVhQoRT0ubY
m7AausqVBChNH4MAj/MRPuiZDLPd+UPHoUHNZNGjlnltnd7GwyeacClOeLlDkzQb
ALzcWJD1ETaEh7g7YE8gZehBD/gb5xC6IRVDL0stI5BsvZ2SDmPvnSM1/37Us7BY
6oQCFFHAsojT7DSN054Rbo1Lw4CExRAbC4vnx/HnWUdHQuSbJ44OGHJhRCtagAkQ
oukto2F2uU/vrOnAAL1LzvbouOtVXg==
=TQIr
-----END PGP SIGNATURE-----

--Sig_/5.SzisS3xg0ya0Y=1hBFfo.--
