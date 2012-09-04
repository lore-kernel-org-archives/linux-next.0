From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH] bus: fix omap compile error if CONFIG_OF is true
Date: Tue, 04 Sep 2012 15:41:35 +0100
Message-ID: <20120904144123.25261.79625.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:43128 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757226Ab2IDOX5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Sep 2012 10:23:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kishon@ti.com, linux-next@vger.kernel.org

From: Alan Cox <alan@linux.intel.com>

Signed-off-by: Alan Cox <alan@linux.intel.com>
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
