From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the spi tree
Date: Thu, 10 Jan 2019 11:41:13 +1100
Message-ID: <20190110114113.206c0650@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nv.Io.SxpMXN4dhoRe5XDBC"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/nv.Io.SxpMXN4dhoRe5XDBC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

After merging the spi tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/spi/spi-davinci.c: In function 'davinci_spi_setup':
drivers/spi/spi-davinci.c:426:21: warning: unused variable 'master' [-Wunus=
ed-variable]
  struct spi_master *master =3D spi->master;
                     ^~~~~~

Introduced by commit

  101a68e74fe0 ("spi: davinci: Convert to use CS GPIO descriptors")

--=20
Cheers,
Stephen Rothwell

--Sig_/nv.Io.SxpMXN4dhoRe5XDBC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw2lKkACgkQAVBC80lX
0GyIYQf+PUv+XgHMsQ08i3ot1I9lPw/rNPtWAUqSi7n9W11c/NawKaxx8s5zYzSh
ZaYXLgQWniImQwSn3S3QQOsb+U0/kkk7wX7cE5hgbsQSnHpLzAAysm6EmLBB/5lL
T8xEYLT73ch3nbNaPDVn/KLG+T16KIb1UuVdI1fupfqATez/uvtLVPQ7P7GLblML
6uSLpspUPGEB127KHeYTXDJdFCv90A0VfHjJKTqaZF0ZMT351OuVfDkZBgmiO1Qo
nBqSX2PsUM9RxVtsAQDQlanhcBQXwhwSFsZ6xkUKTBLW1MpEDduCi5K69LHxqQAz
dPdFk4Q5dx7lPPbAmcAH+mYndduUdQ==
=N72P
-----END PGP SIGNATURE-----

--Sig_/nv.Io.SxpMXN4dhoRe5XDBC--
