From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Fri, 17 May 2019 21:12:02 +1000
Message-ID: <20190517211202.326f8e41@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Bdn_zSOodR4h__UBuliB9D/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Bdn_zSOodR4h__UBuliB9D/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ad6eecbfc01c ("ASoC: cs42xx8: Add regcache mask dirty")

Fixes tag

  Fixes: 0c516b4ff85c ("ASoC: cs42xx8: Add codec driver

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/Bdn_zSOodR4h__UBuliB9D/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzelwIACgkQAVBC80lX
0GwOUQgAoklIJswg5qLO7Xv/luOf1j6IF1NczOa4mI3ci1n2MJLBqmg3jXITWDg8
ZP9uiY+gTJtKGLdD/ab85FpxwtRdzvJ/f1mvORl96J3cHjG2zv2az3gsYdCuKxd3
wALx6QpQh8NN5rVQDiph3DVnAiE6iqvKdFjnosEcux/jgjh8o4craTSGvK36bru7
fL3cnia4BzBnJMLjPZMdnEUG9aEA0KJQAe44KEueJLYpe6WgdmCDVaV5D3zzQxLE
CjRk0rNIry0J4mk5+mdDiPqN5DbzQOLSM3PUDCWX70UfVkbtGud1/jHeyUQ3705d
96er6PiVDJPwLa+k6N2Q12cTxgBMgg==
=Ua67
-----END PGP SIGNATURE-----

--Sig_/Bdn_zSOodR4h__UBuliB9D/--
