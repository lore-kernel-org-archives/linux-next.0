From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next resend] staging: vt6x depends on WLAN
Date: Sun, 6 Dec 2009 10:00:55 -0800
Message-ID: <20091206100055.218cfd52.randy.dunlap@oracle.com>
References: <20091204203014.e8ee54ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:38058 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932315AbZLFTE0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 6 Dec 2009 14:04:26 -0500
In-Reply-To: <20091204203014.e8ee54ca.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

The vt665[56] drivers can be built when CONFIG_NET=n &
CONFIG_NETDEVICES=n or just when CONFIG_WLAN=n.
This leads to build failures.
Prevent this by making them depend on WLAN.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/vt6655/Kconfig |    2 +-
 drivers/staging/vt6656/Kconfig |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20091204.orig/drivers/staging/vt6655/Kconfig
+++ linux-next-20091204/drivers/staging/vt6655/Kconfig
@@ -1,6 +1,6 @@
 config VT6655
    tristate "VIA Technologies VT6655 support"
-   depends on PCI
+   depends on PCI && WLAN
    select WIRELESS_EXT
    select WEXT_PRIV
    ---help---
--- linux-next-20091204.orig/drivers/staging/vt6656/Kconfig
+++ linux-next-20091204/drivers/staging/vt6656/Kconfig
@@ -1,6 +1,6 @@
 config VT6656
 	tristate "VIA Technologies VT6656 support"
-	depends on USB
+	depends on USB && WLAN
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	---help---
