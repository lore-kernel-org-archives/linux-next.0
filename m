From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: mrst touchscreen depends on SPI
Date: Fri, 3 Sep 2010 18:01:56 -0700
Message-ID: <20100903180156.af17d4a8.randy.dunlap@oracle.com>
References: <20100903135206.d9bc2093.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:36076 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212Ab0IDBCe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2010 21:02:34 -0400
In-Reply-To: <20100903135206.d9bc2093.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sreedhara.ds@intel.com

From: Randy Dunlap <randy.dunlap@oracle.com>

Moorestown touchscreen driver should depend on SPI.
Fixes these build errors:

intel-mid-touch.c:(.init.text+0xdd34): undefined reference to `spi_register_driver'
drivers/built-in.o:(.data+0x21778): undefined reference to `spi_bus_type'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: sreedhara.ds@intel.com
---
 drivers/staging/mrst-touchscreen/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100903.orig/drivers/staging/mrst-touchscreen/Kconfig
+++ linux-next-20100903/drivers/staging/mrst-touchscreen/Kconfig
@@ -1,6 +1,6 @@
 config TOUCHSCREEN_INTEL_MID
 	tristate "Intel MID platform resistive touchscreen"
-	depends on INTEL_SCU_IPC
+	depends on INTEL_SCU_IPC && SPI
 	default y
 	help
 	  Say Y here if you have a Intel MID based touchscreen
