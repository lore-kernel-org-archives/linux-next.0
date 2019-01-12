From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the pwm tree
Date: Sat, 12 Jan 2019 17:08:59 +1100
Message-ID: <20190112170859.2cee77d0@canb.auug.org.au>
References: <20190112170117.0d4674fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NCyz0D41LjETSkwD3QrFoy6"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190112170117.0d4674fa@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUs=?= =?UTF-8?B?w7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/NCyz0D41LjETSkwD3QrFoy6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 12 Jan 2019 17:01:17 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> [Reported by "kernelci.org bot" <bot@kernelci.org>]

[Also reported by Mark Brown <broonie@kernel.org>]

>=20
> After merging the pwm tree, today's linux-next build (arm64-allmodconfig)
> failed like this:
>=20
> In file included from drivers/pwm/pwm-imx27.c:15:
> drivers/pwm/pwm-imx27.c:292:25: error: 'imx_pwm_dt_ids' undeclared here (=
not in a function); did you mean 'pwm_imx27_dt_ids'?
>  MODULE_DEVICE_TABLE(of, imx_pwm_dt_ids);
>                          ^~~~~~~~~~~~~~
> include/linux/module.h:213:15: note: in definition of macro 'MODULE_DEVIC=
E_TABLE'
>  extern typeof(name) __mod_##type##__##name##_device_table  \
>                ^~~~
> include/linux/module.h:213:21: error: '__mod_of__imx_pwm_dt_ids_device_ta=
ble' aliased to undefined symbol 'imx_pwm_dt_ids'
>  extern typeof(name) __mod_##type##__##name##_device_table  \
>                      ^~~~~~
> drivers/pwm/pwm-imx27.c:292:1: note: in expansion of macro 'MODULE_DEVICE=
_TABLE'
>  MODULE_DEVICE_TABLE(of, imx_pwm_dt_ids);
>=20
> Caused by commit
>=20
>   5a309d380019 ("pwm: imx: Split into two drivers")

--=20
Cheers,
Stephen Rothwell

--Sig_/NCyz0D41LjETSkwD3QrFoy6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw5hHsACgkQAVBC80lX
0Gyipwf8DJ2WC3pLs3SOkW8TL5svLfIN+6kVEu8F1PPx0ZZQT9PlUCXonfGC3g/n
T6dcY5UU63BbqGWQQzob44nxO3LWakHJ0O6z522aJvU478K0dEW+pSMrfJfM0yjE
XHpM/HbbXr6acjfjckgsVF7lZ9Icl+rM3xUWN128JMfhWN+vZEG5XIKT0kAhR01U
y+Hvzk7B97PTqCYHX1XXqzq48Nd6t5cjyeSdx9hDSmamCMD0Oz0ahJ+0lpOkAxgD
XDQb0NhLaTokrDVE1mjYUtKEcY+NVgqcv1CfNglgrqV/NnabBvSoVTVXA3aX2FQx
WLwINzAmWl20pRqYiBOS99iXYuZF0A==
=VLlf
-----END PGP SIGNATURE-----

--Sig_/NCyz0D41LjETSkwD3QrFoy6--
