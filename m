From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio tree
Date: Tue, 6 Nov 2018 12:15:02 +1100
Message-ID: <20181106121502.00efbd07@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/nJS+XEbRbrhzykgBwHnC4Qb"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUs=?= =?UTF-8?B?w7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
List-Id: linux-next.vger.kernel.org

--Sig_/nJS+XEbRbrhzykgBwHnC4Qb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpio/gpiolib.c:1514:12: warning: 'devm_gpio_chip_match' defined but=
 not used [-Wunused-function]
 static int devm_gpio_chip_match(struct device *dev, void *res, void *data)
            ^~~~~~~~~~~~~~~~~~~~

Caused by commit

  48207d7595d2 ("gpio: drop devm_gpiochip_remove()")

--=20
Cheers,
Stephen Rothwell

--Sig_/nJS+XEbRbrhzykgBwHnC4Qb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvg6xYACgkQAVBC80lX
0GxG8gf/WbVRfWaYn3Lngdi5dnLP9BfjaWoiXZDfL5yXP1l/vtfsweW6aba88Hpo
cYyDwjsIvYSPttcJQzzr/mQAUL0rbpw0T1kwpuBvRw+n/y9QlEiewG5ZeZDnKK7c
me07E8D4Hq6wSo4ogXYCc78ZJwCTTkNEM+90aIt3oLfU8RVYP6QSVKOzPSVubwDt
z05KJEr5OKH8lA1+jRqZGIdot7U478+A5czV4LhBZF/EbBke/rNShxqrLOekKHbP
ZadZnxc3J6+jOP/wSRPYwMjYPAq2C6NEB2nHvzzbq/isbnIycS/fxQq+/OHIiwt9
JKL4p2C12OcmbiZ7bCThdJrIVCT8GA==
=2g08
-----END PGP SIGNATURE-----

--Sig_/nJS+XEbRbrhzykgBwHnC4Qb--
