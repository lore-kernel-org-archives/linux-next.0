From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the gpio-brgl tree
Date: Thu, 24 Jan 2019 15:18:37 +1100
Message-ID: <20190124151837.1ca96816@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LlXZFtKaEVR7rnrGM1hZWEG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/LlXZFtKaEVR7rnrGM1hZWEG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

After merging the gpio-brgl tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/gpio/gpio-davinci.c: In function 'davinci_gpio_get_irq_chip':
drivers/gpio/gpio-davinci.c:472:9: warning: function returns address of loc=
al variable [-Wreturn-local-addr]
  return &gpio_unbanked.chip;
         ^~~~~~~~~~~~~~~~~~~
drivers/gpio/gpio-davinci.c: In function 'keystone_gpio_get_irq_chip':
drivers/gpio/gpio-davinci.c:480:9: warning: function returns address of loc=
al variable [-Wreturn-local-addr]
  return &gpio_unbanked;
         ^~~~~~~~~~~~~~

Introduced by commit

  ee5e87158e63 ("gpio: davinci: drop pointless static qualifier")

--=20
Cheers,
Stephen Rothwell

--Sig_/LlXZFtKaEVR7rnrGM1hZWEG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxJPJ0ACgkQAVBC80lX
0Gyx9gf9EKJ9DCt1Nu7gnajJQwYGbD7ESYO7qE4omL8blmk1d8l5HhZPRCUNwjEA
HnpxqQqbaTgnU0e/fW7RvtHI6awvPW5N+FMkejs55NPeOzQTTUyEeq7j4FzCNgO7
twVCJS0+ntB5FuwARb3uivUq2z6iMKTFBJaetxlGJ+JcTEIm/tT586aMkhlkdx8N
8wUMWSNXF/YlIx7RPaYtKYYwZYrQmnXTALuw8o1ApBZMyThMPj5XeoQo7EJH86Y2
UqgwNioJvYi6OY3xbnrD9dqrMOEV8sJuSkS4v3Befaxs9FqvsXTy0TvVZ7nOv7om
ZDWBZz+3qvSiy3Asu4XpCq1kdhG54A==
=Z22C
-----END PGP SIGNATURE-----

--Sig_/LlXZFtKaEVR7rnrGM1hZWEG--
