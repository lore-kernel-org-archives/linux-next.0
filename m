From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Date: Mon, 18 Feb 2019 09:25:36 +1100
Message-ID: <20190218092536.39375e84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AqoQsNNfF.q797PdzhkxiTK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/AqoQsNNfF.q797PdzhkxiTK
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

--Sig_/AqoQsNNfF.q797PdzhkxiTK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxp32AACgkQAVBC80lX
0GwSiAf/d52sVL8m2hkopn783J0sssYeK8taD3vLq0MiOBzO+FrZx2IyBoprFmaD
VZR7fD/nbws5TOMr0G2aH/6EJVV8jpXs33zHOedOmjH/EVv36NUf/VTht9sZZqd/
XA2KeuFHqMExE8SEjBtaFOF6WxsHz3DcCoE/3q2H9K+JQlAUbRRwo1HJyvaHH+Ct
AGhpJJv/lUa010dijRGJBs1IJ4V16ek+wcBcboIj3i986Lc4I6qni78mGoshhsNP
YCeicknpDrN5/dnIFX+3YGs1tNsodq1OdlqNhPeng6FdZ2NVYQrCFO139EsBRq3L
+uhDAIPIryhLIf+raeQW6ogaY63tEw==
=jKSz
-----END PGP SIGNATURE-----

--Sig_/AqoQsNNfF.q797PdzhkxiTK--
