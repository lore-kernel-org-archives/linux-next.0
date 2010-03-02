From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] bridge: depends on INET
Date: Tue, 02 Mar 2010 09:08:23 -0800
Message-ID: <4B8D4607.8070603@xenotime.net>
References: <20100302180915.1388d3f3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:42221 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751531Ab0CBRI2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Mar 2010 12:08:28 -0500
Received: from chimera.site ([71.245.98.113]) by xenotime.net for <linux-next@vger.kernel.org>; Tue, 2 Mar 2010 09:08:23 -0800
In-Reply-To: <20100302180915.1388d3f3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Hemminger <shemminger@linux-foundation.org>, bridge@lists.linux-foundation.org

From: Randy Dunlap <randy.dunlap@oracle.com>

br_multicast calls ip_send_check(), so it should depend on INET.

built-in:
br_multicast.c:(.text+0x88cf4): undefined reference to `ip_send_check'

or modular:
ERROR: "ip_send_check" [net/bridge/bridge.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Hemminger <shemminger@linux-foundation.org>
Cc: bridge@lists.linux-foundation.org
---
 net/bridge/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20100302.orig/net/bridge/Kconfig
+++ linux-next-20100302/net/bridge/Kconfig
@@ -35,6 +35,7 @@ config BRIDGE
 config BRIDGE_IGMP_SNOOPING
 	bool "IGMP snooping"
 	depends on BRIDGE
+	depends on INET
 	default y
 	---help---
 	  If you say Y here, then the Ethernet bridge will be able selectively
