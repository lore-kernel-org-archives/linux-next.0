From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 dma-mapping tree
Date: Mon, 10 Sep 2018 14:06:17 +1000
Message-ID: <20180910140617.5bf45eb5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qjT27Ffv+XKr0c2p/jocOfQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qjT27Ffv+XKr0c2p/jocOfQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/hexagon/Kconfig

between commit:

  e0a9317d9004 ("hexagon: use generic dma_noncoherent_ops")

from the dma-mapping tree and commit:

  365c1f4922a4 ("hexagon: switch to NO_BOOTMEM")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/hexagon/Kconfig
index 6cee842a9b44,f7934998913a..000000000000
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@@ -30,7 -29,9 +30,10 @@@ config HEXAGO
  	select GENERIC_CLOCKEVENTS_BROADCAST
  	select MODULES_USE_ELF_RELA
  	select GENERIC_CPU_DEVICES
 +	select DMA_NONCOHERENT_OPS
+ 	select HAVE_MEMBLOCK
+ 	select ARCH_DISCARD_MEMBLOCK
+ 	select NO_BOOTMEM
  	---help---
  	  Qualcomm Hexagon is a processor architecture designed for high
  	  performance and low power across a wide variety of applications.

--Sig_/qjT27Ffv+XKr0c2p/jocOfQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluV7bkACgkQAVBC80lX
0GxBGAf9H2hBvda9VDsbzlZmsPxQKhQchweVcxp/bUmOjzBX409ijF8OaW6UD1GZ
1C/pfh88O26qwdXMKl0xNx0vbXRMDVGY4eUY3XV/erHifas5k5jvtNCinUZzHcgB
CHofD+i3Hs43gjAfh033rfzrZQC9zd8ApOE6cDVYqKlf9PWGl2NyIdirJSUSMhFG
ZgKlLl1GBzsv3/1fT1Fy+yfkt1D4mrmPt4p6clpm8DaiKfSlW0uCmZ51/61YsPgk
MbEfs5HEw9tVkCr4EbKcFlpgZ3hGP1G0sLrRMixwjdq6MIVb/LOLZINWsp++Xa6K
FOOpxjzQ9TywMGVQO/WjCYoqKNIu6Q==
=IH7B
-----END PGP SIGNATURE-----

--Sig_/qjT27Ffv+XKr0c2p/jocOfQ--
