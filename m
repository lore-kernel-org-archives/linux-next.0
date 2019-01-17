From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the amlogic tree
Date: Fri, 18 Jan 2019 08:16:01 +1100
Message-ID: <20190118081601.7d60679d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TzLGpye+9mTmxywcGg11Lja"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/TzLGpye+9mTmxywcGg11Lja
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  2839b54d4cae ("ARM64: dts: meson-gxbb-odroidc2: Fix usb phy reset warning=
")

Fixes tag

  Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)

has these problems:

  - SHA1 should be at least 12 digits long

Commit

  f01d1f474076 ("ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator pow=
er failed warning")

Fixes tag

  Fixes: 5a0803bd5ae ("ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes")

has these problems:

  - SHA1 should be at least 12 digits long

--=20
Cheers,
Stephen Rothwell

--Sig_/TzLGpye+9mTmxywcGg11Lja
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxA8JEACgkQAVBC80lX
0GzeBwf9GZ65sEI+qh9w5sIb2Ms8jvyHqkdpbgQwkv7k5ryycCJ4zycRGZCbViCN
Sfk/xGfWObpEXUI8f8A/ahEbqpEMkyUWWct5Cz4EeLPPsN64HJ/QyadPoopshmjs
aFddrrNt9zac2XrfeDIbJI9JOyUmEYzVrQfpfol9W+lPJ1/A4CUi2Slke2PjZn5z
B+jXDG+4bhdHeDT6LYFb4jxjuvV/6fodCtNDpiUYm1Jf3v9qbZnpj8m9DffZkV9H
wdd9rjl6CEoYBjpzhYzOLdyMBIoaxm+s1f1SgbEaD8YJOlBnaLcizc2sKKAOjSBd
7iEpeeZzprvGI0IImo2B2lz0TFVZtw==
=ZRnt
-----END PGP SIGNATURE-----

--Sig_/TzLGpye+9mTmxywcGg11Lja--
