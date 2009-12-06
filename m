From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next resend] g_multi kconfig: fix depends and help text
Date: Sun, 6 Dec 2009 10:03:02 -0800
Message-ID: <20091206100302.f710f626.randy.dunlap@oracle.com>
References: <20091204203014.e8ee54ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:44697 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757010AbZLFTGU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 6 Dec 2009 14:06:20 -0500
In-Reply-To: <20091204203014.e8ee54ca.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, lud <linux-usb@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

USB_G_MULTI uses block and net interface functions, so make it
depend on both of those.  Otherwise there are lots of build errors.

Fix USB_G_MULTI config help text typos and copy/paste error.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/gadget/Kconfig |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

--- linux-next-20091204.orig/drivers/usb/gadget/Kconfig
+++ linux-next-20091204/drivers/usb/gadget/Kconfig
@@ -814,16 +814,17 @@ config USB_CDC_COMPOSITE
 
 config USB_G_MULTI
 	tristate "Multifunction Composite Gadget (EXPERIMENTAL)"
+	depends on BLOCK && NET
 	help
 	  The Multifunction Composite Gadget provides Ethernet (RNDIS
 	  and/or CDC Ethernet), mass storage and ACM serial link
 	  interfaces.
 
-	  You will be asked too choose which of the two configurations are
+	  You will be asked to choose which of the two configurations is
 	  to be available in the gadget.  At least one configuration must
-	  be choosen to make gadget usable.  Selecting more then one
+	  be chosen to make the gadget usable.  Selecting more than one
 	  configuration will prevent Windows from automatically detecting
-	  the gadget as a composite gadget an INF file will be needed to
+	  the gadget as a composite gadget, so an INF file will be needed to
 	  use the gadget.
 
 	  Say "y" to link the driver statically, or "m" to build a
@@ -836,8 +837,8 @@ config USB_G_MULTI_RNDIS
 	help
 	  This option enables a configuration with RNDIS, CDC Serial and
 	  Mass Storage functions available in the Multifunction Composite
-	  Gadget.  This is configuration dedicated for Windows since RNDIS
-	  is Microsfot's protocol.
+	  Gadget.  This is the configuration dedicated for Windows since RNDIS
+	  is Microsoft's protocol.
 
 	  If unsure, say "y".
 
@@ -848,8 +849,7 @@ config USB_G_MULTI_CDC
 	help
 	  This option enables a configuration with CDC Ethernet (ECM), CDC
 	  Serial and Mass Storage functions available in the Multifunction
-	  Composite Gadget.  This is configuration dedicated for Windows
-	  since RNDIS is Microsfot's protocol.
+	  Composite Gadget.
 
 	  If unsure, say "y".
 
