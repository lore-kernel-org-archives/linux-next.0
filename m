From: Joe Perches <joe@perches.com>
Subject: [PATCH V2 -next] cs5535: fix printk format warnings
Date: Mon, 13 Dec 2010 12:28:05 -0800
Message-ID: <1292272085.26970.50.camel@Joe-Laptop>
References: <20101213163607.0b0a7c3a.sfr@canb.auug.org.au>
	 <20101213114421.3abe0dcb.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:2555 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757107Ab0LMU2H (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Dec 2010 15:28:07 -0500
In-Reply-To: <20101213114421.3abe0dcb.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andres Salomon <dilinger@collabora.co.uk>

Use vsprintf extension %pR to format resource.

Original-patch-by: Randy Dunlap <randy.dunlap@oracle.com>
Signed-off-by: Joe Perches <joe@perches.com>

---

 drivers/gpio/cs5535-gpio.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/cs5535-gpio.c b/drivers/gpio/cs5535-gpio.c
index b566fd5e..d7da7a1 100644
--- a/drivers/gpio/cs5535-gpio.c
+++ b/drivers/gpio/cs5535-gpio.c
@@ -266,8 +266,7 @@ static int __devinit cs5535_gpio_probe(struct platform_device *pdev)
 	cs5535_gpio_chip.pdev = pdev;
 	spin_lock_init(&cs5535_gpio_chip.lock);
 
-	dev_info(&pdev->dev, "region 0x%x - 0x%x reserved\n",
-			res->start, res->end);
+	dev_info(&pdev->dev, "reserved resource region %pR\n", res);
 
 	/* mask out reserved pins */
 	mask &= 0x1F7FFFFF;
