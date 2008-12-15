From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mtd: fix nettel printk formats
Date: Mon, 15 Dec 2008 15:38:39 -0800
Message-ID: <4946EA7F.1@oracle.com>
References: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:35782 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905AbYLOXjU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Dec 2008 18:39:20 -0500
In-Reply-To: <20081216020642.fc1007d9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format references:

drivers/mtd/maps/nettel.c:361: warning: format '%d' expects type 'int', but argument 2 has type 'uint64_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/mtd/maps/nettel.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20081215.orig/drivers/mtd/maps/nettel.c
+++ linux-next-20081215/drivers/mtd/maps/nettel.c
@@ -357,8 +357,8 @@ static int __init nettel_init(void)
 		*intel1par = 0;
 	}
 
-	printk(KERN_NOTICE "SNAPGEAR: Intel flash device size = %dK\n",
-		(intel_mtd->size >> 10));
+	printk(KERN_NOTICE "SNAPGEAR: Intel flash device size = %lluK\n",
+		(unsigned long long)(intel_mtd->size >> 10));
 
 	intel_mtd->owner = THIS_MODULE;
 
