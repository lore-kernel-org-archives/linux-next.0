From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] libertas: depends on CFG80211
Date: Fri, 9 Oct 2009 16:17:30 -0700
Message-ID: <20091009161730.6ae5fe59.randy.dunlap@oracle.com>
References: <20091009190654.741eeffd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091009190654.741eeffd.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Williams <dcbw-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, libertas-dev-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

libertas uses CFG80211 functions so it should depend on that symbol.

drivers/built-in.o: In function `lbs_cfg_free':
(.text+0x9ca93): undefined reference to `wiphy_unregister'
drivers/built-in.o: In function `lbs_cfg_free':
(.text+0x9ca9a): undefined reference to `wiphy_free'
drivers/built-in.o: In function `lbs_cfg_register':
(.text+0x9cb45): undefined reference to `wiphy_register'
drivers/built-in.o: In function `lbs_cfg_alloc':
(.text+0x9cc64): undefined reference to `wiphy_new'

Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
 drivers/net/wireless/libertas/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20091009.orig/drivers/net/wireless/libertas/Kconfig
+++ linux-next-20091009/drivers/net/wireless/libertas/Kconfig
@@ -1,6 +1,6 @@
 config LIBERTAS
 	tristate "Marvell 8xxx Libertas WLAN driver support"
-	depends on WLAN_80211
+	depends on WLAN_80211 && CFG80211
 	select WIRELESS_EXT
 	select WEXT_SPY
 	select LIB80211
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
