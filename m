From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mfd: fix mc13783 build error
Date: Tue, 18 Aug 2009 15:25:55 -0700
Message-ID: <20090818152555.793773ad.randy.dunlap@oracle.com>
References: <20090818184215.fdf1c7ae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:33430 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750955AbZHRWZ6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 18 Aug 2009 18:25:58 -0400
In-Reply-To: <20090818184215.fdf1c7ae.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build errors due to missing Kconfig dependency:

mc13783-core.c:(.text+0x11bbaf): undefined reference to `spi_sync'
mc13783-core.c:(.init.text+0xb6b3): undefined reference to `spi_register_driver'
mc13783-core.c:(.devinit.text+0x1fd8b): undefined reference to `spi_setup'
drivers/built-in.o:(.data+0x157c0): undefined reference to `spi_bus_type'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mfd/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090818.orig/drivers/mfd/Kconfig
+++ linux-next-20090818/drivers/mfd/Kconfig
@@ -240,6 +240,7 @@ config MFD_PCF50633
 
 config MFD_MC13783
 	tristate "Support Freescale MC13783"
+	depends on SPI_MASTER
 	select MFD_CORE
 	help
 	  Support for the Freescale (Atlas) MC13783 PMIC and audio CODEC.



---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
