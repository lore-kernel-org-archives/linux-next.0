From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the thermal-soc tree
Date: Tue, 27 Mar 2018 12:23:33 +1100
Message-ID: <20180327122333.1647bf10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.AN3DsL_R4KPyrNlfSGS+=j"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-next.vger.kernel.org

--Sig_/.AN3DsL_R4KPyrNlfSGS+=j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eduardo,

After merging the thermal-soc tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

drivers/thermal/samsung/exynos_tmu.c: In function 'exynos_get_temp':
drivers/thermal/samsung/exynos_tmu.c:931:37: warning: 'temp' may be used un=
initialized in this function [-Wmaybe-uninitialized]
   *temp =3D code_to_temp(data, value) * MCELSIUS;
                                     ^
drivers/thermal/samsung/exynos_tmu.c: In function 'temp_to_code':
drivers/thermal/samsung/exynos_tmu.c:304:9: warning: 'temp_code' may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
  return temp_code;
         ^~~~~~~~~

Introduced by commit

  480b5bfc16e1 ("thermal: exynos: remove parsing of samsung, tmu_default_te=
mp_offset property")

--=20
Cheers,
Stephen Rothwell

--Sig_/.AN3DsL_R4KPyrNlfSGS+=j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlq5nRUACgkQAVBC80lX
0GxWYAf/UH9SPcPyYjQSFxNsEIwHIs5m+gR9RP4YO3P57ecZzSTYgSX3ZYjHTeCp
+Fd/zzIKQANJHN0MWLcjguTz/SFzd7Uu+UXOq8Na6+Vp3mWpBzeXuYanjYzlV6/Q
iL9xIhYUPxa7vaJWTu+AwXYNg9idFqgzh2fav+g4Ll48Y5gUETTjT3Llzo0doHSU
Am/lSby5Dt+nwc66nMLnSW1u3Dh2m5OYJfbjwyMJuGOuarfGJ1dfp60TiKM9R/tk
PExqW0gV1QZHReaVSSrO0G5n4X4BUcOrmLJnXmDrI0WedvjcsH47MCHV8i2b9ND/
16vX5afGBrcRX6sPlc+HS/1rQRF6uw==
=ZH0v
-----END PGP SIGNATURE-----

--Sig_/.AN3DsL_R4KPyrNlfSGS+=j--
