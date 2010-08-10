From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mfd: tps6586x depends on GPIOLIB
Date: Tue, 10 Aug 2010 09:40:59 -0700
Message-ID: <20100810094059.c320b916.randy.dunlap@oracle.com>
References: <20100810135601.4777e310.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:56864 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932370Ab0HJQlh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Aug 2010 12:41:37 -0400
In-Reply-To: <20100810135601.4777e310.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

tps6586x uses gpio interfaces, so it should depend on GPIOLIB.

Fixes these build errors:

drivers/mfd/tps6586x.c:41: error: field 'gpio' has incomplete type
drivers/mfd/tps6586x.c:195: warning: type defaults to 'int' in declaration of '__mptr'
drivers/mfd/tps6586x.c:195: warning: initialization from incompatible pointer type
drivers/mfd/tps6586x.c:210: warning: type defaults to 'int' in declaration of '__mptr'
drivers/mfd/tps6586x.c:210: warning: initialization from incompatible pointer type
drivers/mfd/tps6586x.c:219: warning: type defaults to 'int' in declaration of '__mptr'
drivers/mfd/tps6586x.c:219: warning: initialization from incompatible pointer type
drivers/mfd/tps6586x.c:249: error: implicit declaration of function 'gpiochip_add'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>
---
 drivers/mfd/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100810.orig/drivers/mfd/Kconfig
+++ linux-next-20100810/drivers/mfd/Kconfig
@@ -543,7 +543,7 @@ config MFD_JZ4740_ADC
 
 config MFD_TPS6586X
 	tristate "TPS6586x Power Management chips"
-	depends on I2C
+	depends on I2C && GPIOLIB
 	select MFD_CORE
 	help
 	  If you say yes here you get support for the TPS6586X series of
