From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] gpio: rdc321x needs to select MFD_CORE
Date: Tue, 11 May 2010 13:24:20 -0700
Message-ID: <20100511132420.29654430.randy.dunlap@oracle.com>
References: <20100511155324.3c9019ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:45881 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754958Ab0EKUZK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2010 16:25:10 -0400
In-Reply-To: <20100511155324.3c9019ef.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Florian Fainelli <florian@openwrt.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix rdc321x-southbridge build:  GPIO_RDC321X needs to select
MFD_CORE so that the core is built at the same (or higher)
tristate level.

rdc321x-southbridge.c:(.devinit.text+0x6103): undefined reference to `mfd_add_devices'
rdc321x-southbridge.c:(.devexit.text+0xe5f): undefined reference to `mfd_remove_devices'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	Florian Fainelli <florian@openwrt.org>
---

Who merges gpio patches?

 drivers/gpio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100511.orig/drivers/gpio/Kconfig
+++ linux-next-20100511/drivers/gpio/Kconfig
@@ -285,6 +285,7 @@ config GPIO_TIMBERDALE
 config GPIO_RDC321X
 	tristate "RDC R-321x GPIO support"
 	depends on PCI && GPIOLIB
+	select MFD_CORE
 	select MFD_RDC321X
 	help
 	  Support for the RDC R321x SoC GPIOs over southbridge
