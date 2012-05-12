From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] watchdog: fix ie6xx_wdt.c printk format warning
Date: Fri, 11 May 2012 18:33:31 -0700
Message-ID: <4FADBDEB.402@xenotime.net>
References: <20120511162738.1d65b6efe099a54841be6313@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120511162738.1d65b6efe099a54841be6313@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wim Van Sebroeck <wim@iguana.be>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warning; use cast to u64 since resource_size_t can
be either u32 or u64.

drivers/watchdog/ie6xx_wdt.c:261:4: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/watchdog/ie6xx_wdt.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20120511.orig/drivers/watchdog/ie6xx_wdt.c
+++ linux-next-20120511/drivers/watchdog/ie6xx_wdt.c
@@ -257,8 +257,8 @@ static int __devinit ie6xx_wdt_probe(str
 		return -ENODEV;
 
 	if (!request_region(res->start, resource_size(res), pdev->name)) {
-		dev_err(&pdev->dev, "Watchdog region 0x%x already in use!\n",
-			res->start);
+		dev_err(&pdev->dev, "Watchdog region 0x%llx already in use!\n",
+			(u64)res->start);
 		return -EBUSY;
 	}
 
