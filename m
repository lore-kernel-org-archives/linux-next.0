From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net/wireless/wireless-current tree build warning
Date: Tue, 1 Dec 2009 13:35:24 +1100
Message-ID: <20091201133524.32756cef.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44737 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752243AbZLACfX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Nov 2009 21:35:23 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "David S. Miller" <davem@davemloft.net>

Hi John,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/net/wireless/iwlwifi/iwl-tx.c: In function 'iwl_tx_agg_stop':
drivers/net/wireless/iwlwifi/iwl-tx.c:1356: warning: passing argument 1 of 'ieee80211_stop_tx_ba_cb_irqsafe' from incompatible pointer type
include/net/mac80211.h:2128: note: expected 'struct ieee80211_vif *' but argument is of type 'struct ieee80211_hw *'

Introduced by a bad merge (mine) between commit
827d42c9ac91ddd728e4f4a31fefb906ef2ceff7 ("mac80211: fix spurious delBA
handling") form the wireless-current tree and commit
c951ad3550ab40071bb0f222ba6125845769c08a ("mac80211: convert aggregation
to operate on vifs/stas") from the net/wireless trees.  I didn't notice
that the former had added a call to the function modified in the latter.

I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 1 Dec 2009 13:19:44 +1100
Subject: [PATCH] wireless: fix for mismerge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/iwlwifi/iwl-tx.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/iwlwifi/iwl-tx.c b/drivers/net/wireless/iwlwifi/iwl-tx.c
index 58b132f..00da5e1 100644
--- a/drivers/net/wireless/iwlwifi/iwl-tx.c
+++ b/drivers/net/wireless/iwlwifi/iwl-tx.c
@@ -1353,7 +1353,7 @@ int iwl_tx_agg_stop(struct iwl_priv *priv , const u8 *ra, u16 tid)
 	if (priv->stations[sta_id].tid[tid].agg.state ==
 				IWL_EMPTYING_HW_QUEUE_ADDBA) {
 		IWL_DEBUG_HT(priv, "AGG stop before setup done\n");
-		ieee80211_stop_tx_ba_cb_irqsafe(priv->hw, ra, tid);
+		ieee80211_stop_tx_ba_cb_irqsafe(priv->vif, ra, tid);
 		priv->stations[sta_id].tid[tid].agg.state = IWL_AGG_OFF;
 		return 0;
 	}
-- 
1.6.5.3

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
