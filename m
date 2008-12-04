From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] rtc twl4030: rename ioctl function when RTC_INTF_DEV=n
Date: Wed, 03 Dec 2008 17:30:59 -0800
Message-ID: <493732D3.4020902@xenotime.net>
References: <20081203183602.c06f8c39.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.64.118]:59185 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1754259AbYLDBbF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 20:31:05 -0500
Received: from ::ffff:71.117.247.66 ([71.117.247.66]) by xenotime.net for <linux-next@vger.kernel.org>; Wed, 3 Dec 2008 17:31:00 -0800
In-Reply-To: <20081203183602.c06f8c39.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sameo@openedhand.com, akpm <akpm@linux-foundation.org>, a.zummo@towertech.it

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build error when RTC_INTF_DEV=n:

drivers/rtc/rtc-twl4030.c:402: error: 'twl4030_rtc_ioctl' undeclared here (not in a function)
make[3]: *** [drivers/rtc/rtc-twl4030.o] Error 1

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/rtc/rtc-twl4030.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20081203.orig/drivers/rtc/rtc-twl4030.c
+++ linux-next-20081203/drivers/rtc/rtc-twl4030.c
@@ -337,7 +337,7 @@ static int twl4030_rtc_ioctl(struct devi
 }
 
 #else
-#define	omap_rtc_ioctl	NULL
+#define	twl4030_rtc_ioctl	NULL
 #endif
 
 static irqreturn_t twl4030_rtc_interrupt(int irq, void *rtc)
