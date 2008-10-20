From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: pci_ioremap_bar() breaks s390 build
Date: Mon, 20 Oct 2008 19:45:43 +0200
Message-ID: <20081020174543.GA6964@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.de.ibm.com ([195.212.29.155]:61199 "EHLO
	mtagate6.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751906AbYJTRqc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Oct 2008 13:46:32 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate6.de.ibm.com (8.13.8/8.13.8) with ESMTP id m9KHjip4328310
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 17:45:44 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com [9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id m9KHji3Q3006506
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 19:45:44 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m9KHjhgH015581
	for <linux-next@vger.kernel.org>; Mon, 20 Oct 2008 19:45:44 +0200
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arjan van de Ven <arjan@linux.intel.com>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org

Hi Arjan,

your patch "PCI: introduce an pci_ioremap(pdev, barnr) function" breaks s390:

  CC      fs/compat_ioctl.o
In file included from fs/compat_ioctl.c:52:
include/linux/pci.h: In function 'pci_ioremap_bar':
include/linux/pci.h:1136: error: implicit declaration of function 'ioremap_nocache'
include/linux/pci.h:1137: warning: return makes pointer from integer without a cast
make[1]: *** [fs/compat_ioctl.o] Error 1
make: *** [fs] Error 2

please fix :)

maybe something like this:

---
 include/linux/pci.h |    2 ++
 1 file changed, 2 insertions(+)

Index: linux-next/include/linux/pci.h
===================================================================
--- linux-next.orig/include/linux/pci.h
+++ linux-next/include/linux/pci.h
@@ -1124,6 +1124,7 @@ static inline void pci_mmcfg_early_init(
 static inline void pci_mmcfg_late_init(void) { }
 #endif
 
+#ifdef CONFIG_HAS_IOMEM
 static inline void * pci_ioremap_bar(struct pci_dev *pdev, int bar)
 {
 	/*
@@ -1136,6 +1137,7 @@ static inline void * pci_ioremap_bar(str
 	return ioremap_nocache(pci_resource_start(pdev, bar),
 				     pci_resource_len(pdev, bar));
 }
+#endif
 
 #endif /* __KERNEL__ */
 #endif /* LINUX_PCI_H */
