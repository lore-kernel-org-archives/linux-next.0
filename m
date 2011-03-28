From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next RESEND] usb: fix isp1760-hcd printk format warning
Date: Mon, 28 Mar 2011 08:48:45 -0700
Message-ID: <20110328084845.2384a368.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:60293 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753819Ab1C1PtG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2011 11:49:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Sebastian Siewior <bigeasy@linutronix.de>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format build warning and grammar typo on same line.

drivers/usb/host/isp1760-hcd.c:300: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/host/isp1760-hcd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110315.orig/drivers/usb/host/isp1760-hcd.c
+++ linux-next-20110315/drivers/usb/host/isp1760-hcd.c
@@ -295,7 +295,7 @@ static void alloc_mem(struct usb_hcd *hc
 	}
 
 	dev_err(hcd->self.controller,
-				"%s: Can not allocate %lu bytes of memory\n"
+				"%s: Cannot allocate %zu bytes of memory\n"
 				"Current memory map:\n",
 				__func__, qtd->length);
 	for (i = 0; i < BLOCKS; i++) {
--
