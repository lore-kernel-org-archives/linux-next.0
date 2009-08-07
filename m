From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] watchdog: fix wdt_pci printk and variable type
Date: Fri, 7 Aug 2009 15:02:00 -0700
Message-ID: <20090807150200.80025b5f.randy.dunlap@oracle.com>
References: <20090807183118.e71b4db2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:50054 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752903AbZHGWCq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Aug 2009 18:02:46 -0400
In-Reply-To: <20090807183118.e71b4db2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning:
drivers/watchdog/wdt_pci.c:652: warning: format '%04x' expects type 'unsigned int', but argument 2 has type 'resource_size_t'

and then use resource_size_t for the "io" variable as well
so that it won't be truncated.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Wim Van Sebroeck <wim@iguana.be>
---
 drivers/watchdog/wdt_pci.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- linux-next-20090807.orig/drivers/watchdog/wdt_pci.c
+++ linux-next-20090807/drivers/watchdog/wdt_pci.c
@@ -80,7 +80,7 @@ static unsigned long open_lock;
 static DEFINE_SPINLOCK(wdtpci_lock);
 static char expect_close;
 
-static int io;
+static resource_size_t io;
 static int irq;
 
 /* Default timeout */
@@ -648,8 +648,8 @@ static int __devinit wdtpci_init_one(str
 	}
 
 	if (pci_request_region(dev, 2, "wdt_pci")) {
-		printk(KERN_ERR PFX "I/O address 0x%04x already in use\n",
-			pci_resource_start(dev, 2));
+		printk(KERN_ERR PFX "I/O address 0x%llx already in use\n",
+			(unsigned long long)pci_resource_start(dev, 2));
 		goto out_pci;
 	}
 
@@ -663,8 +663,8 @@ static int __devinit wdtpci_init_one(str
 	}
 
 	printk(KERN_INFO
-	 "PCI-WDT500/501 (PCI-WDG-CSM) driver 0.10 at 0x%04x (Interrupt %d)\n",
-								io, irq);
+	 "PCI-WDT500/501 (PCI-WDG-CSM) driver 0.10 at 0x%llx (Interrupt %d)\n",
+					(unsigned long long)io, irq);
 
 	/* Check that the heartbeat value is within its range;
 	   if not reset to the default */



---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
