From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slave-dma-fixes tree with Linus'
 tree
Date: Thu, 23 May 2019 08:32:02 +1000
Message-ID: <20190523083202.7b3df878@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Y0mm32AOd6uAGO7GIF.9Izl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Long Cheng <long.cheng@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Y0mm32AOd6uAGO7GIF.9Izl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slave-dma-fixes tree got a conflict in:

  drivers/dma/mediatek/Makefile

between commit:

  ec8f24b7faaf ("treewide: Add SPDX license identifier - Makefile/Kconfig")

from Linus' tree and commit:

  e8b3ba1e38a2 ("dmaengine: mediatek: Add MediaTek UART APDMA support")

from the slave-dma-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/dma/mediatek/Makefile
index 13b144594510,61a6d29c8e8c..000000000000
--- a/drivers/dma/mediatek/Makefile
+++ b/drivers/dma/mediatek/Makefile
@@@ -1,3 -1,3 +1,4 @@@
 +# SPDX-License-Identifier: GPL-2.0-only
+ obj-$(CONFIG_MTK_UART_APDMA) +=3D mtk-uart-apdma.o
  obj-$(CONFIG_MTK_HSDMA) +=3D mtk-hsdma.o
  obj-$(CONFIG_MTK_CQDMA) +=3D mtk-cqdma.o

--Sig_/Y0mm32AOd6uAGO7GIF.9Izl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzlzeIACgkQAVBC80lX
0GxoEwf/b+3YUGsq6AM1xX1m5GiKTgWrMfZpl/xszpdVYOi60C7YAr1cBcXDvVuT
h0ExyCSsfrp3HS7/0KH7r81rrn0c5sZsgijcbhaIbaMR+D7VnmfepYhwGu8Nt/Zz
5sV3IEwNjORM1/blnB/XmyGuh87howOZgN1NCU/h6nmNbA5F+7ajdT/EX50W9ID1
Bs1VSVk5xEUoeliHj1CQzlK0q7bBFL+LuC263bM3vuF9gboFhgANjac4YcrHIopE
bIBOEi1RMu9NeAYE/6CuVmZOhNeIheNhULe3tekbXb9TNcdo+B3gSzV5ZvXRnMuK
dainXT1r07E4pQrPvXS2dCXAaAVGbQ==
=K++D
-----END PGP SIGNATURE-----

--Sig_/Y0mm32AOd6uAGO7GIF.9Izl--
