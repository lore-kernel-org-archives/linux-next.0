From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] staging: fix wireless drivers depends
Date: Thu, 29 Oct 2009 09:52:02 -0700
Message-ID: <20091029095202.09161c1e.randy.dunlap@oracle.com>
References: <20091029182919.4d6ec52c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet11.oracle.com ([141.146.126.233]:20485 "EHLO
	acsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752997AbZJ2Q44 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 29 Oct 2009 12:56:56 -0400
In-Reply-To: <20091029182919.4d6ec52c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

These drivers can (erroneously) be enabled even when
CONFIG_NET=n, CONFIG_NETDEVICES=n, CONFIG_WLAN=n, etc.
Stop this.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/rtl8187se/Kconfig |    2 +-
 drivers/staging/rtl8192e/Kconfig  |    2 +-
 drivers/staging/rtl8192su/Kconfig |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20091029.orig/drivers/staging/rtl8187se/Kconfig
+++ linux-next-20091029/drivers/staging/rtl8187se/Kconfig
@@ -1,6 +1,6 @@
 config RTL8187SE
 	tristate "RealTek RTL8187SE Wireless LAN NIC driver"
-	depends on PCI
+	depends on PCI && WLAN
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	default N
--- linux-next-20091029.orig/drivers/staging/rtl8192e/Kconfig
+++ linux-next-20091029/drivers/staging/rtl8192e/Kconfig
@@ -1,6 +1,6 @@
 config RTL8192E
 	tristate "RealTek RTL8192E Wireless LAN NIC driver"
-	depends on PCI
+	depends on PCI && WLAN
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	default N
--- linux-next-20091029.orig/drivers/staging/rtl8192su/Kconfig
+++ linux-next-20091029/drivers/staging/rtl8192su/Kconfig
@@ -1,6 +1,6 @@
 config RTL8192SU
 	tristate "RealTek RTL8192SU Wireless LAN NIC driver"
-	depends on PCI
+	depends on PCI && WLAN
 	depends on WIRELESS_EXT
 	default N
 	---help---
