From: Alex Chiang <achiang@hp.com>
Subject: Re: linux-next: Tree for June 17 (pci/slot)
Date: Wed, 17 Jun 2009 18:46:12 -0600
Message-ID: <20090618004612.GB29472@ldl.fc.hp.com>
References: <20090617155354.075c60ae.sfr@canb.auug.org.au> <4A39194B.2060200@oracle.com> <20090617163604.GT19977@parisc-linux.org> <20090617102901.6e39aac2@jbarnes-g45> <4A392B48.7060206@oracle.com> <20090617161001.734321be@jbarnes-g45> <20090618003808.GA29472@ldl.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g4t0014.houston.hp.com ([15.201.24.17]:45120 "EHLO
	g4t0014.houston.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751133AbZFRAqK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 17 Jun 2009 20:46:10 -0400
Content-Disposition: inline
In-Reply-To: <20090618003808.GA29472@ldl.fc.hp.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Matthew Wilcox <matthew@wil.cx>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, a.beregalov@gmail.com

* Alex Chiang <achiang@hp.com>:
> diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> index ba6af16..ed32f67 100644
> --- a/drivers/pci/Makefile
> +++ b/drivers/pci/Makefile
> @@ -2,10 +2,11 @@
>  # Makefile for the PCI bus specific drivers.
>  #
>  

Actually...

> -obj-y		+= access.o bus.o probe.o remove.o pci.o quirks.o slot.o \
> +obj-y		+= access.o bus.o probe.o remove.o pci.o quirks.o \
>  			pci-driver.o search.o pci-sysfs.o rom.o setup-res.o \
                                              ^^^^^^^^^^^
>  			irq.o
>  obj-$(CONFIG_PROC_FS) += proc.o
> +obj-$(CONFIG_SYSFS) += slot.o

Here is v2.
  
From: Alex Chiang <achiang@hp.com>

PCI: drivers/pci/slot.c should depend on CONFIG_SYSFS

There is no way to interact with a physical PCI slot without
sysfs, so encode the dependency and prevent this build error:

	drivers/pci/slot.c: In function 'pci_hp_create_module_link':
	drivers/pci/slot.c:327: error: 'module_kset' undeclared

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fix-suggested-by: Matthew Wilcox <matthew@wil.cx>
Signed-off-by: Alex Chiang <achiang@hp.com>
---
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index ba6af16..0be4efd 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -2,10 +2,11 @@
 # Makefile for the PCI bus specific drivers.
 #
 
-obj-y		+= access.o bus.o probe.o remove.o pci.o quirks.o slot.o \
-			pci-driver.o search.o pci-sysfs.o rom.o setup-res.o \
+obj-y		+= access.o bus.o probe.o remove.o pci.o quirks.o \
+			pci-driver.o search.o rom.o setup-res.o \
 			irq.o
 obj-$(CONFIG_PROC_FS) += proc.o
+obj-$(CONFIG_SYSFS) += slot.o pci-sysfs.o
 
 # Build PCI Express stuff if needed
 obj-$(CONFIG_PCIEPORTBUS) += pcie/
