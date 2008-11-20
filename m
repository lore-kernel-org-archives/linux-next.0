From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Thu, 20 Nov 2008 13:58:17 +1100
Message-ID: <20081120135817.0b23749f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42905 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751026AbYKTC62 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 21:58:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, "Zhu, Yi" <yi.zhu@intel.com>, "John W. Linville" <linville@tuxdriver.com>, Reinette Chatre <reinette.chatre@intel.com>, Johannes Berg <johannes@sipsolutions.net>

Hi Dave,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/wireless/iwlwifi/iwl3945-base.c: In function 'iwl3945_bg_set_monitor':
drivers/net/wireless/iwlwifi/iwl3945-base.c:6001: error: implicit declaration of function 'ieee80211_notify_mac'
drivers/net/wireless/iwlwifi/iwl3945-base.c:6001: error: 'IEEE80211_NOTIFY_RE_ASSOC' undeclared (first use in this function)
drivers/net/wireless/iwlwifi/iwl-agn.c: In function 'iwl_bg_set_monitor':
drivers/net/wireless/iwlwifi/iwl-agn.c:2392: error: implicit declaration of function 'ieee80211_notify_mac'
drivers/net/wireless/iwlwifi/iwl-agn.c:2392: error: 'IEEE80211_NOTIFY_RE_ASSOC' undeclared (first use in this function)

Another bad interaction, this time between commit
8e3bad65a59915f2ddc40f62a180ad81695d8440 "mac80211: remove
ieee80211_notify_mac" from the wireless-current tree and commit
60294de3af99586bb4a205274d02a7c8b910c0c3 "iwlwifi: fix priv->iw_mode
setting when multiple vif are configured" from the net tree.

I added the following (which may not be correct) to fix the merge but
assume it will be fixed in the net tree soon.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/drivers/net/wireless/iwlwifi/iwl3945-base.c b/drivers/net/wireless/iwlwifi/iwl3945-base.c
--- a/drivers/net/wireless/iwlwifi/iwl3945-base.c
+++ b/drivers/net/wireless/iwlwifi/iwl3945-base.c
@@ -5998,7 +5998,6 @@ static void iwl3945_bg_set_monitor(struct work_struct *work)
 			IWL_ERROR("iwl3945_set_mode() failed\n");
 
 	mutex_unlock(&priv->mutex);
-	ieee80211_notify_mac(priv->hw, IEEE80211_NOTIFY_RE_ASSOC);
 }
 
 #define IWL_SCAN_CHECK_WATCHDOG (7 * HZ)
diff --git a/drivers/net/wireless/iwlwifi/iwl-agn.c b/drivers/net/wireless/iwlwifi/iwl-agn.c
--- a/drivers/net/wireless/iwlwifi/iwl-agn.c
+++ b/drivers/net/wireless/iwlwifi/iwl-agn.c
@@ -2389,7 +2389,6 @@ static void iwl_bg_set_monitor(struct work_struct *work)
 	}
 
 	mutex_unlock(&priv->mutex);
-	ieee80211_notify_mac(priv->hw, IEEE80211_NOTIFY_RE_ASSOC);
 }
 
 static void iwl_bg_run_time_calib_work(struct work_struct *work)
