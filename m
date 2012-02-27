From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] rtc: fix rtc-ds1307 printk format warning
Date: Mon, 27 Feb 2012 10:25:41 -0800
Message-ID: <4F4BCAA5.8060308@xenotime.net>
References: <20120227182029.545a7db32550ce94c9faffb4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:57236 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753318Ab2B0SZj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Feb 2012 13:25:39 -0500
In-Reply-To: <20120227182029.545a7db32550ce94c9faffb4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warning:

drivers/rtc/rtc-ds1307.c:915:3: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	Alessandro Zummo <a.zummo@towertech.it>
Cc:	rtc-linux@googlegroups.com
---
 drivers/rtc/rtc-ds1307.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120227.orig/drivers/rtc/rtc-ds1307.c
+++ linux-next-20120227/drivers/rtc/rtc-ds1307.c
@@ -912,7 +912,7 @@ read_rtc:
 			goto exit_nvram;
 		}
 		set_bit(HAS_NVRAM, &ds1307->flags);
-		dev_info(&client->dev, "%d bytes nvram\n", ds1307->nvram->size);
+		dev_info(&client->dev, "%zu bytes nvram\n", ds1307->nvram->size);
 	}
 
 	return 0;
