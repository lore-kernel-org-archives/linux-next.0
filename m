From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] thermal: depends on NET
Date: Mon, 13 Dec 2010 11:20:33 -0800
Message-ID: <20101213112033.d0060e6c.randy.dunlap@oracle.com>
References: <20101213163607.0b0a7c3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:35316 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753379Ab0LMTVd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Dec 2010 14:21:33 -0500
In-Reply-To: <20101213163607.0b0a7c3a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Zimny Lech <napohybelskurwysynom2010@gmail.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

ERROR: "genl_register_family" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "genl_unregister_family" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "init_net" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "__alloc_skb" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "netlink_broadcast" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "kfree_skb" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "genl_register_mc_group" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "nla_reserve" [drivers/thermal/thermal_sys.ko] undefined!
ERROR: "skb_put" [drivers/thermal/thermal_sys.ko] undefined!

Reported-by: Zimny Lech <napohybelskurwysynom2010@gmail.com>
Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Zhang Rui <rui.zhang@intel.com>
---
 drivers/thermal/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20101213.orig/drivers/thermal/Kconfig
+++ linux-next-20101213/drivers/thermal/Kconfig
@@ -4,6 +4,7 @@
 
 menuconfig THERMAL
 	tristate "Generic Thermal sysfs driver"
+	depends on NET
 	help
 	  Generic Thermal Sysfs driver offers a generic mechanism for
 	  thermal management. Usually it's made up of one or more thermal
