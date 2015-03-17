From: John Youn <John.Youn@synopsys.com>
Subject: [PATCH] usb: dwc2: pci: Correctly compile dwc2-pci as a module or built-in
Date: Mon, 16 Mar 2015 18:10:02 -0700
Message-ID: <022671f864cd98d87648678e2cabd53b41fce234.1426617333.git.johnyoun@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay.synopsys.com ([198.182.60.111]:53815 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753318AbbCQSmK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2015 14:42:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: balbi@ti.com
Cc: alan@lxorguk.ukuu.org.uk, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

The dwc2-pci driver should be compiled as a module when configured to
do so. If the dwc2-pci is configured as a module but actually
built-in, it can cause build errors due to the fact that the
generic-phy will be allowed to compile as a module causing undefined
references.

Reported-by: Alan Cox <alan@lxorguk.ukuu.org.uk>
Signed-off-by: John Youn <johnyoun@synopsys.com>
---
 drivers/usb/dwc2/Makefile | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/Makefile b/drivers/usb/dwc2/Makefile
index 8f75267..f07b425 100644
--- a/drivers/usb/dwc2/Makefile
+++ b/drivers/usb/dwc2/Makefile
@@ -19,10 +19,8 @@ endif
 # mode. The PCI bus interface module will called dwc2_pci.ko and the platform
 # interface module will be called dwc2_platform.ko.
 
-ifneq ($(CONFIG_USB_DWC2_PCI),)
-	obj-$(CONFIG_USB_DWC2)		+= dwc2_pci.o
-	dwc2_pci-y			:= pci.o
-endif
+obj-$(CONFIG_USB_DWC2_PCI)		+= dwc2_pci.o
+dwc2_pci-y				:= pci.o
 
 obj-$(CONFIG_USB_DWC2_PLATFORM)		+= dwc2_platform.o
 dwc2_platform-y				:= platform.o
-- 
2.3.2
