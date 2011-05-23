From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] mtd: fix physmap.h warnings
Date: Mon, 23 May 2011 11:37:09 -0700
Message-ID: <20110523113709.4357b4ba.randy.dunlap@oracle.com>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:63184 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756121Ab1EWSha (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2011 14:37:30 -0400
In-Reply-To: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mtd@lists.infradead.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build warnings in physmap.h:

include/linux/mtd/physmap.h:25: warning: 'struct platform_device' declared inside parameter list
include/linux/mtd/physmap.h:25: warning: its scope is only this definition or declaration, which is probably not what you want
include/linux/mtd/physmap.h:26: warning: 'struct platform_device' declared inside parameter list
include/linux/mtd/physmap.h:27: warning: 'struct platform_device' declared inside parameter list

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/mtd/physmap.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110523.orig/include/linux/mtd/physmap.h
+++ linux-next-20110523/include/linux/mtd/physmap.h
@@ -19,6 +19,7 @@
 #include <linux/mtd/partitions.h>
 
 struct map_info;
+struct platform_device;
 
 struct physmap_flash_data {
 	unsigned int		width;
