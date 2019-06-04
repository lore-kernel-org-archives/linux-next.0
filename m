From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net-next tree with Linus' tree
Date: Tue, 4 Jun 2019 10:29:08 +1000
Message-ID: <20190604102908.7d2b6556@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jpZYh4wHWoERUCfofU4DMv3"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/jpZYh4wHWoERUCfofU4DMv3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/isdn/gigaset/i4l.c

between commit:

  2874c5fd2842 ("treewide: Replace GPLv2 boilerplate/reference with SPDX - =
rule 152")

from Linus' tree and commit:

  8e6c8aa3b52e ("isdn: gigaset: remove i4l support")

from the net-next tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/jpZYh4wHWoERUCfofU4DMv3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz1u1QACgkQAVBC80lX
0GwPzQgAlnF5YvEEPMkB2NN7pzDvxx551Dc2d5raOASREKdPyoH7OJ5fCgVXjJpj
pB+6VbEJj70kZxSN3XeSTpnDFtdGCVVS5dz130WJCrkpNL408G64zRgvFG7ysAA/
/9BkaqUs7bsNnUfGwkicLpbxxf6YZf8oA9UesfFAg7sUtscAbheQ59szgulo1XEG
YVPHynlDqGZL745gp+WerU2MKgRghC9o1PIXraOj7lY25tPkREHu1cWryc3MDOwZ
+cXBz5h/JFQEFR3J637hw1lWSMi6w4s45vSMoK/biYxIWVkF1yW0aD7B4md6QQwc
KYaDf6pCTL7KT44v3Xbc0A4+r7qQTA==
=SagT
-----END PGP SIGNATURE-----

--Sig_/jpZYh4wHWoERUCfofU4DMv3--
