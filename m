From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Date: Tue, 30 Jun 2009 11:56:38 +1000
Message-ID: <20090630115638.7bfb8e21.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41555 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752569AbZF3B4i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Jun 2009 21:56:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>, Alex Chiang <achiang@hp.com>

Hi Jesse,

Today's linux-next merge of the pci tree got conflicts in
arch/ia64/include/asm/pci.h, arch/mn10300/include/asm/pci.h and
include/asm-generic/pci.h between commit
a6c140969b4685f9b9f6773c0760f55ca66d1825 ("Delete pcibios_select_root")
from Linus' tree and commit a53cd7419b22c14b5a1e6859a940fb6bfa77963f
("PCI: remove pcibios_scan_all_fns()") from the pci tree.

Just context changes (adjacent removals).  I fixed it up (see below) and
can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/ia64/include/asm/pci.h
index fcfca56,55281aa..0000000
--- a/arch/ia64/include/asm/pci.h
+++ b/arch/ia64/include/asm/pci.h
@@@ -135,7 -134,18 +134,6 @@@ extern void pcibios_resource_to_bus(str
  extern void pcibios_bus_to_resource(struct pci_dev *dev,
  		struct resource *res, struct pci_bus_region *region);
  
- #define pcibios_scan_all_fns(a, b)	0
 -static inline struct resource *
 -pcibios_select_root(struct pci_dev *pdev, struct resource *res)
 -{
 -	struct resource *root = NULL;
 -
 -	if (res->flags & IORESOURCE_IO)
 -		root = &ioport_resource;
 -	if (res->flags & IORESOURCE_MEM)
 -		root = &iomem_resource;
 -
 -	return root;
 -}
  
  #define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
  static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
diff --cc arch/mn10300/include/asm/pci.h
index 35d2ed6,de52a27..0000000
--- a/arch/mn10300/include/asm/pci.h
+++ b/arch/mn10300/include/asm/pci.h
@@@ -102,7 -106,18 +102,6 @@@ extern void pcibios_bus_to_resource(str
  				    struct resource *res,
  				    struct pci_bus_region *region);
  
- #define pcibios_scan_all_fns(a, b)	0
 -static inline struct resource *
 -pcibios_select_root(struct pci_dev *pdev, struct resource *res)
 -{
 -	struct resource *root = NULL;
 -
 -	if (res->flags & IORESOURCE_IO)
 -		root = &ioport_resource;
 -	if (res->flags & IORESOURCE_MEM)
 -		root = &iomem_resource;
 -
 -	return root;
 -}
  
  static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
  {
diff --cc include/asm-generic/pci.h
index b4326b5,095cca8..0000000
--- a/include/asm-generic/pci.h
+++ b/include/asm-generic/pci.h
@@@ -30,7 -30,18 +30,6 @@@ pcibios_bus_to_resource(struct pci_dev 
  	res->end = region->end;
  }
  
- #define pcibios_scan_all_fns(a, b)	0
 -static inline struct resource *
 -pcibios_select_root(struct pci_dev *pdev, struct resource *res)
 -{
 -	struct resource *root = NULL;
 -
 -	if (res->flags & IORESOURCE_IO)
 -		root = &ioport_resource;
 -	if (res->flags & IORESOURCE_MEM)
 -		root = &iomem_resource;
 -
 -	return root;
 -}
  
  #ifndef HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
  static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
