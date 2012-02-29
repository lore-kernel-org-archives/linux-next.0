From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] backlight: fix ot200_bl build
Date: Wed, 29 Feb 2012 11:06:55 -0800
Message-ID: <4F4E774F.4010502@xenotime.net>
References: <20120229175205.d165fa5266f400bc080253a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120229175205.d165fa5266f400bc080253a0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Christian Gmeiner <christian.gmeiner@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build error when GPIO_CS5535 is not enabled:

drivers/built-in.o: In function `ot200_backlight_probe':
ot200_bl.c:(.text+0x205bf): undefined reference to `cs5535_gpio_set'
ot200_bl.c:(.text+0x205d1): undefined reference to `cs5535_gpio_set'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/video/backlight/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120229.orig/drivers/video/backlight/Kconfig
+++ linux-next-20120229/drivers/video/backlight/Kconfig
@@ -343,7 +343,7 @@ config BACKLIGHT_LP855X
 
 config BACKLIGHT_OT200
 	tristate "Backlight driver for ot200 visualisation device"
-	depends on BACKLIGHT_CLASS_DEVICE && CS5535_MFGPT
+	depends on BACKLIGHT_CLASS_DEVICE && CS5535_MFGPT && GPIO_CS5535
 	help
 	  To compile this driver as a module, choose M here: the module will be
 	  called ot200_bl.
