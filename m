From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/rar_register: depends on PCI
Date: Wed, 5 May 2010 15:45:22 -0700
Message-ID: <20100505154522.c3d7807c.randy.dunlap@oracle.com>
References: <20100505123409.ed5678a2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:64682 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759002Ab0EEWrd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 May 2010 18:47:33 -0400
In-Reply-To: <20100505123409.ed5678a2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org

From: Randy Dunlap <randy.dunlap@oracle.com>

rar_register driver uses PCI interfaces and PCI devices, so it
should depend on PCI.

Also format the Kconfig help text as normally done.

drivers/staging/rar_register/rar_register.c:623: error: implicit declaration of function 'pci_dev_get'
drivers/staging/rar_register/rar_register.c:623: warning: assignment makes pointer from integer without a cast

Note:  The memrar driver selects this driver's Kconfig symbol, even when
PCI is not enabled.  That select could be changed to
	select RAR_REGISTER if PCI
but that would still result in build errors when PCI is not enabled, namely:
drivers/built-in.o: In function `memrar_fini_rar_resources':
memrar_handler.c:(.text+0x2391b7): undefined reference to `unregister_rar'
drivers/built-in.o: In function `memrar_registration_callback':
memrar_handler.c:(.text+0x23925a): undefined reference to `rar_get_address'
drivers/built-in.o: In function `memrar_init':
memrar_handler.c:(.init.text+0x12c7b): undefined reference to `register_rar'
memrar_handler.c:(.init.text+0x12c97): undefined reference to `register_rar'

Does anyone have suggestions for this?

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/rar_register/Kconfig |   28 ++++++++++++-------------
 1 file changed, 14 insertions(+), 14 deletions(-)

--- linux-next-20100505.orig/drivers/staging/rar_register/Kconfig
+++ linux-next-20100505/drivers/staging/rar_register/Kconfig
@@ -8,23 +8,23 @@ menu "RAR Register Driver"
 #
 config RAR_REGISTER
 	tristate "Restricted Access Region Register Driver"
+	depends on PCI
 	default n
 	---help---
-		This driver allows other kernel drivers access to the
-		contents of the restricted access region control
-		registers.
+	  This driver allows other kernel drivers access to the
+	  contents of the restricted access region control registers.
 
-		The restricted access region control registers
-		(rar_registers) are used to pass address and
-		locking information on restricted access regions
-		to other drivers that use restricted access regions
+	  The restricted access region control registers
+	  (rar_registers) are used to pass address and
+	  locking information on restricted access regions
+	  to other drivers that use restricted access regions.
 
-		The restricted access regions are regions of memory
-		on the Intel MID Platform that are not accessible to
-		the x86 processor, but are accessible to dedicated
-		processors on board peripheral devices.
+	  The restricted access regions are regions of memory
+	  on the Intel MID Platform that are not accessible to
+	  the x86 processor, but are accessible to dedicated
+	  processors on board peripheral devices.
 
-		The purpose of the restricted access regions is to
-		protect sensitive data from compromise by unauthorized
-		programs running on the x86 processor.
+	  The purpose of the restricted access regions is to
+	  protect sensitive data from compromise by unauthorized
+	  programs running on the x86 processor.
 endmenu
