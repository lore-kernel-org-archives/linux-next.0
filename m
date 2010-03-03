From: Denis Turischev <denis@compulab.co.il>
Subject: sch_gpio: fix compilation warning "ignoring return value of gpiochip_remove"
Date: Wed, 03 Mar 2010 11:33:29 +0200
Message-ID: <4B8E2CE9.3050001@compulab.co.il>
References: <20100303162252.e7cf0e43.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from compulab.co.il ([67.18.134.219]:49315 "EHLO compulab.co.il"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751405Ab0CCJcy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Mar 2010 04:32:54 -0500
In-Reply-To: <20100303162252.e7cf0e43.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Samuel Ortiz <sameo@linux.intel.com>, linux-next@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>

Signed-off-by: Denis Turischev <denis@compulab.co.il>
---
 drivers/gpio/sch_gpio.c |   25 +++++++++++++++++++++----
 1 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/sch_gpio.c b/drivers/gpio/sch_gpio.c
index 761071a..a89c02d 100644
--- a/drivers/gpio/sch_gpio.c
+++ b/drivers/gpio/sch_gpio.c
@@ -229,7 +229,12 @@ static int __devinit sch_gpio_probe(struct platform_device *pdev)
 	return 0;

 err_sch_gpio_resume:
-	gpiochip_remove(&sch_gpio_core);
+	err = gpiochip_remove(&sch_gpio_core);
+	if (err) {
+		dev_err(&pdev->dev, "%s failed, %d\n",
+				"gpiochip_remove()", err);
+		return err;
+	}

 err_sch_gpio_core:
 	release_region(res->start, resource_size(res));
@@ -240,11 +245,23 @@ err_sch_gpio_core:

 static int __devexit sch_gpio_remove(struct platform_device *pdev)
 {
+	int err_c, err_r;
 	struct resource *res;
 	if (gpio_ba) {
-		gpiochip_remove(&sch_gpio_core);
-		gpiochip_remove(&sch_gpio_resume);
-
+		err_c = gpiochip_remove(&sch_gpio_core);
+		
+		err_r = gpiochip_remove(&sch_gpio_resume);
+
+		if (err_c) {
+			dev_err(&pdev->dev, "%s failed, %d\n",
+					"gpiochip_remove()", err_c);
+			return err_c;
+		}
+		if (err_r) {
+			dev_err(&pdev->dev, "%s failed, %d\n",
+					"gpiochip_remove()", err_r);
+			return err_r;
+		}
 		res = platform_get_resource(pdev, IORESOURCE_IO, 0);

 		release_region(res->start, resource_size(res));
-- 
1.6.3.3
