From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the spi tree
Date: Thu, 4 Apr 2019 13:33:17 +1100
Message-ID: <20190404133317.56500903@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AqdhqQ7YcD9z6.=F1JwP81R"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nishka Dasgupta <nishka.dasgupta@yahoo.com>, Stefan Roese <sr@denx.de>
List-Id: linux-next.vger.kernel.org

--Sig_/AqdhqQ7YcD9z6.=F1JwP81R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the staging tree got a conflict in:

  drivers/spi/spi-mt7621.c

between commit:

  cbd66c626e16 ("spi: mt7621: Move SPI driver out of staging")

from the spi tree and commit:

  18f0e249da67 ("staging: mt7621-spi: Remove parentheses")

from the staging tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/spi/spi-mt7621.c
index ae836114ee3d,0e0e67280b00..000000000000
--- a/drivers/spi/spi-mt7621.c
+++ b/drivers/spi/spi-mt7621.c
@@@ -305,8 -301,8 +303,8 @@@ static int mt7621_spi_setup(struct spi_
  	struct mt7621_spi *rs =3D spidev_to_mt7621_spi(spi);
 =20
  	if ((spi->max_speed_hz =3D=3D 0) ||
 -		(spi->max_speed_hz > (rs->sys_freq / 2)))
 +	    (spi->max_speed_hz > (rs->sys_freq / 2)))
- 		spi->max_speed_hz =3D (rs->sys_freq / 2);
+ 		spi->max_speed_hz =3D rs->sys_freq / 2;
 =20
  	if (spi->max_speed_hz < (rs->sys_freq / 4097)) {
  		dev_err(&spi->dev, "setup: requested speed is too low %d Hz\n",

--Sig_/AqdhqQ7YcD9z6.=F1JwP81R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlylbO0ACgkQAVBC80lX
0Gx6Igf+K2YKTdU37c54sj8H7yIHR+NLJGaQWmWw0Nh4eEYs8dhI4RlT3znViScu
V3GEOo1xJXOtTuN61IlPwFMnIHiUdpCFqid9bjf3IC6b9eM33JhCNf7oVSZSCW/P
Sbky67qdms3cNPyLogcTuDpy+0L1ZO5X5zRNRXB7fxEQ+MUZqzNoZ6bfCsiVC8KL
5DnmC+lKsxS0aVKNZWgi3xnRDCoZKwlT1Oxw4Wxp8XQCQ5Y5Y5GLTwYh1l++7m3i
kNJnDBfa8IuPAic5rtO5b4Zv/BVmE9IkNN6KgOQkl5lhD7Mdwz0Mo6f1xpAqqJ1y
b3CpMnwsJn5IjpvlaqlZrnPP4FKm/Q==
=mtkn
-----END PGP SIGNATURE-----

--Sig_/AqdhqQ7YcD9z6.=F1JwP81R--
