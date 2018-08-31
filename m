From: Moritz Fischer <mdf@kernel.org>
Subject: [PATCH net-next] net: nixge: Fix Kconfig warning with OF_MDIO
Date: Fri, 31 Aug 2018 13:30:54 -0700
Message-ID: <20180831203054.12132-1-mdf@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, moritz.fischer@ettus.com, linux-next@vger.kernel.org, Moritz Fischer <mdf@kernel.org>
List-Id: linux-next.vger.kernel.org

Fix Kconfig warning with OF_MDIO where OF_MDIO was
selected unconditionally instead of only when
OF is actually enabled.

Fixes 7e8d5755be0e ("net: nixge: Add support for 64-bit platforms")
Suggested-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Moritz Fischer <mdf@kernel.org>
---
 drivers/net/ethernet/ni/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ni/Kconfig b/drivers/net/ethernet/ni/Kconfig
index 04e315704f71..c73978474c4b 100644
--- a/drivers/net/ethernet/ni/Kconfig
+++ b/drivers/net/ethernet/ni/Kconfig
@@ -20,7 +20,7 @@ config NI_XGE_MANAGEMENT_ENET
 	tristate "National Instruments XGE management enet support"
 	depends on HAS_IOMEM && HAS_DMA
 	select PHYLIB
-	select OF_MDIO
+	select OF_MDIO if OF
 	help
 	  Simple LAN device for debug or management purposes. Can
 	  support either 10G or 1G PHYs via SFP+ ports.
-- 
2.18.0
