From: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH] dnet: replace obsolete *netif_rx_* functions with *napi_*
Date: Fri, 13 Mar 2009 13:30:53 +0300
Message-ID: <1236940253-4944-1-git-send-email-yanok@emcraft.com>
References: <20090313131655.33117fb9.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ocean.emcraft.com ([213.221.7.182]:43951 "EHLO
	ocean.emcraft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752331AbZCMLjL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2009 07:39:11 -0400
In-Reply-To: <20090313131655.33117fb9.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: davem@davemloft.net, linux-next@vger.kernel.org, bhutchings@solarflare.com, Ilya Yanok <yanok@emcraft.com>

*netif_rx_* functions is obsolete and removed in newer kernels so
we need to use corresponding *napi_* functions instead.

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---

Here is a fix for the problem. Or should I post an updated cumulative patch?

Regards, Ilya.

---
 drivers/net/dnet.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dnet.c b/drivers/net/dnet.c
index dd7bf4e..35eaa17 100644
--- a/drivers/net/dnet.c
+++ b/drivers/net/dnet.c
@@ -441,7 +441,7 @@ static int dnet_poll(struct napi_struct *napi, int budget)
 		 * packets waiting
 		 */
 		if (!(dnet_readl(bp, RX_FIFO_WCNT) >> 16)) {
-			netif_rx_complete(napi);
+			napi_complete(napi);
 			int_enable = dnet_readl(bp, INTR_ENB);
 			int_enable |= DNET_INTR_SRC_RX_CMDFIFOAF;
 			dnet_writel(bp, int_enable, INTR_ENB);
@@ -480,7 +480,7 @@ static int dnet_poll(struct napi_struct *napi, int budget)
 	if (npackets < budget) {
 		/* We processed all packets available.  Tell NAPI it can
 		 * stop polling then re-enable rx interrupts */
-		netif_rx_complete(napi);
+		napi_complete(napi);
 		int_enable = dnet_readl(bp, INTR_ENB);
 		int_enable |= DNET_INTR_SRC_RX_CMDFIFOAF;
 		dnet_writel(bp, int_enable, INTR_ENB);
@@ -540,7 +540,7 @@ static irqreturn_t dnet_interrupt(int irq, void *dev_id)
 	}
 
 	if (int_current & DNET_INTR_SRC_RX_CMDFIFOAF) {
-		if (netif_rx_schedule_prep(&bp->napi)) {
+		if (napi_schedule_prep(&bp->napi)) {
 			/*
 			 * There's no point taking any more interrupts
 			 * until we have processed the buffers
@@ -549,7 +549,7 @@ static irqreturn_t dnet_interrupt(int irq, void *dev_id)
 			int_enable = dnet_readl(bp, INTR_ENB);
 			int_enable &= ~DNET_INTR_SRC_RX_CMDFIFOAF;
 			dnet_writel(bp, int_enable, INTR_ENB);
-			__netif_rx_schedule(&bp->napi);
+			__napi_schedule(&bp->napi);
 		}
 		handled = 1;
 	}
-- 
1.6.0.6
