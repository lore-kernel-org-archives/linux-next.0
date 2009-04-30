From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] usb: xhci depends on PCI.
Date: Thu, 30 Apr 2009 17:30:02 +0900
Message-ID: <20090430083002.GA11456@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:50087 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751329AbZD3IfX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Apr 2009 04:35:23 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Sarah Sharp <sarah.a.sharp@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>

While it looks like xhci was written with both PCI and non-PCI in mind,
apparently only the former has seen any testing. xhci-mem.o can be "fixed"
with a linux/dmapool.h include, but there are still parts of the code that
make use of struct pci_dev directly. So, at least more work is needed before
this can be turned on for non-PCI builds:

  CC      drivers/usb/host/xhci-mem.o
drivers/usb/host/xhci-mem.c: In function 'xhci_segment_alloc':
drivers/usb/host/xhci-mem.c:45: error: implicit declaration of function 'dma_pool_alloc'
drivers/usb/host/xhci-mem.c:45: warning: assignment makes pointer from integer without a cast
drivers/usb/host/xhci-mem.c: In function 'xhci_segment_free':
drivers/usb/host/xhci-mem.c:67: error: implicit declaration of function 'dma_pool_free'
drivers/usb/host/xhci-mem.c: In function 'xhci_alloc_virt_device':
drivers/usb/host/xhci-mem.c:239: warning: assignment makes pointer from integer without a cast
drivers/usb/host/xhci-mem.c:248: warning: assignment makes pointer from integer without a cast
drivers/usb/host/xhci-mem.c: In function 'xhci_mem_cleanup':
drivers/usb/host/xhci-mem.c:578: error: implicit declaration of function 'dma_pool_destroy'
drivers/usb/host/xhci-mem.c: In function 'xhci_mem_init':
drivers/usb/host/xhci-mem.c:657: error: implicit declaration of function 'dma_pool_create'
drivers/usb/host/xhci-mem.c:658: warning: assignment makes pointer from integer without a cast
drivers/usb/host/xhci-mem.c:663: warning: assignment makes pointer from integer without a cast
make[3]: *** [drivers/usb/host/xhci-mem.o] Error 1

  CC      drivers/usb/host/xhci-pci.o
drivers/usb/host/xhci-pci.c: In function 'xhci_pci_reinit':
drivers/usb/host/xhci-pci.c:39: error: implicit declaration of function 'pci_set_mwi'
drivers/usb/host/xhci-pci.c: At top level:
drivers/usb/host/xhci-pci.c:151: error: 'usb_hcd_pci_probe' undeclared here (not in a function)
drivers/usb/host/xhci-pci.c:152: error: 'usb_hcd_pci_remove' undeclared here (not in a function)
drivers/usb/host/xhci-pci.c:155: error: 'usb_hcd_pci_shutdown' undeclared here (not in a function)
drivers/usb/host/xhci-pci.c:159: warning: function declaration isn't a prototype
drivers/usb/host/xhci-pci.c:164: warning: function declaration isn't a prototype
make[3]: *** [drivers/usb/host/xhci-pci.o] Error 1

Cc: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 drivers/usb/host/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 5e2daed..1576a05 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -19,7 +19,7 @@ config USB_C67X00_HCD
 
 config USB_XHCI_HCD
 	tristate "xHCI HCD (USB 3.0) support (EXPERIMENTAL)"
-	depends on USB && EXPERIMENTAL
+	depends on USB && PCI && EXPERIMENTAL
 	---help---
 	  The eXtensible Host Controller Interface (xHCI) is standard for USB 3.0
 	  "SuperSpeed" host controller hardware.
