From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the  tree
Date: Thu, 21 May 2009 14:06:10 +1000
Message-ID: <20090521140610.551574fc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34160 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750715AbZEUEGS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 21 May 2009 00:06:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Abhijeet Kolekar <abhijeet.kolekar@intel.com>, "John W. Linville" <linville@tuxdriver.com>, Reinette Chatre <reinette.chatre@intel.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-agn.c
drivers/net/wireless/iwlwifi/iwl3945-base.c between commit
fbc9f97bbf5e1eaee562eba93dc60faaff3f3bfa ("iwlwifi: do not cancel delayed
work inside spin_lock_irqsave") from the wireless-current tree and commit
727882d62477ed45d248e8cd6d53cf794537b073 ("iwl3945: use iwl_set_mode in
3945") from the net tree.

I removed iwl{3945,}_set_mode() from and applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --git a/drivers/net/wireless/iwlwifi/iwl-core.c b/drivers/net/wireless/iwlwifi/iwl-core.c
index 5393fb3..967343a 100644
--- a/drivers/net/wireless/iwlwifi/iwl-core.c
+++ b/drivers/net/wireless/iwlwifi/iwl-core.c
@@ -2437,13 +2437,6 @@ int iwl_set_mode(struct iwl_priv *priv, int mode)
 	if (!iwl_is_ready_rf(priv))
 		return -EAGAIN;
 
-	cancel_delayed_work(&priv->scan_check);
-	if (iwl_scan_cancel_timeout(priv, 100)) {
-		IWL_WARN(priv, "Aborted scan still in progress after 100ms\n");
-		IWL_DEBUG_MAC80211(priv, "leaving - scan abort failed.\n");
-		return -EAGAIN;
-	}
-
 	iwlcore_commit_rxon(priv);
 
 	return 0;
