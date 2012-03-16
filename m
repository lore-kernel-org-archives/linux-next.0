From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH] watchdog: fix compiler error for missing parenthesis
Date: Fri, 16 Mar 2012 15:27:21 +0900
Message-ID: <4F62DD49.1040909@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41864 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965212Ab2CPG1c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Mar 2012 02:27:32 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M0Y00G4ASHC1A70@mailout2.samsung.com> for
 linux-next@vger.kernel.org; Fri, 16 Mar 2012 15:27:30 +0900 (KST)
Received: from [165.213.219.108] by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0M0Y009HLSLW9020@mmp1.samsung.com> for
 linux-next@vger.kernel.org; Fri, 16 Mar 2012 15:27:32 +0900 (KST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: sfr@canb.auug.org.au, joe@perches.com, Kyungmin Park <kyungmin.park@samsung.com>

Hi Stephen.

Joe's patch(watchdog: Use pr_<fmt> and pr_<level>) is missed the parenthesis in s3c2410_wdt.c.
(based-on latest linux-next repository)
It's fixed with this patch.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 46c251d..04e5a6d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -523,7 +523,7 @@ static struct platform_driver s3c2410wdt_driver = {
 
 static int __init watchdog_init(void)
 {
-	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n";
+	pr_info("S3C2410 Watchdog Timer, (c) 2004 Simtec Electronics\n");
 
 	return platform_driver_register(&s3c2410wdt_driver);
 }
