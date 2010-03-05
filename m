From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mfd/lpc_sch: fix related depends/selects, fix build
 error
Date: Fri, 05 Mar 2010 09:43:06 -0800
Message-ID: <4B9142AA.9040801@oracle.com>
References: <20100305181358.9adfe089.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:50493 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755034Ab0CERpG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 5 Mar 2010 12:45:06 -0500
In-Reply-To: <20100305181358.9adfe089.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Denis Turischev <denis@compulab.co.il>

From: Randy Dunlap <randy.dunlap@oracle.com>

LPC_SCH is selected by GPI_SCH and I2C_ISCH, even when PCI is not
enabled, but LPC_SCH depends on PCI, so make GPI_SCH and I2C_ISCH
also depend on PCI.

Those 2 selects also need to select what LPC_SCH selects,
since kconfig does not follow selects.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Denis Turischev <denis@compulab.co.il>
---
 drivers/gpio/Kconfig       |    3 ++-
 drivers/i2c/busses/Kconfig |    2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20100305.orig/drivers/gpio/Kconfig
+++ linux-next-20100305/drivers/gpio/Kconfig
@@ -87,7 +87,8 @@ config GPIO_VR41XX
 
 config GPIO_SCH
 	tristate "Intel SCH GPIO"
-	depends on GPIOLIB
+	depends on GPIOLIB && PCI
+	select MFD_CORE
 	select LPC_SCH
 	help
 	  Say yes here to support GPIO interface on Intel Poulsbo SCH.
--- linux-next-20100305.orig/drivers/i2c/busses/Kconfig
+++ linux-next-20100305/drivers/i2c/busses/Kconfig
@@ -105,6 +105,8 @@ config I2C_I801
 
 config I2C_ISCH
 	tristate "Intel SCH SMBus 1.0"
+	depends on PCI
+	select MFD_CORE
 	select LPC_SCH
 	help
 	  Say Y here if you want to use SMBus controller on the Intel SCH

-- 
~Randy
