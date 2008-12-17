From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build warnings
Date: Tue, 16 Dec 2008 23:53:55 -0800 (PST)
Message-ID: <20081216.235355.139378362.davem@davemloft.net>
References: <20081217182224.a7f20a12.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:51137
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1751548AbYLQHxy (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 02:53:54 -0500
In-Reply-To: <20081217182224.a7f20a12.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, steve.glendinning@smsc.com, yanivr@broadcom.com, eilong@broadcom.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 17 Dec 2008 18:22:24 +1100

> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> 
> In file included from drivers/net/bnx2x_main.c:58:
> drivers/net/bnx2x_link.h:30:1: warning: "FLOW_CTRL_TX" redefined
> In file included from drivers/net/bnx2x_main.c:40:
> include/linux/mii.h:139:1: warning: this is the location of the previous definition
> In file included from drivers/net/bnx2x_main.c:58:
> drivers/net/bnx2x_link.h:31:1: warning: "FLOW_CTRL_RX" redefined
> In file included from drivers/net/bnx2x_main.c:40:
> include/linux/mii.h:140:1: warning: this is the location of the previous definition
> 
> Caused by commit e18ce3465477502108187c6c08b6423fb784a313 ("net: Move flow control definitions to mii.h").
> -- 

Thanks, I'll fix this up with the following two commits:

--------------------
bnx2: Don't redefine FLOW_CTRL_{RX,TX}.

They are provided generically by linux/mii.h now.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/bnx2.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/net/bnx2.h b/drivers/net/bnx2.h
index 88f962b..900641a 100644
--- a/drivers/net/bnx2.h
+++ b/drivers/net/bnx2.h
@@ -6848,9 +6848,6 @@ struct bnx2 {
 	u8			flow_ctrl;	/* actual flow ctrl settings */
 						/* may be different from     */
 						/* req_flow_ctrl if autoneg  */
-#define FLOW_CTRL_TX		1
-#define FLOW_CTRL_RX		2
-
 	u32			advertising;
 
 	u8			req_flow_ctrl;	/* flow ctrl advertisement */
-- 
1.5.6.5

--------------------
bnx2x: Fix namespace collision with FLOW_CTRL_{TX,RX}

These are now defined in linux/mii.h and the bnx2x driver
defines different values which are shared with hardware
data structures.

So add a "BNX2X_" prefix to these macro names.

Based upon a report from Stephen Rothwell.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/bnx2x_link.c |   72 +++++++++++++++++++++++-----------------------
 drivers/net/bnx2x_link.h |   10 +++---
 drivers/net/bnx2x_main.c |   38 ++++++++++++------------
 3 files changed, 60 insertions(+), 60 deletions(-)

diff --git a/drivers/net/bnx2x_link.c b/drivers/net/bnx2x_link.c
index 4ce7fe9..67de94f 100644
--- a/drivers/net/bnx2x_link.c
+++ b/drivers/net/bnx2x_link.c
@@ -289,7 +289,7 @@ static u8 bnx2x_emac_enable(struct link_params *params,
 		/* pause enable/disable */
 		bnx2x_bits_dis(bp, emac_base + EMAC_REG_EMAC_RX_MODE,
 			       EMAC_RX_MODE_FLOW_EN);
-		if (vars->flow_ctrl & FLOW_CTRL_RX)
+		if (vars->flow_ctrl & BNX2X_FLOW_CTRL_RX)
 			bnx2x_bits_en(bp, emac_base +
 				    EMAC_REG_EMAC_RX_MODE,
 				    EMAC_RX_MODE_FLOW_EN);
@@ -297,7 +297,7 @@ static u8 bnx2x_emac_enable(struct link_params *params,
 		bnx2x_bits_dis(bp,  emac_base + EMAC_REG_EMAC_TX_MODE,
 			     (EMAC_TX_MODE_EXT_PAUSE_EN |
 			      EMAC_TX_MODE_FLOW_EN));
-		if (vars->flow_ctrl & FLOW_CTRL_TX)
+		if (vars->flow_ctrl & BNX2X_FLOW_CTRL_TX)
 			bnx2x_bits_en(bp, emac_base +
 				    EMAC_REG_EMAC_TX_MODE,
 				   (EMAC_TX_MODE_EXT_PAUSE_EN |
@@ -333,7 +333,7 @@ static u8 bnx2x_emac_enable(struct link_params *params,
 	/* enable the NIG in/out to the emac */
 	REG_WR(bp, NIG_REG_EMAC0_IN_EN + port*4, 0x1);
 	val = 0;
-	if (vars->flow_ctrl & FLOW_CTRL_TX)
+	if (vars->flow_ctrl & BNX2X_FLOW_CTRL_TX)
 		val = 1;
 
 	REG_WR(bp, NIG_REG_EMAC0_PAUSE_OUT_EN + port*4, val);
@@ -396,7 +396,7 @@ static u8 bnx2x_bmac_enable(struct link_params *params, struct link_vars *vars,
 
 	/* tx control */
 	val = 0xc0;
-	if (vars->flow_ctrl & FLOW_CTRL_TX)
+	if (vars->flow_ctrl & BNX2X_FLOW_CTRL_TX)
 		val |= 0x800000;
 	wb_data[0] = val;
 	wb_data[1] = 0;
@@ -423,7 +423,7 @@ static u8 bnx2x_bmac_enable(struct link_params *params, struct link_vars *vars,
 
 	/* rx control set to don't strip crc */
 	val = 0x14;
-	if (vars->flow_ctrl & FLOW_CTRL_RX)
+	if (vars->flow_ctrl & BNX2X_FLOW_CTRL_RX)
 		val |= 0x20;
 	wb_data[0] = val;
 	wb_data[1] = 0;
@@ -460,7 +460,7 @@ static u8 bnx2x_bmac_enable(struct link_params *params, struct link_vars *vars,
 	REG_WR(bp, NIG_REG_XGXS_LANE_SEL_P0 + port*4, 0x0);
 	REG_WR(bp, NIG_REG_EGRESS_EMAC0_PORT + port*4, 0x0);
 	val = 0;
-	if (vars->flow_ctrl & FLOW_CTRL_TX)
+	if (vars->flow_ctrl & BNX2X_FLOW_CTRL_TX)
 		val = 1;
 	REG_WR(bp, NIG_REG_BMAC0_PAUSE_OUT_EN + port*4, val);
 	REG_WR(bp, NIG_REG_EGRESS_EMAC0_OUT_EN + port*4, 0x0);
@@ -580,14 +580,14 @@ void bnx2x_link_status_update(struct link_params *params,
 		}
 
 		if (vars->link_status & LINK_STATUS_TX_FLOW_CONTROL_ENABLED)
-			vars->flow_ctrl |= FLOW_CTRL_TX;
+			vars->flow_ctrl |= BNX2X_FLOW_CTRL_TX;
 		else
-			vars->flow_ctrl &= ~FLOW_CTRL_TX;
+			vars->flow_ctrl &= ~BNX2X_FLOW_CTRL_TX;
 
 		if (vars->link_status & LINK_STATUS_RX_FLOW_CONTROL_ENABLED)
-			vars->flow_ctrl |= FLOW_CTRL_RX;
+			vars->flow_ctrl |= BNX2X_FLOW_CTRL_RX;
 		else
-			vars->flow_ctrl &= ~FLOW_CTRL_RX;
+			vars->flow_ctrl &= ~BNX2X_FLOW_CTRL_RX;
 
 		if (vars->phy_flags & PHY_XGXS_FLAG) {
 			if (vars->line_speed &&
@@ -618,7 +618,7 @@ void bnx2x_link_status_update(struct link_params *params,
 
 		vars->line_speed = 0;
 		vars->duplex = DUPLEX_FULL;
-		vars->flow_ctrl = FLOW_CTRL_NONE;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 
 		/* indicate no mac active */
 		vars->mac_type = MAC_TYPE_NONE;
@@ -691,7 +691,7 @@ static u8 bnx2x_pbf_update(struct link_params *params, u32 flow_ctrl,
 		return -EINVAL;
 	}
 
-	if (flow_ctrl & FLOW_CTRL_RX ||
+	if (flow_ctrl & BNX2X_FLOW_CTRL_RX ||
 	    line_speed == SPEED_10 ||
 	    line_speed == SPEED_100 ||
 	    line_speed == SPEED_1000 ||
@@ -1300,8 +1300,8 @@ static void bnx2x_calc_ieee_aneg_adv(struct link_params *params, u32 *ieee_fc)
 	 * Please refer to Table 28B-3 of the 802.3ab-1999 spec */
 
 	switch (params->req_flow_ctrl) {
-	case FLOW_CTRL_AUTO:
-		if (params->req_fc_auto_adv == FLOW_CTRL_BOTH) {
+	case BNX2X_FLOW_CTRL_AUTO:
+		if (params->req_fc_auto_adv == BNX2X_FLOW_CTRL_BOTH) {
 			*ieee_fc |=
 			     MDIO_COMBO_IEEE0_AUTO_NEG_ADV_PAUSE_BOTH;
 		} else {
@@ -1309,17 +1309,17 @@ static void bnx2x_calc_ieee_aneg_adv(struct link_params *params, u32 *ieee_fc)
 		       MDIO_COMBO_IEEE0_AUTO_NEG_ADV_PAUSE_ASYMMETRIC;
 		}
 		break;
-	case FLOW_CTRL_TX:
+	case BNX2X_FLOW_CTRL_TX:
 		*ieee_fc |=
 		       MDIO_COMBO_IEEE0_AUTO_NEG_ADV_PAUSE_ASYMMETRIC;
 		break;
 
-	case FLOW_CTRL_RX:
-	case FLOW_CTRL_BOTH:
+	case BNX2X_FLOW_CTRL_RX:
+	case BNX2X_FLOW_CTRL_BOTH:
 		*ieee_fc |= MDIO_COMBO_IEEE0_AUTO_NEG_ADV_PAUSE_BOTH;
 		break;
 
-	case FLOW_CTRL_NONE:
+	case BNX2X_FLOW_CTRL_NONE:
 	default:
 		*ieee_fc |= MDIO_COMBO_IEEE0_AUTO_NEG_ADV_PAUSE_NONE;
 		break;
@@ -1463,18 +1463,18 @@ static void bnx2x_pause_resolve(struct link_vars *vars, u32 pause_result)
 {						/*  LD	    LP	 */
 	switch (pause_result) { 		/* ASYM P ASYM P */
 	case 0xb:       			/*   1  0   1  1 */
-		vars->flow_ctrl = FLOW_CTRL_TX;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_TX;
 		break;
 
 	case 0xe:       			/*   1  1   1  0 */
-		vars->flow_ctrl = FLOW_CTRL_RX;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_RX;
 		break;
 
 	case 0x5:       			/*   0  1   0  1 */
 	case 0x7:       			/*   0  1   1  1 */
 	case 0xd:       			/*   1  1   0  1 */
 	case 0xf:       			/*   1  1   1  1 */
-		vars->flow_ctrl = FLOW_CTRL_BOTH;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_BOTH;
 		break;
 
 	default:
@@ -1531,7 +1531,7 @@ static u8 bnx2x_ext_phy_resove_fc(struct link_params *params,
 		DP(NETIF_MSG_LINK, "Ext PHY pause result 0x%x \n",
 		   pause_result);
 		bnx2x_pause_resolve(vars, pause_result);
-		if (vars->flow_ctrl == FLOW_CTRL_NONE &&
+		if (vars->flow_ctrl == BNX2X_FLOW_CTRL_NONE &&
 		     ext_phy_type == PORT_HW_CFG_XGXS_EXT_PHY_TYPE_BCM8073) {
 			bnx2x_cl45_read(bp, port,
 				      ext_phy_type,
@@ -1567,10 +1567,10 @@ static void bnx2x_flow_ctrl_resolve(struct link_params *params,
 	u16 lp_pause;   /* link partner */
 	u16 pause_result;
 
-	vars->flow_ctrl = FLOW_CTRL_NONE;
+	vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 
 	/* resolve from gp_status in case of AN complete and not sgmii */
-	if ((params->req_flow_ctrl == FLOW_CTRL_AUTO) &&
+	if ((params->req_flow_ctrl == BNX2X_FLOW_CTRL_AUTO) &&
 	    (gp_status & MDIO_AN_CL73_OR_37_COMPLETE) &&
 	    (!(vars->phy_flags & PHY_SGMII_FLAG)) &&
 	    (XGXS_EXT_PHY_TYPE(params->ext_phy_config) ==
@@ -1591,11 +1591,11 @@ static void bnx2x_flow_ctrl_resolve(struct link_params *params,
 				 MDIO_COMBO_IEEE0_AUTO_NEG_ADV_PAUSE_MASK)>>7;
 		DP(NETIF_MSG_LINK, "pause_result 0x%x\n", pause_result);
 		bnx2x_pause_resolve(vars, pause_result);
-	} else if ((params->req_flow_ctrl == FLOW_CTRL_AUTO) &&
+	} else if ((params->req_flow_ctrl == BNX2X_FLOW_CTRL_AUTO) &&
 		   (bnx2x_ext_phy_resove_fc(params, vars))) {
 		return;
 	} else {
-		if (params->req_flow_ctrl == FLOW_CTRL_AUTO)
+		if (params->req_flow_ctrl == BNX2X_FLOW_CTRL_AUTO)
 			vars->flow_ctrl = params->req_fc_auto_adv;
 		else
 			vars->flow_ctrl = params->req_flow_ctrl;
@@ -1728,11 +1728,11 @@ static u8 bnx2x_link_settings_status(struct link_params *params,
 				LINK_STATUS_PARALLEL_DETECTION_USED;
 
 		}
-		if (vars->flow_ctrl & FLOW_CTRL_TX)
+		if (vars->flow_ctrl & BNX2X_FLOW_CTRL_TX)
 			vars->link_status |=
 				LINK_STATUS_TX_FLOW_CONTROL_ENABLED;
 
-		if (vars->flow_ctrl & FLOW_CTRL_RX)
+		if (vars->flow_ctrl & BNX2X_FLOW_CTRL_RX)
 			vars->link_status |=
 				LINK_STATUS_RX_FLOW_CONTROL_ENABLED;
 
@@ -1742,7 +1742,7 @@ static u8 bnx2x_link_settings_status(struct link_params *params,
 		vars->phy_link_up = 0;
 
 		vars->duplex = DUPLEX_FULL;
-		vars->flow_ctrl = FLOW_CTRL_NONE;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 		vars->autoneg = AUTO_NEG_DISABLED;
 		vars->mac_type = MAC_TYPE_NONE;
 	}
@@ -3924,7 +3924,7 @@ u8 bnx2x_phy_init(struct link_params *params, struct link_vars *vars)
 	vars->link_up = 0;
 	vars->line_speed = 0;
 	vars->duplex = DUPLEX_FULL;
-	vars->flow_ctrl = FLOW_CTRL_NONE;
+	vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 	vars->mac_type = MAC_TYPE_NONE;
 
 	if (params->switch_cfg ==  SWITCH_CFG_1G)
@@ -3946,12 +3946,12 @@ u8 bnx2x_phy_init(struct link_params *params, struct link_vars *vars)
 		vars->link_up = 1;
 		vars->line_speed = SPEED_10000;
 		vars->duplex = DUPLEX_FULL;
-		vars->flow_ctrl = FLOW_CTRL_NONE;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 		vars->link_status = (LINK_STATUS_LINK_UP | LINK_10GTFD);
 		/* enable on E1.5 FPGA */
 		if (CHIP_IS_E1H(bp)) {
 			vars->flow_ctrl |=
-				(FLOW_CTRL_TX | FLOW_CTRL_RX);
+				(BNX2X_FLOW_CTRL_TX | BNX2X_FLOW_CTRL_RX);
 			vars->link_status |=
 					(LINK_STATUS_TX_FLOW_CONTROL_ENABLED |
 					 LINK_STATUS_RX_FLOW_CONTROL_ENABLED);
@@ -3974,7 +3974,7 @@ u8 bnx2x_phy_init(struct link_params *params, struct link_vars *vars)
 		vars->link_up = 1;
 		vars->line_speed = SPEED_10000;
 		vars->duplex = DUPLEX_FULL;
-		vars->flow_ctrl = FLOW_CTRL_NONE;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 		vars->link_status = (LINK_STATUS_LINK_UP | LINK_10GTFD);
 
 		bnx2x_bmac_enable(params, vars, 0);
@@ -3994,7 +3994,7 @@ u8 bnx2x_phy_init(struct link_params *params, struct link_vars *vars)
 		vars->link_up = 1;
 		vars->line_speed = SPEED_10000;
 		vars->duplex = DUPLEX_FULL;
-		vars->flow_ctrl = FLOW_CTRL_NONE;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 		vars->mac_type = MAC_TYPE_BMAC;
 
 		vars->phy_flags = PHY_XGXS_FLAG;
@@ -4009,7 +4009,7 @@ u8 bnx2x_phy_init(struct link_params *params, struct link_vars *vars)
 		vars->link_up = 1;
 		vars->line_speed = SPEED_1000;
 		vars->duplex = DUPLEX_FULL;
-		vars->flow_ctrl = FLOW_CTRL_NONE;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 		vars->mac_type = MAC_TYPE_EMAC;
 
 		vars->phy_flags = PHY_XGXS_FLAG;
@@ -4026,7 +4026,7 @@ u8 bnx2x_phy_init(struct link_params *params, struct link_vars *vars)
 		vars->link_up = 1;
 		vars->line_speed = SPEED_10000;
 		vars->duplex = DUPLEX_FULL;
-		vars->flow_ctrl = FLOW_CTRL_NONE;
+		vars->flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 
 		vars->phy_flags = PHY_XGXS_FLAG;
 
diff --git a/drivers/net/bnx2x_link.h b/drivers/net/bnx2x_link.h
index 86d54a1..47cb585 100644
--- a/drivers/net/bnx2x_link.h
+++ b/drivers/net/bnx2x_link.h
@@ -26,11 +26,11 @@
 
 
 
-#define FLOW_CTRL_AUTO		PORT_FEATURE_FLOW_CONTROL_AUTO
-#define FLOW_CTRL_TX		PORT_FEATURE_FLOW_CONTROL_TX
-#define FLOW_CTRL_RX		PORT_FEATURE_FLOW_CONTROL_RX
-#define FLOW_CTRL_BOTH		PORT_FEATURE_FLOW_CONTROL_BOTH
-#define FLOW_CTRL_NONE		PORT_FEATURE_FLOW_CONTROL_NONE
+#define BNX2X_FLOW_CTRL_AUTO		PORT_FEATURE_FLOW_CONTROL_AUTO
+#define BNX2X_FLOW_CTRL_TX		PORT_FEATURE_FLOW_CONTROL_TX
+#define BNX2X_FLOW_CTRL_RX		PORT_FEATURE_FLOW_CONTROL_RX
+#define BNX2X_FLOW_CTRL_BOTH		PORT_FEATURE_FLOW_CONTROL_BOTH
+#define BNX2X_FLOW_CTRL_NONE		PORT_FEATURE_FLOW_CONTROL_NONE
 
 #define SPEED_AUTO_NEG	    0
 #define SPEED_12000		12000
diff --git a/drivers/net/bnx2x_main.c b/drivers/net/bnx2x_main.c
index a9c4de0..24d2ae8 100644
--- a/drivers/net/bnx2x_main.c
+++ b/drivers/net/bnx2x_main.c
@@ -1921,10 +1921,10 @@ static void bnx2x_link_report(struct bnx2x *bp)
 		else
 			printk("half duplex");
 
-		if (bp->link_vars.flow_ctrl != FLOW_CTRL_NONE) {
-			if (bp->link_vars.flow_ctrl & FLOW_CTRL_RX) {
+		if (bp->link_vars.flow_ctrl != BNX2X_FLOW_CTRL_NONE) {
+			if (bp->link_vars.flow_ctrl & BNX2X_FLOW_CTRL_RX) {
 				printk(", receive ");
-				if (bp->link_vars.flow_ctrl & FLOW_CTRL_TX)
+				if (bp->link_vars.flow_ctrl & BNX2X_FLOW_CTRL_TX)
 					printk("& transmit ");
 			} else {
 				printk(", transmit ");
@@ -1948,11 +1948,11 @@ static u8 bnx2x_initial_phy_init(struct bnx2x *bp)
 		/* It is recommended to turn off RX FC for jumbo frames
 		   for better performance */
 		if (IS_E1HMF(bp))
-			bp->link_params.req_fc_auto_adv = FLOW_CTRL_BOTH;
+			bp->link_params.req_fc_auto_adv = BNX2X_FLOW_CTRL_BOTH;
 		else if (bp->dev->mtu > 5000)
-			bp->link_params.req_fc_auto_adv = FLOW_CTRL_TX;
+			bp->link_params.req_fc_auto_adv = BNX2X_FLOW_CTRL_TX;
 		else
-			bp->link_params.req_fc_auto_adv = FLOW_CTRL_BOTH;
+			bp->link_params.req_fc_auto_adv = BNX2X_FLOW_CTRL_BOTH;
 
 		bnx2x_acquire_phy_lock(bp);
 		rc = bnx2x_phy_init(&bp->link_params, &bp->link_vars);
@@ -7362,9 +7362,9 @@ static void __devinit bnx2x_link_settings_requested(struct bnx2x *bp)
 
 	bp->link_params.req_flow_ctrl = (bp->port.link_config &
 					 PORT_FEATURE_FLOW_CONTROL_MASK);
-	if ((bp->link_params.req_flow_ctrl == FLOW_CTRL_AUTO) &&
+	if ((bp->link_params.req_flow_ctrl == BNX2X_FLOW_CTRL_AUTO) &&
 	    !(bp->port.supported & SUPPORTED_Autoneg))
-		bp->link_params.req_flow_ctrl = FLOW_CTRL_NONE;
+		bp->link_params.req_flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 
 	BNX2X_DEV_INFO("req_line_speed %d  req_duplex %d  req_flow_ctrl 0x%x"
 		       "  advertising 0x%x\n",
@@ -8353,13 +8353,13 @@ static void bnx2x_get_pauseparam(struct net_device *dev,
 {
 	struct bnx2x *bp = netdev_priv(dev);
 
-	epause->autoneg = (bp->link_params.req_flow_ctrl == FLOW_CTRL_AUTO) &&
+	epause->autoneg = (bp->link_params.req_flow_ctrl == BNX2X_FLOW_CTRL_AUTO) &&
 			  (bp->link_params.req_line_speed == SPEED_AUTO_NEG);
 
-	epause->rx_pause = ((bp->link_vars.flow_ctrl & FLOW_CTRL_RX) ==
-			    FLOW_CTRL_RX);
-	epause->tx_pause = ((bp->link_vars.flow_ctrl & FLOW_CTRL_TX) ==
-			    FLOW_CTRL_TX);
+	epause->rx_pause = ((bp->link_vars.flow_ctrl & BNX2X_FLOW_CTRL_RX) ==
+			    BNX2X_FLOW_CTRL_RX);
+	epause->tx_pause = ((bp->link_vars.flow_ctrl & BNX2X_FLOW_CTRL_TX) ==
+			    BNX2X_FLOW_CTRL_TX);
 
 	DP(NETIF_MSG_LINK, "ethtool_pauseparam: cmd %d\n"
 	   DP_LEVEL "  autoneg %d  rx_pause %d  tx_pause %d\n",
@@ -8378,16 +8378,16 @@ static int bnx2x_set_pauseparam(struct net_device *dev,
 	   DP_LEVEL "  autoneg %d  rx_pause %d  tx_pause %d\n",
 	   epause->cmd, epause->autoneg, epause->rx_pause, epause->tx_pause);
 
-	bp->link_params.req_flow_ctrl = FLOW_CTRL_AUTO;
+	bp->link_params.req_flow_ctrl = BNX2X_FLOW_CTRL_AUTO;
 
 	if (epause->rx_pause)
-		bp->link_params.req_flow_ctrl |= FLOW_CTRL_RX;
+		bp->link_params.req_flow_ctrl |= BNX2X_FLOW_CTRL_RX;
 
 	if (epause->tx_pause)
-		bp->link_params.req_flow_ctrl |= FLOW_CTRL_TX;
+		bp->link_params.req_flow_ctrl |= BNX2X_FLOW_CTRL_TX;
 
-	if (bp->link_params.req_flow_ctrl == FLOW_CTRL_AUTO)
-		bp->link_params.req_flow_ctrl = FLOW_CTRL_NONE;
+	if (bp->link_params.req_flow_ctrl == BNX2X_FLOW_CTRL_AUTO)
+		bp->link_params.req_flow_ctrl = BNX2X_FLOW_CTRL_NONE;
 
 	if (epause->autoneg) {
 		if (!(bp->port.supported & SUPPORTED_Autoneg)) {
@@ -8396,7 +8396,7 @@ static int bnx2x_set_pauseparam(struct net_device *dev,
 		}
 
 		if (bp->link_params.req_line_speed == SPEED_AUTO_NEG)
-			bp->link_params.req_flow_ctrl = FLOW_CTRL_AUTO;
+			bp->link_params.req_flow_ctrl = BNX2X_FLOW_CTRL_AUTO;
 	}
 
 	DP(NETIF_MSG_LINK,
-- 
1.5.6.5
