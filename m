From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: [PATCH -next] wireless: brcmfmac: fix printk format warning
Date: Thu, 01 Nov 2012 10:43:26 -0700
Message-ID: <5092B4BE.4080803@infradead.org>
References: <20121101163622.129b59967d2ee76e6946874a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121101163622.129b59967d2ee76e6946874a-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

Fix printk format warning for ssid_len, which is a size_t:

drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:3941:2: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'

Signed-off-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc:	brcm80211-dev-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
---
 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20121101.orig/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
+++ linux-next-20121101/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
@@ -3938,7 +3938,7 @@ brcmf_cfg80211_start_ap(struct wiphy *wi
 	WL_TRACE("channel_type=%d, beacon_interval=%d, dtim_period=%d,\n",
 		 settings->channel_type, settings->beacon_interval,
 		 settings->dtim_period);
-	WL_TRACE("ssid=%s(%d), auth_type=%d, inactivity_timeout=%d\n",
+	WL_TRACE("ssid=%s(%zu), auth_type=%d, inactivity_timeout=%d\n",
 		 settings->ssid, settings->ssid_len, settings->auth_type,
 		 settings->inactivity_timeout);
 
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
