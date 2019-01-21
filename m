From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the pinctrl tree
Date: Tue, 22 Jan 2019 09:42:03 +1100
Message-ID: <20190122094203.54570662@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/9oi3s5XDxr69yehg7+C6bLZ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: linux-next.vger.kernel.org

--Sig_/9oi3s5XDxr69yehg7+C6bLZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

In commit

  15d90c339a7f ("pinctrl: sunxi: Correct number of IRQ banks on H6 main pin=
 controller")

Fixes tag

  Fixes: c8a830904991 ("pinctrl: sunxi: add support for the Allwinner H6

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes: tags over more than 1 line.

--=20
Cheers,
Stephen Rothwell

--Sig_/9oi3s5XDxr69yehg7+C6bLZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxGSrsACgkQAVBC80lX
0Gx1tggAiOhilq5/5UdLah4RSfv3BEye2oUOX4Em2WQRcR3K2SAFV/WqkRbc/qB4
GCDa6DAUUXs94QXDln3tV25PmHAp3WrxcN4DcThaqKCmtvHCsI2xDJ4RNKutS6JY
jfMCReXfSDX1+ehCnJtgB/C0Y1Oia2kn/OEPWnsqpAemF07ydRyVZRk65QT7dNEY
v341Y2WoZlGl1d1Rta9drHo35hqOWzW6pjh45aNx6inIZLeY+lw1kWKn3fDz4H5e
GmgvkluVQ2WaHv9If3QTVdX9xCsPMxEN+/kMELKkXqMWuVVegxkCIfZJS6v0YGV/
tMckmzxle9XFEc9drxFU/lG42ZzPEw==
=X9vq
-----END PGP SIGNATURE-----

--Sig_/9oi3s5XDxr69yehg7+C6bLZ--
