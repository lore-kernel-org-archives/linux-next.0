From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the rtc tree
Date: Wed, 21 Mar 2018 17:44:22 +1100
Message-ID: <20180321174422.0be4dedc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3IVKS+d_kqWJra3g6k1uU+Z"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/3IVKS+d_kqWJra3g6k1uU+Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

After merging the rtc tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/rtc/rtc-st-lpc.c: In function 'st_rtc_probe':
drivers/rtc/rtc-st-lpc.c:198:18: warning: unused variable 'tm_check' [-Wunu=
sed-variable]
  struct rtc_time tm_check;
                  ^~~~~~~~

Introduced by commit

  50f37481e794 ("rtc: st-lpc: remove artificial limitation")

--=20
Cheers,
Stephen Rothwell

--Sig_/3IVKS+d_kqWJra3g6k1uU+Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqx/0YACgkQAVBC80lX
0Gyhdgf/Qvk2Gt1DkERHxo+rbqc7rZ3XU29MtKvF+JV0mHHNuxT3/hl0U0FGv3Ll
wA1t0u/oUL0qFi6EX5/fKhUpLg4XuB0MeFnkhHNt2V6G/ihLWUGFy98sLDK/fn/E
2flSRkR6eXsN6iqB3m2lqbV37QKyxGocFxS5e3XBBURxp2Cd7PHDETVDxb5Li+gQ
KwDY0ZtZzT0soKQBFhFlloCsgFv+KLRQi8d3iEx7HUy9W52++FIgXbqkJw+zSUnl
ObZtmZIaYBoheR8vuZQxV7Hu9h+zDPd/0h5SvzV8Kqf6pWVPAzB9fVxUEkdydWDY
W/sLvo+Oegj5RKhDH50vwvJaUGSsGA==
=6Y2P
-----END PGP SIGNATURE-----

--Sig_/3IVKS+d_kqWJra3g6k1uU+Z--
