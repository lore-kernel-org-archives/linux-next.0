From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] regulator: fix 88pm8607.c printk format warning
Date: Wed, 18 May 2011 10:07:22 -0700
Message-ID: <20110518100722.76bd6fb6.randy.dunlap@oracle.com>
References: <20110518145412.f6cba4ef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:17648 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932791Ab1ERRHo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 May 2011 13:07:44 -0400
In-Reply-To: <20110518145412.f6cba4ef.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Haojian Zhuang <haojian.zhuang@marvell.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk format warning (seen on x86_64) and change to unsigned
output format:

drivers/regulator/88pm8607.c:417: warning: format '%d' expects type 'int', but argument 3 has type 'resource_size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/regulator/88pm8607.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20110518.orig/drivers/regulator/88pm8607.c
+++ linux-next-20110518/drivers/regulator/88pm8607.c
@@ -413,8 +413,8 @@ static int __devinit pm8607_regulator_pr
 			break;
 	}
 	if ((i < 0) || (i > PM8607_ID_RG_MAX)) {
-		dev_err(&pdev->dev, "Failed to find regulator %d\n",
-			res->start);
+		dev_err(&pdev->dev, "Failed to find regulator %llu\n",
+			(unsigned long long)res->start);
 		return -EINVAL;
 	}
 	info->i2c = (chip->id == CHIP_PM8607) ? chip->client : chip->companion;
