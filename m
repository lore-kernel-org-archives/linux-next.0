From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the gpio tree
Date: Mon, 10 Dec 2018 18:00:22 +1100
Message-ID: <20181210180022.0c78ad5a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YpuvXW0_4+PuRGoAsHwMDxi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/YpuvXW0_4+PuRGoAsHwMDxi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

After merging the gpio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

ERROR: "irq_chip_retrigger_hierarchy" [drivers/gpio/gpio-lpc18xx.ko] undefi=
ned!

Caused by commit

  5ddabfe8d3de ("gpio: lpc18xx: add GPIO pin interrupt controller support")

I have used the gpio tree from next-20181207 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/YpuvXW0_4+PuRGoAsHwMDxi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwODwYACgkQAVBC80lX
0Gy7jQgAnXFUhHY/EojI3ykFwgz/U5dcKvARyDN+vG3T7aqMG+3cPhD7xg9PEdXm
ap8dZMiwsS8ocJLEq2G8uaX98V7Ur3Nj48/95ogzxJL3tUH7+eZrsAJRK0qyIJuZ
tKgyKMMmPCFp6aVuIQkKSg3Zx2mLxyr4QshsQ0b0O0okYqMxUTVsiiTpqb3m/+B8
20geVZKEBMWNbhlvpsAqzc6xuajdnwSzIfMqYqGUJQAUxXSAX5m0j8dawQKobZTA
vs9p0lotlI8UyUByzL51qxN+S54lBzCbMbL3WyQkIsBOmZcE0WQ/sGv3+ywiJpbz
SyEFRIiAsObYgBcnvI2rEq153aRMwQ==
=8O8E
-----END PGP SIGNATURE-----

--Sig_/YpuvXW0_4+PuRGoAsHwMDxi--
