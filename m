From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the dma-mapping tree with the kbuild
 tree
Date: Fri, 3 Aug 2018 08:08:56 +1000
Message-ID: <20180803080856.3de8af38@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KdiQulIne4Pn_L2DfqYs/rp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/KdiQulIne4Pn_L2DfqYs/rp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the dma-mapping tree got a conflict in:

  arch/nios2/Kconfig

between commit:

  17c46a6aff5c ("kconfig: remove duplicate SWAP symbol defintions")

from the kbuild tree and commit:

  25622e045a6a ("nios2: use generic dma_noncoherent_ops")

from the dma-mapping tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/nios2/Kconfig
index cbe1844b0657,92035042cf62..000000000000
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@@ -1,7 -1,9 +1,10 @@@
  # SPDX-License-Identifier: GPL-2.0
  config NIOS2
  	def_bool y
 +	select ARCH_NO_SWAP
+ 	select ARCH_HAS_SYNC_DMA_FOR_CPU
+ 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+ 	select DMA_NONCOHERENT_OPS
  	select TIMER_OF
  	select GENERIC_ATOMIC64
  	select GENERIC_CLOCKEVENTS

--Sig_/KdiQulIne4Pn_L2DfqYs/rp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltjgPgACgkQAVBC80lX
0Gy8WggAhFquIbZt/hEAiTF0o9HpH7W9ZHaUeY/rvPfHaDWHKXNOK4im992vZdCV
elVV9FpwMJTKB2aUtQ1TpxXHzvBzGlJTaep51C6Rzfs+xmkOpU87gh+y8b8oi9ai
AvPnIBOv39HjEYLxWHDov3zFBvOgmuA/+5KzKPuO+ma7b/FhIM9F2kRpi5T6O6RK
W5PdOdb1MY1YOrnQRCnIRLm3K2LZs/XaiO5rgPPlPVxFybMa7aGXuzvM0/IXjAU9
5iqpnzBGgHT0jQ2MFBiDw5y2XhQp/YnzIl3qkjMMwWjfUYf2oDblk9yZOuQODAs8
Ks2bdzBZzQu5pspZOEbEe3jcwaBYEQ==
=WFwa
-----END PGP SIGNATURE-----

--Sig_/KdiQulIne4Pn_L2DfqYs/rp--
