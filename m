From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the sound-asoc tree
Date: Fri, 26 Apr 2019 13:05:49 +1000
Message-ID: <20190426130549.59f7e604@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/k0dArgqWDEr04j791JcWNGf"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/k0dArgqWDEr04j791JcWNGf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

sound/soc/fsl/fsl_sai.c: In function 'fsl_sai_remove':
sound/soc/fsl/fsl_sai.c:921:1: warning: no return statement in function ret=
urning non-void [-Wreturn-type]
 }
 ^

Introduced by commit

  812ad463e089 ("ASoC: fsl_sai: Add support for runtime pm")

--=20
Cheers,
Stephen Rothwell

--Sig_/k0dArgqWDEr04j791JcWNGf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCdY0ACgkQAVBC80lX
0Gy3hggAgta9W7V7Cb/iiPd73oUf4R+aUUAS4zRRgVmLIzmcoiVfZKfrlzyozGrb
XIKoTUzuqbNwQcyh35wVjT91/ZGsXufrno6CatyOySBv+5d3UnByxXo3M4wKh/lX
uwvuDRh5rzRtkwUwSsfm7zZqWgSO+HchLkFmQwAaHO6eN2oWySzLE20r+YaihBmj
+shkUE8gURA1M+X+Cvhy2H5scEak89Ac5U+0ZsY0s8BKuPZMzqB2rfn5ymis+8GK
Z6HNTEX1GV7hApAEe9gLyw+SXUwh6gLhsq9vHqcGGAx69vHc5G3o8GHA2u9njV7f
jojp7RHGsjFFulfrnRF8kEBUIRO7wQ==
=DZES
-----END PGP SIGNATURE-----

--Sig_/k0dArgqWDEr04j791JcWNGf--
