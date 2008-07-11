From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH linux-next] Let HP iLO driver depend on PCI.
Date: Fri, 11 Jul 2008 12:52:34 +0200
Message-ID: <20080711105234.GB20589@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate8.de.ibm.com ([195.212.29.157]:44939 "EHLO
	mtagate8.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752195AbYGKKxM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 06:53:12 -0400
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id m6BAqZaZ331658
	for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 10:52:35 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com [9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with ESMTP id m6BAqZoo4104406
	for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 12:52:35 +0200
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id m6BAqYpG009324
	for <linux-next@vger.kernel.org>; Fri, 11 Jul 2008 12:52:35 +0200
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: David Altobelli <david.altobelli@hp.com>, linux-next@vger.kernel.org

Subject: [PATCH] Let HP iLO driver depend on PCI

From: Heiko Carstens <heiko.carstens@de.ibm.com>

"HP iLO driver" causes this:

drivers/misc/hpilo.c: In function 'doorbell_set':
drivers/misc/hpilo.c:147: error: implicit declaration of function 'iowrite8'
drivers/misc/hpilo.c: In function 'ilo_ccb_close':
drivers/misc/hpilo.c:204: error: implicit declaration of function 'iowrite32'
drivers/misc/hpilo.c:204: error: implicit declaration of function 'ioread32'
drivers/misc/hpilo.c:222: error: implicit declaration of function 'memset_io'
drivers/misc/hpilo.c:225: error: implicit declaration of function 'pci_free_consistent'
drivers/misc/hpilo.c: In function 'ilo_ccb_open':
drivers/misc/hpilo.c:244: error: implicit declaration of function 'pci_alloc_consistent'
drivers/misc/hpilo.c:245: warning: assignment makes pointer from integer without a cast
drivers/misc/hpilo.c:296: error: implicit declaration of function 'memcpy_toio'
drivers/misc/hpilo.c: In function 'ilo_unmap_device':
drivers/misc/hpilo.c:575: error: implicit declaration of function 'pci_iounmap'
drivers/misc/hpilo.c: In function 'ilo_map_device':
drivers/misc/hpilo.c:585: error: implicit declaration of function 'pci_iomap'
drivers/misc/hpilo.c:585: warning: assignment makes pointer from integer without a cast
drivers/misc/hpilo.c:592: warning: assignment makes pointer from integer without a cast
drivers/misc/hpilo.c:599: warning: assignment makes pointer from integer without a cast
make[2]: *** [drivers/misc/hpilo.o] Error 1

Just let it depend on PCI.

Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---

Greg, this came in via one of your git trees. Please merge/apply. Thanks.

 drivers/misc/Kconfig |    1 +
 1 file changed, 1 insertion(+)

Index: linux-next/drivers/misc/Kconfig
===================================================================
--- linux-next.orig/drivers/misc/Kconfig
+++ linux-next/drivers/misc/Kconfig
@@ -423,6 +423,7 @@ config SGI_XP
 config HP_ILO
 	tristate "Channel interface driver for HP iLO/iLO2 processor"
 	default n
+	depends on PCI
 	help
 	  The channel interface driver allows applications to communicate
 	  with iLO/iLO2 management processors present on HP ProLiant
