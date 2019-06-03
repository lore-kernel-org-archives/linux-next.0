From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the crypto tree with Linus' tree
Date: Mon, 3 Jun 2019 10:52:21 +1000
Message-ID: <20190603105221.44e5bf16@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/P7kxKd8cxCDnKvEUNQEvqgt"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/P7kxKd8cxCDnKvEUNQEvqgt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

Today's linux-next merge of the crypto tree got a conflict in:

  crypto/crypto_wq.c

between commit:

  2874c5fd2842 ("treewide: Replace GPLv2 boilerplate/reference with SPDX - =
rule 152")

from Linus' tree and commit:

  3e56e168638b ("crypto: cryptd - move kcrypto_wq into cryptd")

from the crypto tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/P7kxKd8cxCDnKvEUNQEvqgt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz0b0UACgkQAVBC80lX
0GyJFAf8CMAi51jWQxhk6UgyFU3r5H5fjO3psXVEwcEFrkYxf6jKobG5mh4+xulm
+V3QMHO/lx3qkAfm3EkeAWtJ7U2YIrZpmVjbWcFvZ2QHqOkXbehTtWLj8ZDF/ATp
8Hnwg3mu8636DzCsGiMQ2pBQhW8uc0j57YAYqN+xdi2QjnVpQqg6Bla/u5lzXhnc
VpnqY4jAzExMMJe1T9Ofl2aYNuvYhVskcmyfPG276INeQF11ZD6NgOh5UuBObvCH
h3nCZe4uOI4V9KiNtquPlKHOdKWk4QsX6h15+z6YrkHIT0oPtczJGaIuRa1wb1Qy
qmCr0SQ1lAH2yTGVK+TNH73+muaziA==
=KRyQ
-----END PGP SIGNATURE-----

--Sig_/P7kxKd8cxCDnKvEUNQEvqgt--
