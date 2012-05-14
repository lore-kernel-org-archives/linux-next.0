From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] wdt: ie6xx_wdt needs io.h
Date: Mon, 14 May 2012 13:14:29 -0700
Message-ID: <4FB167A5.9010905@xenotime.net>
References: <20120514200357.e7448e4ca061c8efe3d4757d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:33947 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932328Ab2ENUOS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 May 2012 16:14:18 -0400
In-Reply-To: <20120514200357.e7448e4ca061c8efe3d4757d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build error by including <linux/io.h>:

drivers/watchdog/ie6xx_wdt.c:97:2: error: implicit declaration of function 'outb'
drivers/watchdog/ie6xx_wdt.c:133:2: error: implicit declaration of function 'outl'
drivers/watchdog/ie6xx_wdt.c:161:2: error: implicit declaration of function 'inb'
drivers/watchdog/ie6xx_wdt.c:199:3: error: implicit declaration of function 'inl'
drivers/watchdog/ie6xx_wdt.c:203:3: error: implicit declaration of function 'inw'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	Wim Van Sebroeck <wim@iguana.be>
---
 drivers/watchdog/ie6xx_wdt.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20120514.orig/drivers/watchdog/ie6xx_wdt.c
+++ linux-next-20120514/drivers/watchdog/ie6xx_wdt.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/platform_device.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/watchdog.h>
