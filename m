From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mtd: redwood depends on MTD_PARTITIONS
Date: Thu, 29 Jul 2010 10:13:06 -0700
Message-ID: <20100729101306.36c20611.randy.dunlap@oracle.com>
References: <20100729143211.9e7edaed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:61048 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754848Ab0G2ROf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Jul 2010 13:14:35 -0400
In-Reply-To: <20100729143211.9e7edaed.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org

From: Randy Dunlap <randy.dunlap@oracle.com>

redwood uses add/del_mtd_partitions(), so it should depend on
MTD_PARTITIONS.

ERROR: "add_mtd_partitions" [drivers/mtd/maps/redwood.ko] undefined!
ERROR: "del_mtd_partitions" [drivers/mtd/maps/redwood.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100729.orig/drivers/mtd/maps/Kconfig
+++ linux-next-20100729/drivers/mtd/maps/Kconfig
@@ -321,7 +321,7 @@ config MTD_CFI_FLAGADM
 
 config MTD_REDWOOD
 	tristate "CFI Flash devices mapped on IBM Redwood"
-	depends on MTD_CFI
+	depends on MTD_CFI && MTD_PARTITIONS
 	help
 	  This enables access routines for the flash chips on the IBM
 	  Redwood board. If you have one of these boards and would like to
