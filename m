From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] usb: fix ipw.c build error, select USB_SERIAL_WWAN
Date: Tue, 23 Aug 2011 11:22:37 -0700
Message-ID: <20110823112237.0c68b7a5.rdunlap@xenotime.net>
References: <20110823160432.d24f8cad00951286bc18461e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:42933 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752070Ab1HWSWj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 23 Aug 2011 14:22:39 -0400
In-Reply-To: <20110823160432.d24f8cad00951286bc18461e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

From: Randy Dunlap <rdunlap@xenotime.net>

USB_SERIAL_IPW needs to select USB_SERIAL_WWAN to fix build errors:

ipw.c:(.text+0x333841): undefined reference to `usb_wwan_close'
ipw.c:(.text+0x3339e6): undefined reference to `usb_wwan_open'
ipw.c:(.text+0x333bb9): undefined reference to `usb_wwan_release'
drivers/built-in.o:(.data+0x29dac): undefined reference to `usb_wwan_startup'
drivers/built-in.o:(.data+0x29db4): undefined reference to `usb_wwan_disconnect'
drivers/built-in.o:(.data+0x29dd4): undefined reference to `usb_wwan_write'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/usb/serial/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110823.orig/drivers/usb/serial/Kconfig
+++ linux-next-20110823/drivers/usb/serial/Kconfig
@@ -252,6 +252,7 @@ config USB_SERIAL_GARMIN
 
 config USB_SERIAL_IPW
         tristate "USB IPWireless (3G UMTS TDD) Driver"
+	select USB_SERIAL_WWAN
 	help
 	  Say Y here if you want to use a IPWireless USB modem such as
 	  the ones supplied by Axity3G/Sentech South Africa.
