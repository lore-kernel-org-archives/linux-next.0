From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] cs5535: fix printk format warnings
Date: Mon, 13 Dec 2010 11:44:21 -0800
Message-ID: <20101213114421.3abe0dcb.randy.dunlap@oracle.com>
References: <20101213163607.0b0a7c3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:57707 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752632Ab0LMTp1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 13 Dec 2010 14:45:27 -0500
In-Reply-To: <20101213163607.0b0a7c3a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andres Salomon <dilinger@collabora.co.uk>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warnings in cs5535 drivers:

drivers/gpio/cs5535-gpio.c:269: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
drivers/gpio/cs5535-gpio.c:269: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'
drivers/misc/cs5535-mfgpt.c:320: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
drivers/misc/cs5535-mfgpt.c:320: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Andres Salomon <dilinger@collabora.co.uk>
---
 drivers/gpio/cs5535-gpio.c  |    5 +++--
 drivers/misc/cs5535-mfgpt.c |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

--- linux-next-20101213.orig/drivers/gpio/cs5535-gpio.c
+++ linux-next-20101213/drivers/gpio/cs5535-gpio.c
@@ -266,8 +266,9 @@ static int __devinit cs5535_gpio_probe(s
 	cs5535_gpio_chip.pdev = pdev;
 	spin_lock_init(&cs5535_gpio_chip.lock);
 
-	dev_info(&pdev->dev, "region 0x%x - 0x%x reserved\n",
-			res->start, res->end);
+	dev_info(&pdev->dev, "region 0x%llx - 0x%llx reserved\n",
+			(unsigned long long)res->start,
+			(unsigned long long)res->end);
 
 	/* mask out reserved pins */
 	mask &= 0x1F7FFFFF;
--- linux-next-20101213.orig/drivers/misc/cs5535-mfgpt.c
+++ linux-next-20101213/drivers/misc/cs5535-mfgpt.c
@@ -317,8 +317,9 @@ static int __devinit cs5535_mfgpt_probe(
 	cs5535_mfgpt_chip.pdev = pdev;
 	spin_lock_init(&cs5535_mfgpt_chip.lock);
 
-	dev_info(&pdev->dev, "region 0x%x - 0x%x reserved\n", res->start,
-			res->end);
+	dev_info(&pdev->dev, "region 0x%llx - 0x%llx reserved\n",
+			(unsigned long long)res->start,
+			(unsigned long long)res->end);
 
 	/* detect the available timers */
 	t = scan_timers(&cs5535_mfgpt_chip);
