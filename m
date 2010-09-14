From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mfd: ab8500 depends on SPI_MASTER
Date: Tue, 14 Sep 2010 15:23:51 -0700
Message-ID: <20100914152351.0ba53b5d.randy.dunlap@oracle.com>
References: <20100914135802.c99d3672.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:31493 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851Ab0INWZ4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2010 18:25:56 -0400
In-Reply-To: <20100914135802.c99d3672.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build errors in ab8500-spi.c.  It uses spi_* functions, so it
should depend on SPI_MASTER.

ab8500-spi.c:(.text+0x4900a): undefined reference to `spi_sync'
ab8500-spi.c:(.text+0x490b0): undefined reference to `spi_sync'
ab8500-spi.c:(.init.text+0x30c5): undefined reference to `spi_register_driver'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>
---
 drivers/mfd/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100914.orig/drivers/mfd/Kconfig
+++ linux-next-20100914/drivers/mfd/Kconfig
@@ -475,7 +475,7 @@ config EZX_PCAP
 
 config AB8500_CORE
 	bool "ST-Ericsson AB8500 Mixed Signal Power Management chip"
-	depends on GENERIC_HARDIRQS && ABX500_CORE
+	depends on GENERIC_HARDIRQS && ABX500_CORE && SPI_MASTER
 	select MFD_CORE
 	help
 	  Select this option to enable access to AB8500 power management
