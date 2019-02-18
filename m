From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the regulator tree with the arm-soc
 tree
Date: Mon, 18 Feb 2019 12:56:27 +1100
Message-ID: <20190218125627.003fc22c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6OserSKOC8v+jPaIAfQNoFv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/6OserSKOC8v+jPaIAfQNoFv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the regulator tree got a conflict in:

  arch/arm/mach-pxa/raumfeld.c

between commit:

  0f884f8a090e ("ARM: pxa: remove raumfeld board files and defconfig")

from the arm-soc tree and commit:

  01dc79cd6fe7 ("regulator: fixed/gpio: Pull inversion/OD into gpiolib")

from the regulator tree.

I fixed it up (the former removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/6OserSKOC8v+jPaIAfQNoFv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxqEMsACgkQAVBC80lX
0GwROwf/SwwGRVit6+U+LEWNBpX8CiZt4OZKHSBnOtuEr11de294QGLeYUbkspmB
a18CsDhMcidHv5ubE8N1e53bUgOBmuc/LIZZKGrFuhT1+uouboE36CM3bHZKUeXQ
WY0O6rEHmI1Dy3wNAm/rFQjKe+2o53EHyEM2EU6vJp/aDDhWt2SA6LKnrS0J8Lxc
mWt4KvzL+ZuYx3son78AE95O2YB1A8XOh2m+231k62wGPd1VMcpgQ94l3IZXt7or
klA5dRTpVn+W5AIHTLY6JURBgkdf+ykIZh+zOfiOPJpE4nneXKKUvkWhZ6QhHaS1
nxI0ZhIEMh7jA9v9cdbnvBWK6fkJHA==
=P9BI
-----END PGP SIGNATURE-----

--Sig_/6OserSKOC8v+jPaIAfQNoFv--
