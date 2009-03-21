From: Alexander Clouter <alex@digriz.org.uk>
Subject: [PATCH] [HWRNG] fixed timeriomem-rng to use a phys address rather
	than virt
Date: Sat, 21 Mar 2009 13:28:03 +0000
Message-ID: <20090321132803.GN22563@woodchuck>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from woodchuck.wormnet.eu ([77.75.105.223]:38433 "EHLO
	woodchuck.wormnet.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753651AbZCUN2J (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 21 Mar 2009 09:28:09 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Herbert Xu <herbert@gondor.apana.org.au>

[HWRNG] fixed timeriomem-rng to use a phys address rather than virt

There is no ioremap'ing or anything in timeriomem-rng.c as I foolishly
used already remapped virtual addresses instead of passing the physical
address to be polled.

This patch fixes this flaw and lets developers do the Right Thing(tm).

Signed-off-by: Alexander Clouter <alex@digriz.org.uk>
---
 drivers/char/hw_random/timeriomem-rng.c |   39 +++++++++++++++++++++++++++---
 include/linux/timeriomem-rng.h          |    2 +-
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/char/hw_random/timeriomem-rng.c b/drivers/char/hw_random/timeriomem-rng.c
index 10ad41b..dcd352a 100644
--- a/drivers/char/hw_random/timeriomem-rng.c
+++ b/drivers/char/hw_random/timeriomem-rng.c
@@ -90,10 +90,30 @@ static struct hwrng timeriomem_rng_ops = {
 
 static int __init timeriomem_rng_probe(struct platform_device *pdev)
 {
+	struct resource *res, *mem;
 	int ret;
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+
+	if (!res)
+		return -ENOENT;
+
+	mem = request_mem_region(res->start, res->end - res->start + 1,
+				 pdev->name);
+	if (mem == NULL)
+		return -EBUSY;
+
+	dev_set_drvdata(&pdev->dev, mem);
+
 	timeriomem_rng_data = pdev->dev.platform_data;
 
+	timeriomem_rng_data->address = ioremap(res->start,
+						res->end - res->start + 1);
+	if (!timeriomem_rng_data->address) {
+		ret = -ENOMEM;
+		goto err_ioremap;
+	}
+
 	if (timeriomem_rng_data->period != 0
 		&& usecs_to_jiffies(timeriomem_rng_data->period) > 0) {
 		timeriomem_rng_timer.expires = jiffies;
@@ -104,23 +124,34 @@ static int __init timeriomem_rng_probe(struct platform_device *pdev)
 	timeriomem_rng_data->present = 1;
 
 	ret = hwrng_register(&timeriomem_rng_ops);
-	if (ret) {
-		dev_err(&pdev->dev, "problem registering\n");
-		return ret;
-	}
+	if (ret)
+		goto err_register;
 
 	dev_info(&pdev->dev, "32bits from 0x%p @ %dus\n",
 			timeriomem_rng_data->address,
 			timeriomem_rng_data->period);
 
 	return 0;
+
+err_register:
+	dev_err(&pdev->dev, "problem registering\n");
+	iounmap(timeriomem_rng_data->address);
+err_ioremap:
+	release_resource(mem);
+
+	return ret;
 }
 
 static int __devexit timeriomem_rng_remove(struct platform_device *pdev)
 {
+	struct resource *mem = dev_get_drvdata(&pdev->dev);
+
 	del_timer_sync(&timeriomem_rng_timer);
 	hwrng_unregister(&timeriomem_rng_ops);
 
+	iounmap(timeriomem_rng_data->address);
+	release_resource(mem);
+
 	return 0;
 }
 
diff --git a/include/linux/timeriomem-rng.h b/include/linux/timeriomem-rng.h
index dd25317..3e08a1c 100644
--- a/include/linux/timeriomem-rng.h
+++ b/include/linux/timeriomem-rng.h
@@ -14,7 +14,7 @@ struct timeriomem_rng_data {
 	struct completion	completion;
 	unsigned int		present:1;
 
-	u32 __iomem		*address;
+	void __iomem		*address;
 
 	/* measures in usecs */
 	unsigned int		period;
-- 
1.6.2
