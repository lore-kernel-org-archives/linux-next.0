From: Wim Van Sebroeck <wim@iguana.be>
Subject: drivers/watchdog/s3c2410_wdt patch is missing an include
Date: Thu, 3 May 2012 07:03:30 +0200
Message-ID: <20120503050330.GA18558@spo001.leaseweb.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ns1.pc-advies.be ([83.149.101.17]:55410 "EHLO
	spo001.leaseweb.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751467Ab2ECFtS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 May 2012 01:49:18 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

Just a quick e-mail to let you know that the below patch is missing an:
#include <linux/of.h>

I will fix this in my tree today.

Sorry,
Wim.
---
commit 4c1134cc961f825370dd9f84ce0169bd0ed97957
Author: Wim Van Sebroeck <wim@iguana.be>
Date:   Wed May 2 14:42:22 2012 +0200

    watchdog: s3c2410-wdt: Use of_match_ptr().
    
    Use of_match_ptr definition for the of_match_table.
    
    Signed-off-by: Wim Van Sebroeck <wim@iguana.be>

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 04e5a6d..686c8fc 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -503,8 +503,6 @@ static const struct of_device_id s3c2410_wdt_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
-#else
-#define s3c2410_wdt_match NULL
 #endif
 
 static struct platform_driver s3c2410wdt_driver = {
@@ -516,7 +514,7 @@ static struct platform_driver s3c2410wdt_driver = {
 	.driver		= {
 		.owner	= THIS_MODULE,
 		.name	= "s3c2410-wdt",
-		.of_match_table	= s3c2410_wdt_match,
+		.of_match_table	= of_match_ptr(s3c2410_wdt_match),
 	},
 };
 
