From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix wlan-ng depends
Date: Wed, 23 Jun 2010 20:28:15 -0700
Message-ID: <20100623202815.6f19f851.randy.dunlap@oracle.com>
References: <20100623154531.0a4b02e1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:64860 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753483Ab0FXD2z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jun 2010 23:28:55 -0400
In-Reply-To: <20100623154531.0a4b02e1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, devel@driverdev.osuosl.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

drivers/built-in.o: In function `wlan_free_wiphy':
(.text+0x3f5eb5): undefined reference to `wiphy_unregister'
drivers/built-in.o: In function `wlan_free_wiphy':
(.text+0x3f5ec4): undefined reference to `wiphy_free'
drivers/built-in.o: In function `wlan_create_wiphy':
(.text+0x3f5f76): undefined reference to `wiphy_new'
drivers/built-in.o: In function `wlan_create_wiphy':
(.text+0x3f6024): undefined reference to `wiphy_register'
drivers/built-in.o: In function `prism2_roamed':
(.text+0x3f61f7): undefined reference to `cfg80211_roamed'
drivers/built-in.o: In function `prism2_disconnected':
(.text+0x3f6223): undefined reference to `cfg80211_disconnected'
drivers/built-in.o: In function `prism2_connect_result':
(.text+0x3f626d): undefined reference to `cfg80211_connect_result'
drivers/built-in.o: In function `prism2_connect':
(.text+0x3f62b6): undefined reference to `ieee80211_frequency_to_channel'
drivers/built-in.o: In function `prism2_scan':
(.text+0x3f6679): undefined reference to `ieee80211_frequency_to_channel'
drivers/built-in.o: In function `prism2_scan':
(.text+0x3f6873): undefined reference to `__ieee80211_get_channel'
drivers/built-in.o: In function `prism2_scan':
(.text+0x3f68cc): undefined reference to `cfg80211_inform_bss'
drivers/built-in.o: In function `prism2_scan':
(.text+0x3f6942): undefined reference to `cfg80211_scan_done'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc:	devel@driverdev.osuosl.org
---
 drivers/staging/wlan-ng/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100623.orig/drivers/staging/wlan-ng/Kconfig
+++ linux-next-20100623/drivers/staging/wlan-ng/Kconfig
@@ -1,6 +1,6 @@
 config PRISM2_USB
 	tristate "Prism2.5/3 USB driver"
-	depends on WLAN && USB
+	depends on WLAN && USB && CFG80211
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	default n
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
