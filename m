From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the gpio tree with the arm-soc tree
Date: Mon, 17 Dec 2018 19:17:53 +1100
Message-ID: <20181217191753.172ca200@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CvY/7uXN8E.YOrGdwkkP4B1"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>
List-Id: linux-next.vger.kernel.org

--Sig_/CvY/7uXN8E.YOrGdwkkP4B1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio tree got a conflict in:

  arch/arm/mach-omap1/board-ams-delta.c

between commit:

  19a2668a8ae3 ("ARM: OMAP1: ams-delta: Provide GPIO lookup table for LED d=
evice")

from the arm-soc tree and commit:

  21abf103818a ("gpio: Pass a flag to gpiochip_request_own_desc()")

from the gpio tree.

I fixed it up (the former removed the code updated by the latter, so
I used that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/CvY/7uXN8E.YOrGdwkkP4B1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwXW7EACgkQAVBC80lX
0GxrnAf9Hudx1lEWXTwWV/OlWQv+f6TR21Eart36sf/jj2GPbpXVNvDNKSN9f2HO
Rhu6bU3St4uMWuKXAw+5W9F45A4gynKuHMrFZIu9XAlZpXCSschg16X83GOzuddf
wStMikfOsGpXbnM0oXD4/z6CO8iTa42flOcomwMujvAomG/+EJ39XCwVGFuuw3pN
u6wWuSrcDWqDjgzQTGjAJlkocOOgeJDutRAqLS/6Zf5hcML3QIIj8dt9yd6osWZf
Vf97/GoZvjNVqeBJUPz0zxgvzJwj6GH+brvU8LjqOA1/Mc4ZZuXFY2mOyZGm2dy+
79kihxZiRgSM6mT5QWa9l5mDkY6Abw==
=nITP
-----END PGP SIGNATURE-----

--Sig_/CvY/7uXN8E.YOrGdwkkP4B1--
