From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] power_supply: fix sysfs format warning
Date: Mon, 22 Aug 2011 11:30:47 -0700
Message-ID: <20110822113047.b84e56e2.rdunlap@xenotime.net>
References: <20110822145304.980529cb921e5f1321c622da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy5-pub.bluehost.com ([67.222.38.55]:52392 "HELO
	oproxy5-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752118Ab1HVSau (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Aug 2011 14:30:50 -0400
In-Reply-To: <20110822145304.980529cb921e5f1321c622da@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix format warning:

drivers/power/power_supply_sysfs.c:82: warning: format '%d' expects type 'int', but argument 4 has type 'ssize_t'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 drivers/power/power_supply_sysfs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110822.orig/drivers/power/power_supply_sysfs.c
+++ linux-next-20110822/drivers/power/power_supply_sysfs.c
@@ -78,7 +78,7 @@ static ssize_t power_supply_show_propert
 			dev_dbg(dev, "driver has no data for `%s' property\n",
 				attr->attr.name);
 		else if (ret != -ENODEV)
-			dev_err(dev, "driver failed to report `%s' property: %d\n",
+			dev_err(dev, "driver failed to report `%s' property: %zd\n",
 				attr->attr.name, ret);
 		return ret;
 	}
