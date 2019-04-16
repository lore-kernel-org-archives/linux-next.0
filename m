From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the chrome-platform tree
Date: Tue, 16 Apr 2019 14:30:30 +1000
Message-ID: <20190416143030.07537982@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//BOQKd8ymmpCrPnrqxk/2FO"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Benson Leung <bleung@google.com>, Guenter Roeck <groeck@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Crews <ncrews@chromium.org>
List-Id: linux-next.vger.kernel.org

--Sig_//BOQKd8ymmpCrPnrqxk/2FO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the chrome-platform tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

In file included from drivers/platform/chrome/wilco_ec/debugfs.c:11:
drivers/platform/chrome/wilco_ec/debugfs.c: In function 'fops_h1_gpio_open':
drivers/platform/chrome/wilco_ec/debugfs.c:210:59: warning: format '%x' exp=
ects argument of type 'unsigned int', but argument 2 has type 'long long un=
signed int' [-Wformat=3D]
 DEFINE_DEBUGFS_ATTRIBUTE(fops_h1_gpio, h1_gpio_get, NULL, "0x%02x\n");
                                                           ^~~~~~~~~~
include/linux/debugfs.h:45:29: note: in definition of macro 'DEFINE_DEBUGFS=
_ATTRIBUTE'
  __simple_attr_check_format(__fmt, 0ull);   \
                             ^~~~~

Introduced by commit

  db6c540a0018 ("platform/chrome: wilco_ec: Add h1_gpio status to debugfs")

--=20
Cheers,
Stephen Rothwell

--Sig_//BOQKd8ymmpCrPnrqxk/2FO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly1WmYACgkQAVBC80lX
0GzrawgAoPvOqwI2AdlKc0GxmhLUlOjQejEBgooTENhIFcmLetwcWkxEDKeLuafT
IQMPJ/yaBhqIR8AxKZT5HBT59mdusNqMHFodslqHFvIDQihbLIQMAA4IsWju7VD/
M/K4H/u3qox6jbu+gM1m9Vc29kwA9WA31ycnEjG+2P3VSycszZH8tBedZT3EpABD
kN+4k06xAn3LseU07Ja9TzEntQaUOZU0WEIwGi3obrIf5E/9lV82wYt1Y6rPcn/X
Nap3GnX6n24j3Gc2v6mDinT7D/MRkBqtnD4Fa/ExA65zljjqM/OP2AOVXT/YDSTL
ZClEi+rY3sZ5+8ZejPsQ7rBFW1OaHw==
=9j2L
-----END PGP SIGNATURE-----

--Sig_//BOQKd8ymmpCrPnrqxk/2FO--
