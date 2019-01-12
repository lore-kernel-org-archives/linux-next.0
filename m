From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the pwm tree
Date: Sat, 12 Jan 2019 17:01:17 +1100
Message-ID: <20190112170117.0d4674fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZESKFcVIB9NPtY2Bj7f7hPG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUs=?= =?UTF-8?B?w7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/ZESKFcVIB9NPtY2Bj7f7hPG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Reported by "kernelci.org bot" <bot@kernelci.org>]

After merging the pwm tree, today's linux-next build (arm64-allmodconfig)
failed like this:

In file included from drivers/pwm/pwm-imx27.c:15:
drivers/pwm/pwm-imx27.c:292:25: error: 'imx_pwm_dt_ids' undeclared here (no=
t in a function); did you mean 'pwm_imx27_dt_ids'?
 MODULE_DEVICE_TABLE(of, imx_pwm_dt_ids);
                         ^~~~~~~~~~~~~~
include/linux/module.h:213:15: note: in definition of macro 'MODULE_DEVICE_=
TABLE'
 extern typeof(name) __mod_##type##__##name##_device_table  \
               ^~~~
include/linux/module.h:213:21: error: '__mod_of__imx_pwm_dt_ids_device_tabl=
e' aliased to undefined symbol 'imx_pwm_dt_ids'
 extern typeof(name) __mod_##type##__##name##_device_table  \
                     ^~~~~~
drivers/pwm/pwm-imx27.c:292:1: note: in expansion of macro 'MODULE_DEVICE_T=
ABLE'
 MODULE_DEVICE_TABLE(of, imx_pwm_dt_ids);

Caused by commit

  5a309d380019 ("pwm: imx: Split into two drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZESKFcVIB9NPtY2Bj7f7hPG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw5gq0ACgkQAVBC80lX
0Gz+egf/WgHT/1rkRA3fJKK47K3izXK8iIuwLl1jaulPBkhFXVTt55oKXhgtxbOZ
wHpdFXQ15cTLgQgG85E7jtSK5E5jzhZtnvilos8sfU6sKvmwGcGhU7PB1TW2H3y9
lQZUuY/TJ/tt/6TCWtJA49MObpZeJqpinzuyb6Ig986sX5raOEBPq1WV8z/kAo4w
1GTdByZuzjiaJkb7FQySQI3osn9L1DFyoR/szAoST010HXchgui2BqM1Mo2YIbPf
SfpXGG0BLi84HAjVic8OgOXO3T2dE7WaglNOONio+ODI1HlDGCfLOj63Hbog1J3e
gyOfFwpM6aEAxvdLAQb301NcAAMunw==
=MDwn
-----END PGP SIGNATURE-----

--Sig_/ZESKFcVIB9NPtY2Bj7f7hPG--
