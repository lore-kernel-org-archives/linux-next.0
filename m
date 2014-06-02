From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH 1/2] net: of_mdio: use int type for address variable
Date: Mon,  2 Jun 2014 13:32:45 +0200
Message-ID: <1401708766-5530-1-git-send-email-zonque@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:42095 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752784AbaFBLdS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jun 2014 07:33:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, davem@davemloft.net
Cc: netdev@vger.kernel.org, sfr@canb.auug.org.au, Daniel Mack <zonque@gmail.com>

Use int rather than u32 to fix the following warning:

drivers/of/of_mdio.c:147 of_mdiobus_register() warn: unsigned 'addr' is
never less than zero.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Fixes: 8f8382888cba ("net: of_mdio: factor out code to parse a phy's 'reg' property")
---
David,

this patch and the next one fix warnings and build breakage reported
by Stephen and the build test system. They were both introduced by
my patches that you applied lately.

Thanks,
Daniel

 drivers/of/of_mdio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index c719601..cb36018 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -147,9 +147,8 @@ int of_mdiobus_register(struct mii_bus *mdio, struct device_node *np)
 {
 	struct device_node *child;
 	const __be32 *paddr;
-	u32 addr;
 	bool scanphys = false;
-	int rc, i;
+	int addr, rc, i;
 
 	/* Mask out all PHYs from auto probing.  Instead the PHYs listed in
 	 * the device tree are populated after the bus has been registered */
-- 
1.9.0
