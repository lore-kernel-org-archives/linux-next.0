From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] watchdog: hpwdt depends on PCI
Date: Sat, 16 Jul 2011 12:25:49 -0700
Message-ID: <20110716122549.2406a0f9.rdunlap@xenotime.net>
References: <20110717000815.c83755be9598d34ac8431908@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:51427 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754558Ab1GPTZv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 16 Jul 2011 15:25:51 -0400
In-Reply-To: <20110717000815.c83755be9598d34ac8431908@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Mingarelli <thomas.mingarelli@hp.com>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

hpwdt is a PCI driver so it should depend on PCI.
Fixes these build errors:

drivers/watchdog/hpwdt.c:762: error: implicit declaration of function 'pci_iomap'
drivers/watchdog/hpwdt.c:762: warning: assignment makes pointer from integer without a cast
drivers/watchdog/hpwdt.c:797: error: implicit declaration of function 'pci_iounmap'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Wim Van Sebroeck <wim@iguana.be>
Cc: Thomas Mingarelli <thomas.mingarelli@hp.com>
---
 drivers/watchdog/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110716.orig/drivers/watchdog/Kconfig
+++ linux-next-20110716/drivers/watchdog/Kconfig
@@ -619,7 +619,7 @@ config IT87_WDT
 
 config HP_WATCHDOG
 	tristate "HP ProLiant iLO2+ Hardware Watchdog Timer"
-	depends on X86
+	depends on X86 && PCI
 	default m
 	help
 	  A software monitoring watchdog and NMI sourcing driver. This driver
