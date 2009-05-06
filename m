From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH next-20090506] wireless: WL12XX should depend on GENERIC_HARDIRQS
Date: Wed, 6 May 2009 22:35:58 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0905062229370.23257@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1760996AbZEFUgY@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kalle.valo@nokia.com>, Bob Copeland <me@bobcopeland.com>, "John W. Linville" <linville@tuxdriver.com>
Cc: linux-wireless@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

m68k allmodconfig:
| drivers/net/wireless/wl12xx/main.c: In function 'wl12xx_probe':
| drivers/net/wireless/wl12xx/main.c:1273: error: implicit declaration of function 'set_irq_type'
| make[1]: *** [drivers/net/wireless/wl12xx/main.o] Error 1

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/416697/

diff --git a/drivers/net/wireless/wl12xx/Kconfig b/drivers/net/wireless/wl12xx/Kconfig
index 20a9633..a82c4cd 100644
--- a/drivers/net/wireless/wl12xx/Kconfig
+++ b/drivers/net/wireless/wl12xx/Kconfig
@@ -1,6 +1,6 @@
 config WL12XX
 	tristate "TI wl1251/wl1271 support"
-	depends on MAC80211 && WLAN_80211 && SPI_MASTER && EXPERIMENTAL
+	depends on MAC80211 && WLAN_80211 && SPI_MASTER && GENERIC_HARDIRQS && EXPERIMENTAL
 	select FW_LOADER
 	select CRC7
 	---help---

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
