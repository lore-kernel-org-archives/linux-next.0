From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Date: Fri, 24 May 2019 09:21:25 +1000
Message-ID: <20190524092125.4ebc4d28@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//vSvU6n/=OcUnbshppgiivd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
List-Id: linux-next.vger.kernel.org

--Sig_//vSvU6n/=OcUnbshppgiivd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/platform/coda/Makefile

between commit:

  ec8f24b7faaf ("treewide: Add SPDX license identifier - Makefile/Kconfig")

from Linus' tree and commit:

  94b7ddb91c16 ("media: coda: remove -I$(src) header search path")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/media/platform/coda/Makefile
index f13adacd924e,3eed82137257..000000000000
--- a/drivers/media/platform/coda/Makefile
+++ b/drivers/media/platform/coda/Makefile
@@@ -1,6 -1,3 +1,5 @@@
 +# SPDX-License-Identifier: GPL-2.0-only
- ccflags-y +=3D -I$(src)
 +
  coda-objs :=3D coda-common.o coda-bit.o coda-gdi.o coda-h264.o coda-jpeg.o
 =20
  obj-$(CONFIG_VIDEO_CODA) +=3D coda.o

--Sig_//vSvU6n/=OcUnbshppgiivd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlznKvUACgkQAVBC80lX
0GzAzgf+Jeyk59jpqszwjhCVdTLAfx9dp9f8GwJ1yy5pC5WItANJtp6pA6ej90Tu
8aNwVnYCmaVbwSpImDdSJz6QfhaYzdjKf+aD3u527eL6Ip1elO+cCgKyCbhr8MaI
qio+/KjJgJv01HmfPsBpcxE3dX+/4JfITkT9DmLm2WbHOsONQZi65UPRLP8lfsGR
VQ4pP++9+7kcbaHeRM7GD26+qDhAlxlr+5uBni56DCEIKUTYexKjwDava7KkEKxE
U34sDRWPpLCP7H7ms3yL8cfIQrmfVmLBHyCjUoh3w1FlJMk5lxyrRv1ApDQ+7pZZ
jsl5jN3fHQQ6I7swYZKQJzxx7H6Z6g==
=8ai2
-----END PGP SIGNATURE-----

--Sig_//vSvU6n/=OcUnbshppgiivd--
