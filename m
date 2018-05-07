From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the dma-mapping tree
Date: Tue, 8 May 2018 09:25:55 +1000
Message-ID: <20180508092555.01818b20@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XbChCFfWkNl1ul3TiRyXrGl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/XbChCFfWkNl1ul3TiRyXrGl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pci tree got a conflict in:

  arch/microblaze/include/asm/pci.h

between commit:

  325ef1857fff ("PCI: remove PCI_DMA_BUS_IS_PHYS")

from the dma-mapping tree and commits:

  2fe31eb73520 ("microblaze/PCI: Remove pcibios_finish_adding_to_bus() dead=
 code")
  d52194a1e550 ("microblaze/PCI: Remove pcibios_claim_one_bus() dead code")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/microblaze/include/asm/pci.h
index 66cf3a5a2f83,54ee91964852..000000000000
--- a/arch/microblaze/include/asm/pci.h
+++ b/arch/microblaze/include/asm/pci.h
@@@ -61,10 -62,12 +61,6 @@@ extern int pci_mmap_legacy_page_range(s
 =20
  #define HAVE_PCI_LEGACY	1
 =20
- extern void pcibios_claim_one_bus(struct pci_bus *b);
-=20
- extern void pcibios_finish_adding_to_bus(struct pci_bus *bus);
 -/* The PCI address space does equal the physical memory
 - * address space (no IOMMU).  The IDE and SCSI device layers use
 - * this boolean for bounce buffer decisions.
 - */
 -#define PCI_DMA_BUS_IS_PHYS     (1)
--
  extern void pcibios_resource_survey(void);
 =20
  struct file;

--Sig_/XbChCFfWkNl1ul3TiRyXrGl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlrw4IMACgkQAVBC80lX
0GzxdQf+P9Ts5xEKw1jL2QSlWH95POlk4uKhjyPPG3OudmadzkRHmgcRtSiL/umQ
zjj36gPZVV+OCxYJdFRb6KpdOs75QdLvUmynqCsZzjNTs7u9JHxgZwipVBecZT8R
3B3SKdjLXE+7Q3VZgf0wXmaRPnCkCFptAr5RrvoLzFFuNBqb12ytE/eaCwZrRPVz
EtdmrDnzXrN40HzdtFgunA8wS13ry1t5jC5TkIQf+dfn4W6reok7lfYQ2TR0+Row
r+pX5MpljVMiuBc5ifiiG646VExrOqiSLXWbWrZ8O2qkiY2u6pLXkesdaKd/U7ik
BSmFivg2mxAs10p2DdqbL5Fgyagfag==
=XjGQ
-----END PGP SIGNATURE-----

--Sig_/XbChCFfWkNl1ul3TiRyXrGl--
