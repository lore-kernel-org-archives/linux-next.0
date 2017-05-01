From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Mon, 1 May 2017 14:42:18 +1000
Message-ID: <20170501144218.4f794945@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41809 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1949247AbdEAEmV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 May 2017 00:42:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Avraham Stern <avraham.stern@intel.com>, Luca Coelho <luciano.coelho@intel.com>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_indicate_connect':
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:552:6: error: passing argument 2 of 'cfg80211_roamed' from incompatible pointer type [-Werror=incompatible-pointer-types]
    , notify_channel
      ^
In file included from drivers/staging/rtl8723bs/include/osdep_service_linux.h:50:0,
                 from drivers/staging/rtl8723bs/include/osdep_service.h:23,
                 from drivers/staging/rtl8723bs/include/drv_types.h:29,
                 from drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:17:
include/net/cfg80211.h:5435:6: note: expected 'struct cfg80211_roam_info *' but argument is of type 'struct ieee80211_channel *'
 void cfg80211_roamed(struct net_device *dev, struct cfg80211_roam_info *info,
      ^
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:553:6: warning: passing argument 3 of 'cfg80211_roamed' makes integer from pointer without a cast [-Wint-conversion]
    , cur_network->network.MacAddress
      ^
In file included from drivers/staging/rtl8723bs/include/osdep_service_linux.h:50:0,
                 from drivers/staging/rtl8723bs/include/osdep_service.h:23,
                 from drivers/staging/rtl8723bs/include/drv_types.h:29,
                 from drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:17:
include/net/cfg80211.h:5435:6: note: expected 'gfp_t {aka unsigned int}' but argument is of type 'unsigned char *'
 void cfg80211_roamed(struct net_device *dev, struct cfg80211_roam_info *info,
      ^
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:551:3: error: too many arguments to function 'cfg80211_roamed'
   cfg80211_roamed(padapter->pnetdev
   ^
In file included from drivers/staging/rtl8723bs/include/osdep_service_linux.h:50:0,
                 from drivers/staging/rtl8723bs/include/osdep_service.h:23,
                 from drivers/staging/rtl8723bs/include/drv_types.h:29,
                 from drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:17:
include/net/cfg80211.h:5435:6: note: declared here
 void cfg80211_roamed(struct net_device *dev, struct cfg80211_roam_info *info,
      ^

Caused by commit

  554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

interacting with commit

  29ce6ecbb83c ("cfg80211: unify cfg80211_roamed() and cfg80211_roamed_bss()")

from the mac80211-next tree.

I applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 May 2017 14:34:17 +1000
Subject: [PATCH] staging: rtl8723bs: fix up for cfg80211_roamed() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index f092a72bffda..5e7a61f24f8d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -542,20 +542,24 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		struct ieee80211_channel *notify_channel;
 		u32 freq;
 		u16 channel = cur_network->network.Configuration.DSConfig;
+		struct cfg80211_roam_info roam_info = {};
 
 		freq = rtw_ieee80211_channel_to_frequency(channel, NL80211_BAND_2GHZ);
 
 		notify_channel = ieee80211_get_channel(wiphy, freq);
 
 		DBG_871X(FUNC_ADPT_FMT" call cfg80211_roamed\n", FUNC_ADPT_ARG(padapter));
-		cfg80211_roamed(padapter->pnetdev
-			, notify_channel
-			, cur_network->network.MacAddress
-			, pmlmepriv->assoc_req+sizeof(struct ieee80211_hdr_3addr)+2
-			, pmlmepriv->assoc_req_len-sizeof(struct ieee80211_hdr_3addr)-2
-			, pmlmepriv->assoc_rsp+sizeof(struct ieee80211_hdr_3addr)+6
-			, pmlmepriv->assoc_rsp_len-sizeof(struct ieee80211_hdr_3addr)-6
-			, GFP_ATOMIC);
+		roam_info.channel = notify_channel;
+		roam_info.bssid = cur_network->network.MacAddress;
+		roam_info.req_ie =
+			pmlmepriv->assoc_req+sizeof(struct ieee80211_hdr_3addr)+2;
+		roam_info.req_ie_len =
+			pmlmepriv->assoc_req_len-sizeof(struct ieee80211_hdr_3addr)-2;
+		roam_info.resp_ie =
+			pmlmepriv->assoc_rsp+sizeof(struct ieee80211_hdr_3addr)+6;
+		roam_info.resp_ie_len =
+			pmlmepriv->assoc_rsp_len-sizeof(struct ieee80211_hdr_3addr)-6;
+		cfg80211_roamed(padapter->pnetdev, &roam_info, GFP_ATOMIC);
 	}
 	else
 	{
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
