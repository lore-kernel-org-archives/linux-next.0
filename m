From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] Staging: agnx: switch config_interface to bss_info_changed
Date: Tue, 12 May 2009 15:23:13 +0400
Message-ID: <1242127393-4298-1-git-send-email-a.beregalov@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.237]:36168 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759218AbZELLXY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2009 07:23:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: gregkh@suse.de
Cc: johannes@sipsolutions.net, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>

Fix this build error:
drivers/staging/agnx/pci.c: In function 'agnx_config_interface':
drivers/staging/agnx/pci.c:315: error: dereferencing pointer to incomplete type
..
drivers/staging/agnx/pci.c:424: error: unknown field 'config_interface' specified in initializer

config_interface was removed in 2d0ddec5b2b
("mac80211: unify config_interface and bss_info_changed")

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---
 drivers/staging/agnx/pci.c |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/agnx/pci.c b/drivers/staging/agnx/pci.c
index 61b15fa..0df7d43 100644
--- a/drivers/staging/agnx/pci.c
+++ b/drivers/staging/agnx/pci.c
@@ -302,14 +302,18 @@ static int agnx_config(struct ieee80211_hw *dev, u32 changed)
 	return 0;
 }
 
-static int agnx_config_interface(struct ieee80211_hw *dev,
-				 struct ieee80211_vif *vif,
-				 struct ieee80211_if_conf *conf)
+static void agnx_bss_info_changed(struct ieee80211_hw *dev,
+				  struct ieee80211_vif *vif,
+				  struct ieee80211_bss_conf *conf,
+				  u32 changed)
 {
 	struct agnx_priv *priv = dev->priv;
 	void __iomem *ctl = priv->ctl;
 	AGNX_TRACE;
 
+	if (!(changed & BSS_CHANGED_BSSID))
+		return;
+
 	spin_lock(&priv->lock);
 
 	if (memcmp(conf->bssid, priv->bssid, ETH_ALEN)) {
@@ -322,8 +326,7 @@ static int agnx_config_interface(struct ieee80211_hw *dev,
 		agnx_write32(ctl, AGNX_BM_MTSM, 0xff & ~0x1);
 	}
 	spin_unlock(&priv->lock);
-	return 0;
-} /* agnx_config_interface */
+} /* agnx_bss_info_changed */
 
 
 static void agnx_configure_filter(struct ieee80211_hw *dev,
@@ -421,7 +424,7 @@ static struct ieee80211_ops agnx_ops = {
 	.add_interface		= agnx_add_interface,
 	.remove_interface	= agnx_remove_interface,
 	.config			= agnx_config,
-	.config_interface	= agnx_config_interface,
+	.bss_info_changed	= agnx_bss_info_changed,
 	.configure_filter	= agnx_configure_filter,
 	.get_stats		= agnx_get_stats,
 	.get_tx_stats		= agnx_get_tx_stats,
-- 
1.6.3
