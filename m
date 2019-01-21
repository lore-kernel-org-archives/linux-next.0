From: Sinan Kaya <okaya@kernel.org>
Subject: [for next][PATCH] iwlwifi: Fix unmet dependency error for IWLWIFI_LEDS
Date: Mon, 21 Jan 2019 23:31:02 +0000
Message-ID: <20190121233102.13705-1-okaya@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org
Cc: Sinan Kaya <okaya@kernel.org>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, "open list:INTEL WIRELESS WIFI LINK
        iwlwifi" <linux-wireless@vger.kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

There is an unresolved dependency as follows:

IWLWIFI_LEDS selects MAC80211_LEDS.
MAC80211_LEDS depends on MAC80211.

It is possible to choose MAC80211_LEDS (y) but not choose MAC80211 (n)

WARNING: unmet direct dependencies detected for MAC80211_LEDS
  Depends on [n]: NET [=y] && WIRELESS [=y] && MAC80211 [=n] && LEDS_CLASS [=y]
  Selected by [y]:
  - IWLWIFI_LEDS [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_INTEL [=y] && IWLWIFI [=y] && (LEDS_CLASS [=y]=y || LEDS_CLASS [=y]=IWLWIFI [=y])

Move the MAC80211 dependency into IWLWIFI_LEDS so that we avoid this
configuration.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 drivers/net/wireless/intel/iwlwifi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/Kconfig b/drivers/net/wireless/intel/iwlwifi/Kconfig
index 491ca3c8b43c..74f0d0bbed34 100644
--- a/drivers/net/wireless/intel/iwlwifi/Kconfig
+++ b/drivers/net/wireless/intel/iwlwifi/Kconfig
@@ -46,7 +46,7 @@ if IWLWIFI
 
 config IWLWIFI_LEDS
 	bool
-	depends on LEDS_CLASS=y || LEDS_CLASS=IWLWIFI
+	depends on MAC80211 && (LEDS_CLASS=y || LEDS_CLASS=IWLWIFI)
 	select LEDS_TRIGGERS
 	select MAC80211_LEDS
 	default y
-- 
2.19.0
