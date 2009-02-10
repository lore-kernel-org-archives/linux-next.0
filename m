From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] rtl8187se: depends on WIRELESS_EXT
Date: Tue, 10 Feb 2009 09:24:49 -0800
Message-ID: <20090210092449.1075249d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:48749 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753984AbZBJRZ5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 10 Feb 2009 12:25:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, gregkh@suse.de, linux-wireless@vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

rtl8187se uses wireless extensions so it needs to depend on
WIRELESS_EXT (or select it).

drivers/staging/rtl8187se/r8180_core.c:5973: error: 'struct net_device' has no member named 'wireless_handlers'
drivers/staging/rtl8187se/r8180_core.c:5982: error: 'struct net_device' has no member named 'wireless_handlers'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Greg KH <gregkh@suse.de>
---
 drivers/staging/rtl8187se/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090210.orig/drivers/staging/rtl8187se/Kconfig
+++ linux-next-20090210/drivers/staging/rtl8187se/Kconfig
@@ -1,5 +1,6 @@
 config RTL8187SE
 	tristate "RealTek RTL8187SE Wireless LAN NIC driver"
 	depends on PCI
+	depends on WIRELESS_EXT
 	default N
 	---help---
