From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: gdm72xx depends on NET
Date: Thu, 17 May 2012 09:14:24 -0700
Message-ID: <4FB523E0.1000208@xenotime.net>
References: <20120517174647.fa4794992f2b856b9e5cf03c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:52417 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756862Ab2EQQOR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 May 2012 12:14:17 -0400
In-Reply-To: <20120517174647.fa4794992f2b856b9e5cf03c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org

From: Randy Dunlap <rdunlap@xenotime.net>

gdm72xx uses networking interfaces, so it should depend
at least on NET (maybe on WIMAX?).

ERROR: "sock_release" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "netif_carrier_on" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "netif_carrier_off" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "skb_realloc_headroom" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "netif_rx" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "netlink_kernel_create" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "netif_rx_ni" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "dev_alloc_skb" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "free_netdev" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "register_netdev" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "skb_push" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "dev_get_by_index" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "skb_pull" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "init_net" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "__alloc_skb" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "netlink_broadcast" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "kfree_skb" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "alloc_netdev_mqs" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "eth_type_trans" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "ether_setup" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "unregister_netdev" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "__netif_schedule" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "skb_put" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "sock_wfree" [drivers/staging/gdm72xx/gdmwm.ko] undefined!
ERROR: "__nlmsg_put" [drivers/staging/gdm72xx/gdmwm.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
Please add some contact info somewhere.

 drivers/staging/gdm72xx/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20120517.orig/drivers/staging/gdm72xx/Kconfig
+++ linux-next-20120517/drivers/staging/gdm72xx/Kconfig
@@ -4,6 +4,7 @@
 
 menuconfig WIMAX_GDM72XX
 	tristate "GCT GDM72xx WiMAX support"
+	depends on NET
 	help
 	  Support for the GCT GDM72xx WiMAX chip
 
