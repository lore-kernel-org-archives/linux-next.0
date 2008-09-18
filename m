From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: arm tree build failure
Date: Fri, 19 Sep 2008 04:09:01 +1000
Message-ID: <20080919040901.4a55f305.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60142 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755035AbYIRSJH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Sep 2008 14:09:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: linux-next@vger.kernel.org, Eric Miao <eric.y.miao@gmail.com>

Hi Russell,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/video/backlight/corgi_lcd.c:26:36: error: asm/mach/sharpsl_param.h: No such file or directory
drivers/video/backlight/corgi_lcd.c: In function 'lcdtg_set_phadadj':
drivers/video/backlight/corgi_lcd.c:193: error: 'sharpsl_param' undeclared (first use in this function)
drivers/video/backlight/corgi_lcd.c: In function 'corgi_lcd_power_on':
drivers/video/backlight/corgi_lcd.c:240: error: 'sharpsl_param' undeclared (first use in this function)

I previously reported this against the pxa tree.  I have applied the
patch below (which may not be correct).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 15 Sep 2008 05:24:27 +1000
Subject: [PATCH] pxa: LCD_CORGI is currently BROKEN

I assume it should really depend on ARM or some such.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/video/backlight/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index 8854dbb..361240a 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -27,6 +27,7 @@ config LCD_CLASS_DEVICE
 config LCD_CORGI
 	tristate "LCD Panel support for SHARP corgi/spitz model"
 	depends on LCD_CLASS_DEVICE && SPI_MASTER
+	depends on ARM
 	default n
 	help
 	  Say y here to support the LCD panels usually found on SHARP
-- 
1.5.6.5
