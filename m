From: "Randy.Dunlap" <rdunlap@xenotime.net>
Subject: [PATCH -next] MTD: missing header for do_div
Date: Thu, 5 Jun 2008 09:43:03 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0806050941090.702@shark.he.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:50843 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752155AbYFEQnH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Jun 2008 12:43:07 -0400
Received: from shark.he.net ([66.160.160.2]) by xenotime.net for <linux-next@vger.kernel.org>; Thu, 5 Jun 2008 09:43:03 -0700
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org, linux-next@vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix MTD build error, missing #include:

linux-next-20080605/drivers/mtd/nand/nandsim.c: In function 'divide':
linux-next-20080605/drivers/mtd/nand/nandsim.c:462: error: implicit declaration of function 'do_div'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/nand/nandsim.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20080605.orig/drivers/mtd/nand/nandsim.c
+++ linux-next-20080605/drivers/mtd/nand/nandsim.c
@@ -37,6 +37,7 @@
 #include <linux/delay.h>
 #include <linux/list.h>
 #include <linux/random.h>
+#include <asm/div64.h>
 
 /* Default simulator parameters values */
 #if !defined(CONFIG_NANDSIM_FIRST_ID_BYTE)  || \
