From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH 2/2] of: of_mdio: export symbol of_mdiobus_link_phydev
Date: Mon,  2 Jun 2014 13:32:46 +0200
Message-ID: <1401708766-5530-2-git-send-email-zonque@gmail.com>
References: <1401708766-5530-1-git-send-email-zonque@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:43782 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752784AbaFBLd1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Jun 2014 07:33:27 -0400
In-Reply-To: <1401708766-5530-1-git-send-email-zonque@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, davem@davemloft.net
Cc: netdev@vger.kernel.org, sfr@canb.auug.org.au, Daniel Mack <zonque@gmail.com>

Make of_mdiobus_link_phydev externally available.
This fixes CONFIG_OF_MDIO=m.

Signed-off-by: Daniel Mack <zonque@gmail.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 86f6cf41272 ("net: of_mdio: add of_mdiobus_link_phydev()")
---
 drivers/of/of_mdio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index cb36018..b64c258 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -240,6 +240,7 @@ void of_mdiobus_link_phydev(struct mii_bus *mdio,
 		}
 	}
 }
+EXPORT_SYMBOL(of_mdiobus_link_phydev);
 
 /* Helper function for of_phy_find_device */
 static int of_phy_match(struct device *dev, void *phy_np)
-- 
1.9.0
