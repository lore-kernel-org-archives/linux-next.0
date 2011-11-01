From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: slicoss depends on NET
Date: Tue, 01 Nov 2011 14:43:09 -0700
Message-ID: <4EB067ED.60106@xenotime.net>
References: <20111101205323.c12f2f940f23febba8ab8989@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy3-pub.bluehost.com ([69.89.21.8]:40828 "HELO
	oproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753242Ab1KAVnl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Nov 2011 17:43:41 -0400
In-Reply-To: <20111101205323.c12f2f940f23febba8ab8989@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Greg KH <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Lior Dotan <liodot@gmail.com>, Christopher Harrer <charrer@alacritech.com>

From: Randy Dunlap <rdunlap@xenotime.net>

The slicoss driver uses network interfaces so it should depend
on NET.  Fixes the following build errors:

ERROR: "eth_change_mtu" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "eth_validate_addr" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "register_netdev" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "alloc_etherdev_mqs" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "__netif_schedule" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "netif_rx" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "eth_type_trans" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "skb_put" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "skb_pull" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "__alloc_skb" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "free_netdev" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "unregister_netdev" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "consume_skb" [drivers/staging/slicoss/slicoss.ko] undefined!
ERROR: "dev_kfree_skb_irq" [drivers/staging/slicoss/slicoss.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Lior Dotan <liodot@gmail.com>
Cc: Christopher Harrer <charrer@alacritech.com>
---
 drivers/staging/slicoss/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- next-2011-1101.orig/drivers/staging/slicoss/Kconfig
+++ next-2011-1101/drivers/staging/slicoss/Kconfig
@@ -1,6 +1,6 @@
 config SLICOSS
 	tristate "Alacritech Gigabit IS-NIC support"
-	depends on PCI && X86
+	depends on PCI && X86 && NET
 	default n
 	help
 	  This driver supports Alacritech's IS-NIC gigabit ethernet cards.
