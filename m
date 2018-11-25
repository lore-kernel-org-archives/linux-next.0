From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mips tree with the kbuild tree
Date: Mon, 26 Nov 2018 10:17:12 +1100
Message-ID: <20181126101712.18480f3c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/haoNfPR7z4iR+0uQ+I69930"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Maksym Kokhan <maksym.kokhan@globallogic.com>, Paul Burton <paul.burton@mips.com>, Andrii Bordunov <andrew.bordunov@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/haoNfPR7z4iR+0uQ+I69930
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mips tree got a conflict in:

  arch/mips/Kconfig

between commit:

  eb01d42a7778 ("PCI: consolidate PCI config entry in drivers/pci")

from the kbuild tree and commit:

  47bf2b031754 ("mips: sort list of configs for Malta")

from the mips tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/Kconfig
index f4df8007fddb,e49b5a0c8585..000000000000
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@@ -495,22 -498,23 +499,23 @@@ config MIPS_MALT
  	select BOOT_RAW
  	select BUILTIN_DTB
  	select CEVT_R4K
- 	select CSRC_R4K
  	select CLKSRC_MIPS_GIC
  	select COMMON_CLK
+ 	select CSRC_R4K
  	select DMA_MAYBE_COHERENT
  	select GENERIC_ISA_DMA
- 	select HAVE_PCSPKR_PLATFORM
- 	select IRQ_MIPS_CPU
- 	select MIPS_GIC
 +	select HAVE_PCI
+ 	select HAVE_PCSPKR_PLATFORM
 -	select HW_HAS_PCI
  	select I8253
  	select I8259
+ 	select IRQ_MIPS_CPU
+ 	select LIBFDT
  	select MIPS_BONITO64
  	select MIPS_CPU_SCACHE
+ 	select MIPS_GIC
  	select MIPS_L1_CACHE_SHIFT_6
- 	select PCI_GT64XXX_PCI0
  	select MIPS_MSC
+ 	select PCI_GT64XXX_PCI0
  	select SMP_UP if SMP
  	select SWAP_IO_SPACE
  	select SYS_HAS_CPU_MIPS32_R1

--Sig_/haoNfPR7z4iR+0uQ+I69930
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv7LXgACgkQAVBC80lX
0Gx9qAf/VdPY8ZIFm2DSMjT8ZIuZH2fvsoLAj2FNtLrzeifRSbsmyWXkb+XPgDHG
TmxynpaExAtR2cFIz4WkDUD/cSJVZndqatDkDUMpcfefVPitmPi+g8g8K+14W/2t
WWVTjjnAnut1p7JcoEQl9L2ruLClN4XiNz2Wohla4smUD6xB+JnTsSlOwHDOTfbd
Gkut5b7TGjl6R10ynXqqt9q9eOJ03KlWf69e6S+FveH/DDryrJvBLY+xcj0kK9X+
O1J0bwM/mwAgtYuGxw9RNyS9ixhuF5nma01g/u9ph+DlUC8xSlWY+aTjEJAG67pB
jypymu2v6YqyS6B1+s0JX7whW1iWbA==
=84d5
-----END PGP SIGNATURE-----

--Sig_/haoNfPR7z4iR+0uQ+I69930--
