From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH 2/2 -next] usb-storage: fix menu ordering
Date: Thu, 10 Mar 2011 16:49:56 -0800
Message-ID: <20110310164956.0acdd33b.randy.dunlap@oracle.com>
References: <20110310180934.95f4f607.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:49528 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754823Ab1CKAvF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2011 19:51:05 -0500
In-Reply-To: <20110310180934.95f4f607.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Move the USB_STORAGE_ENE_UB6250 entry so that it stays under the
USB_STORAGE menu.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/storage/Kconfig |   30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

--- linux-next-20110310.orig/drivers/usb/storage/Kconfig
+++ linux-next-20110310/drivers/usb/storage/Kconfig
@@ -182,6 +182,21 @@ config USB_STORAGE_CYPRESS_ATACB
 
 	  If this driver is compiled as a module, it will be named ums-cypress.
 
+config USB_STORAGE_ENE_UB6250
+	tristate "USB ENE card reader support"
+	depends on USB && SCSI
+	depends on USB_STORAGE
+	---help---
+	  Say Y here if you wish to control a ENE SD Card reader.
+	  To use SM/MS card, please build driver/staging/keucr/keucr.ko
+
+	  This option depends on 'SCSI' support being enabled, but you
+	  probably also need 'SCSI device support: SCSI disk support'
+	  (BLK_DEV_SD) for most USB storage devices.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ums-eneub6250.
+
 config USB_UAS
 	tristate "USB Attached SCSI"
 	depends on USB && SCSI
@@ -208,18 +223,3 @@ config USB_LIBUSUAL
 		options libusual bias="ub"
 
 	  If unsure, say N.
-
-config USB_STORAGE_ENE_UB6250
-	tristate "USB ENE card reader support"
-	depends on USB && SCSI
-	depends on USB_STORAGE
-	---help---
-	  Say Y here if you wish to control a ENE SD Card reader.
-	  To use SM/MS card, please build driver/staging/keucr/keucr.ko
-
-	  This option depends on 'SCSI' support being enabled, but you
-	  probably also need 'SCSI device support: SCSI disk support'
-	  (BLK_DEV_SD) for most USB storage devices.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called ums-eneub6250.
