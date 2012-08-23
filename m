From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH] drivers: bus: omap-ocp2scp: Fix compile error
Date: Thu, 23 Aug 2012 23:10:26 +0530
Message-ID: <1345743626-28364-1-git-send-email-kishon@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:60812 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754993Ab2HWRkj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Aug 2012 13:40:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kishon@ti.com, rdunlap@xenotime.net, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes
CC [M]  drivers/bus/omap-ocp2scp.o
drivers/bus/omap-ocp2scp.c:70:1: error: '__mod_of_device_table' aliased to
undefined symbol 'omap_usb2_id_table'

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 drivers/bus/omap-ocp2scp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/omap-ocp2scp.c b/drivers/bus/omap-ocp2scp.c
index 9075ef8..ff63560 100644
--- a/drivers/bus/omap-ocp2scp.c
+++ b/drivers/bus/omap-ocp2scp.c
@@ -67,7 +67,7 @@ static const struct of_device_id omap_ocp2scp_id_table[] = {
 	{ .compatible = "ti,omap-ocp2scp" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, omap_usb2_id_table);
+MODULE_DEVICE_TABLE(of, omap_ocp2scp_id_table);
 #endif
 
 static struct platform_driver omap_ocp2scp_driver = {
-- 
1.7.9.5
