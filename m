From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Wed, 13 Feb 2019 12:31:29 +1100
Message-ID: <20190213123129.2961c236@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SES/Uk8Zq=n8IQY6xaCHmr6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-next.vger.kernel.org

--Sig_/SES/Uk8Zq=n8IQY6xaCHmr6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/soc/samsung/i2s.c: In function 'samsung_i2s_remove':
sound/soc/samsung/i2s.c:1469:27: warning: unused variable 'priv' [-Wunused-=
variable]
  struct samsung_i2s_priv *priv =3D dev_get_drvdata(&pdev->dev);
                           ^~~~

Introduced by commit

  a404b72d2bdd ("ASoC: samsung: i2s: Convert to single component with multi=
ple DAIs")

--=20
Cheers,
Stephen Rothwell

--Sig_/SES/Uk8Zq=n8IQY6xaCHmr6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjc3EACgkQAVBC80lX
0GxTDwf/S2h2/y6jfYGlw1Xos8AxugZtWyWGhOFelbPkIXovmRuwRbr8xdHMQq7/
QHIsHjhMkgL/faf7DvXa1tm5nBaCkulm9nt61Wev2/pXb86tvdb0sLbYSXy8RTcB
+pKlRTIVmk4cN4zg02kELUHjHV4CrJZQWJacOZB2LTBm+UCgU+P6ejy8D0UrM/ck
+R1QTTn9QAHuCc+8PQYFsimKS7pl6jYknzkTKHr96/wTAGv9JjvhYBodq0QkdcGP
0Cw4GgNiKsUGLY1sR238WuIH70Osi09SydhpL6I/miWgQXzVXQihstc5NPY5j6kN
ruOTLbaCD8eePWg2hRUE7zs/blhC7A==
=Sbqi
-----END PGP SIGNATURE-----

--Sig_/SES/Uk8Zq=n8IQY6xaCHmr6--
