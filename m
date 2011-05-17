From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix ath6kl build when CFG80211 is not
 enabled
Date: Tue, 17 May 2011 15:15:19 -0700
Message-ID: <20110517151519.e9238e33.randy.dunlap@oracle.com>
References: <20110517142749.8927b65b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:41722 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984Ab1EQWPm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 May 2011 18:15:42 -0400
In-Reply-To: <20110517142749.8927b65b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <greg@kroah.com>, mcgrof@gmail.com, Joe Perches <joe@perches.com>, Naveen Singh <nsingh@atheros.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build errors when CONFIG_CFG80211 is not enabled:

drivers/built-in.o: In function `ar6k_cfg80211_deinit':
(.text+0x189b71): undefined reference to `cfg80211_scan_done'
drivers/built-in.o: In function `ar6k_cfg80211_deinit':
(.text+0x189b86): undefined reference to `wiphy_unregister'
drivers/built-in.o: In function `ar6k_cfg80211_deinit':
(.text+0x189b8d): undefined reference to `wiphy_free'
drivers/built-in.o: In function `ar6k_cfg80211_init':
(.text+0x18add7): undefined reference to `wiphy_new'
drivers/built-in.o: In function `ar6k_cfg80211_init':
(.text+0x18ae48): undefined reference to `wiphy_register'
drivers/built-in.o: In function `ar6k_cfg80211_tkip_micerr_event':
(.text+0x18ae95): undefined reference to `cfg80211_michael_mic_failure'
drivers/built-in.o: In function `ar6k_cfg80211_scan_node':
(.text+0x18afb5): undefined reference to `__ieee80211_get_channel'
drivers/built-in.o: In function `ar6k_cfg80211_scan_node':
(.text+0x18afd2): undefined reference to `cfg80211_inform_bss_frame'
drivers/built-in.o: In function `ar6k_cfg80211_disconnect_event':
(.text+0x18b046): undefined reference to `cfg80211_ibss_joined'
drivers/built-in.o: In function `ar6k_cfg80211_disconnect_event':
(.text+0x18b176): undefined reference to `cfg80211_connect_result'
drivers/built-in.o: In function `ar6k_cfg80211_disconnect_event':
(.text+0x18b190): undefined reference to `cfg80211_disconnected'
drivers/built-in.o: In function `ar6k_cfg80211_connect_event':
(.text+0x18b291): undefined reference to `cfg80211_get_bss'
drivers/built-in.o: In function `ar6k_cfg80211_connect_event':
(.text+0x18b457): undefined reference to `cfg80211_put_bss'
drivers/built-in.o: In function `ar6k_cfg80211_connect_event':
(.text+0x18b4fa): undefined reference to `cfg80211_roamed'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Greg Kroah-Hartman <greg@kroah.com>
Cc: Luis R. Rodriguez <mcgrof@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: Naveen Singh <nsingh@atheros.com>
---
 drivers/staging/ath6kl/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20110517.orig/drivers/staging/ath6kl/Kconfig
+++ linux-next-20110517/drivers/staging/ath6kl/Kconfig
@@ -1,6 +1,7 @@
 config ATH6K_LEGACY
 	tristate "Atheros AR6003 support (non mac80211)"
         depends on MMC && WLAN
+	depends on CFG80211
         select WIRELESS_EXT
         select WEXT_PRIV
 	help
