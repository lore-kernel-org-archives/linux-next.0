From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb/otg: fix twl6030 macro
Date: Fri, 8 Apr 2011 10:11:44 -0700
Message-ID: <20110408101144.d423730d.randy.dunlap@oracle.com>
References: <20110408164532.bdf2e24b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:41414 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754291Ab1DHRL4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Apr 2011 13:11:56 -0400
In-Reply-To: <20110408164532.bdf2e24b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh <greg@kroah.com>, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Hema HK <hemahk@ti.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix warning caused by stray semi-colon at end of macro:

drivers/usb/otg/twl6030-usb.c:183: warning: ISO C90 forbids mixed declarations and code

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Hema HK <hemahk@ti.com>
---
 drivers/usb/otg/twl6030-usb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110408.orig/drivers/usb/otg/twl6030-usb.c
+++ linux-next-20110408/drivers/usb/otg/twl6030-usb.c
@@ -101,7 +101,7 @@ struct twl6030_usb {
 	bool			irq_enabled;
 };
 
-#define xceiv_to_twl(x)		container_of((x), struct twl6030_usb, otg);
+#define xceiv_to_twl(x)		container_of((x), struct twl6030_usb, otg)
 
 /*-------------------------------------------------------------------------*/
 
