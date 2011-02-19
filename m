From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] wl12xx: fix sdio_test kconfig/build errors
Date: Fri, 18 Feb 2011 17:25:36 -0800
Message-ID: <20110218172536.970b5b39.randy.dunlap@oracle.com>
References: <20110217162650.092e77c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110217162650.092e77c3.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Luciano Coelho <luciano.coelho-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, akpm <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

The wl12xx sdio_test code uses wl12xx_get_platform_data, which is
only present when WL12*_SDIO is enabled, so make WL12XX_SDIO_TEST
depend on WL12XX_SDIO so that the needed interface will be present.

sdio_test.c:(.devinit.text+0x13178): undefined reference to `wl12xx_get_platform_data'

Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Luciano Coelho <luciano.coelho-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Roger Quadros <roger.quadros-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
---
 drivers/net/wireless/wl12xx/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110217.orig/drivers/net/wireless/wl12xx/Kconfig
+++ linux-next-20110217/drivers/net/wireless/wl12xx/Kconfig
@@ -54,7 +54,7 @@ config WL12XX_SDIO
 
 config WL12XX_SDIO_TEST
 	tristate "TI wl12xx SDIO testing support"
-	depends on WL12XX && MMC
+	depends on WL12XX && MMC && WL12XX_SDIO
 	default n
 	---help---
 	  This module adds support for the SDIO bus testing with the
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
