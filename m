From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next]  staging: fix wlan-ng printk format warning
Date: Thu, 25 Feb 2010 09:55:03 -0800
Message-ID: <4B86B977.6040303@oracle.com>
References: <20100225183523.80361261.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:54238 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933000Ab0BYSAv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2010 13:00:51 -0500
In-Reply-To: <20100225183523.80361261.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org, Greg KH <gregkh@suse.de>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix prism2fw.c printk format warning:

drivers/staging/wlan-ng/prism2fw.c:209: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/wlan-ng/prism2fw.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100225.orig/drivers/staging/wlan-ng/prism2fw.c
+++ linux-next-20100225/drivers/staging/wlan-ng/prism2fw.c
@@ -205,7 +205,7 @@ int prism2_fwtry(struct usb_device *udev
 		return 1;
 	}
 
-	printk(KERN_INFO "prism2_usb: %s will be processed, size %d\n",
+	printk(KERN_INFO "prism2_usb: %s will be processed, size %zu\n",
 	       PRISM2_USB_FWFILE, fw_entry->size);
 	prism2_fwapply((const struct ihex_binrec *)fw_entry->data, wlandev);
 
