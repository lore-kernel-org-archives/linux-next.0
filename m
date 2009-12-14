From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] staging/vt66*: kconfig, depends on WLAN
Date: Mon, 14 Dec 2009 08:44:46 -0800
Message-ID: <20091214084446.8346f39c.randy.dunlap@oracle.com>
References: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:29620 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756613AbZLNQow (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 11:44:52 -0500
In-Reply-To: <20091214165927.c08c4784.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

The vt665[56] drivers can be built when CONFIG_NET=n &
CONFIG_NETDEVICES=n or just when CONFIG_WLAN=n.
This leads to build failures.
Prevent this by making them depend on WLAN.

[This patch was lost in a dualing trees merge;
still needs to be re-applied.]

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
