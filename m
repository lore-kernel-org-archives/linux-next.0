From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips-fixes tree with Linus' tree
Date: Mon, 24 Dec 2018 09:07:40 +1100
Message-ID: <20181224090740.3ebbd60c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cFf+xLaLYBCxJ0+6abZ/vV2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <james.hogan@mips.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Paul Burton <paul.burton@mips.com>
List-Id: linux-next.vger.kernel.org

--Sig_/cFf+xLaLYBCxJ0+6abZ/vV2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips-fixes tree got a conflict in:

  MAINTAINERS

between commit:

  6584297b78b6 ("MAINTAINERS: Update linux-mips mailing list address")

from Linus' tree and commit:

  9bd2f7eeaed1 ("MAINTAINERS: Add a maintainer for MSCC MIPS SoCs")

from the mips-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc MAINTAINERS
index f3a5c97e3419,50223cba6ddb..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -9912,8 -9801,9 +9912,9 @@@ F:	drivers/dma/at_xdmac.
 =20
  MICROSEMI MIPS SOCS
  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
+ M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
 -L:	linux-mips@linux-mips.org
 +L:	linux-mips@vger.kernel.org
- S:	Maintained
+ S:	Supported
  F:	arch/mips/generic/board-ocelot.c
  F:	arch/mips/configs/generic/board-ocelot.config
  F:	arch/mips/boot/dts/mscc/

--Sig_/cFf+xLaLYBCxJ0+6abZ/vV2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwgBywACgkQAVBC80lX
0GxcwAgAo7vAWiTV6bk+HOEnnCids7Jn3AYPYUXwI0Z6WbDqYRuiYUCmpPoccLnr
Us5z/0GiWjna63TjjXL9EYxFLqKYh+GV7eFgT0VMnw7YjuBbRMUe4JjCln2ioHCB
eTeDiYEkS6NVdpEI1a9wuEBFI19JAnfQyKWUXPIBqtLcxrmk6CR8nY+AJx80Iam0
IvtgZrV/1ekpiWQlchYmwAKc6FNzV/ae8uXk3VEGSXmw/VugaQYXPHBB9QrNYe/4
1mpGfUOJTMxtZ6Vt9xBNEIm24kcAxKF8Go3/xOQBf3t6vMyW0EQmDJNkH0gEDE7O
FJoAxYGOhj6e+OiVXsoXO7DUidnHtQ==
=e5KX
-----END PGP SIGNATURE-----

--Sig_/cFf+xLaLYBCxJ0+6abZ/vV2--
