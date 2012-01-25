From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] uwb & wusb: fix kconfig error
Date: Wed, 25 Jan 2012 13:52:12 -0800
Message-ID: <4F20798C.4040205@xenotime.net>
References: <20120125141938.c1a9460d56948e1c7b26d3f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:58969 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752019Ab2AYUyE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jan 2012 15:54:04 -0500
In-Reply-To: <20120125141938.c1a9460d56948e1c7b26d3f8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb <linux-usb@vger.kernel.org>, Greg KH <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix UWB/WUSB kconfig error by changing 'select' to 'depends on'.

drivers/usb/wusbcore/Kconfig:4:error: recursive dependency detected!
drivers/usb/wusbcore/Kconfig:4:	symbol USB_WUSB is selected by USB_HWA_HCD
drivers/usb/host/Kconfig:559:	symbol USB_HWA_HCD depends on UWB
drivers/uwb/Kconfig:5:	symbol UWB is selected by USB_WUSB

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/usb/wusbcore/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120125.orig/drivers/usb/wusbcore/Kconfig
+++ linux-next-20120125/drivers/usb/wusbcore/Kconfig
@@ -6,7 +6,7 @@ config USB_WUSB
 	depends on EXPERIMENTAL
 	depends on USB
 	depends on PCI
-        select UWB
+	depends on UWB
         select CRYPTO
         select CRYPTO_BLKCIPHER
         select CRYPTO_CBC
