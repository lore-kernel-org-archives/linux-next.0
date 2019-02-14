From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Date: Thu, 14 Feb 2019 22:03:38 +1100
Message-ID: <20190214220338.7241bdc5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KlTLonZdfXUG/YUdjLwpWnH"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/KlTLonZdfXUG/YUdjLwpWnH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

In commit

  a5a0bbca16cd ("pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins")

Fixes tag

  Fixes: 0fefcb6 ("pinctrl: Add support for Meson8b")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/KlTLonZdfXUG/YUdjLwpWnH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxlSwsACgkQAVBC80lX
0Gw/ywf/THFr29snIMcqZ4CD7J83H5MzpQW4efbNUNk2+m4bZmJKLnIwRsywxwON
vO5BDH8Mc3DkoKA7V/mt1rbj/s7VlDilqsSOvKIFZ1GTdFFmCPOYCIK8uNlkV7eP
KHrf2A14r8QCSyHG/9W/MfRRHKH+ETqLZEqL2vUrhUbdi9/vWgwa1UnR1GpD5uBN
KQgweRJy1m/H3zzPb4UoSSDLr8iRY62RiGILFeYOhXrmdXWSeF2DR0dGR5JOpae/
BNMEJD98ivevj5kErGkMj8BT06PgyTsGvm53fReaPSkicWP3dBUvAbuS+3z4zjRl
wICUfOi6VuBElYbB1p5AQ6gjYISG/Q==
=x77H
-----END PGP SIGNATURE-----

--Sig_/KlTLonZdfXUG/YUdjLwpWnH--
