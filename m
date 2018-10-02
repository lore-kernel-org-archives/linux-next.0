From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the regulator tree
Date: Tue, 2 Oct 2018 13:07:48 +1000
Message-ID: <20181002130748.61e33ad1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/lWcejf6.y1SUup2Oj10x+Z."; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
List-Id: linux-next.vger.kernel.org

--Sig_/lWcejf6.y1SUup2Oj10x+Z.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the regulator tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/mfd/rohm-bd718x7.c: In function 'bd718xx_i2c_probe':
drivers/mfd/rohm-bd718x7.c:101:23: warning: cast from pointer to integer of=
 different size [-Wpointer-to-int-cast]
  bd718xx->chip_type =3D (unsigned int)
                       ^

Introduced by commit

  494edd266b94 ("regulator/mfd: Support ROHM BD71847 power management IC")

--=20
Cheers,
Stephen Rothwell

--Sig_/lWcejf6.y1SUup2Oj10x+Z.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluy4QQACgkQAVBC80lX
0GwbcAf+MsjPOmu3Z29V95rFk2s9TsbOK2F3/8MvHrmZImRvckGcvjuqiXIOcT7t
hOrZF8+BZi4tMjgy0ROyoCmnod4gujEZS0vnNGxLYtl4voEdBuQyy0T9xw2iTUds
0D2cpzxXLD3sk6JhjG+HLTpfedzaAFwLglDV/Byi0Sc2XO9mi3EWcMl47ASqXj7n
imjibhXVVYEktRKjzTI+czj/Dd6XV2CCIDms2ZkrdGxLkFGu0X4elbWYxWMuPbGn
7/ZP/DAhGj21BTr7CDVKhxQTNjZ76oOZvmm2IsVLwvLo1KVd90QOLFlnZB/iOOaw
vBL4X0q3otF6nMY/LqqBhEuI5uL2Hg==
=JOgX
-----END PGP SIGNATURE-----

--Sig_/lWcejf6.y1SUup2Oj10x+Z.--
