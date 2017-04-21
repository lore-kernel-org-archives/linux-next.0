From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the char-misc tree with the pci tree
Date: Fri, 21 Apr 2017 14:45:40 +1000
Message-ID: <20170421144540.2635313f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56975 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1034997AbdDUEpo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 21 Apr 2017 00:45:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Cyril Bur <cyrilbur@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/Makefile

between commit:

  58c89c8aa0e8 ("misc: Add host side PCI driver for PCI test function device")

from the pci tree and commits:

  6c4e97678501 ("drivers/misc: Add Aspeed LPC control driver")
  51c1e9b554c9 ("auxdisplay: Move panel.c to drivers/auxdisplay folder")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/misc/Makefile
index 6e139cd70421,4fb10af2ea1c..000000000000
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@@ -53,8 -52,7 +52,8 @@@ obj-$(CONFIG_GENWQE)		+= genwqe
  obj-$(CONFIG_ECHO)		+= echo/
  obj-$(CONFIG_VEXPRESS_SYSCFG)	+= vexpress-syscfg.o
  obj-$(CONFIG_CXL_BASE)		+= cxl/
- obj-$(CONFIG_PANEL)             += panel.o
+ obj-$(CONFIG_ASPEED_LPC_CTRL)	+= aspeed-lpc-ctrl.o
 +obj-$(CONFIG_PCI_ENDPOINT_TEST)	+= pci_endpoint_test.o
  
  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_core.o
  lkdtm-$(CONFIG_LKDTM)		+= lkdtm_bugs.o
