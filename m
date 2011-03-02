From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/brcm80211: fix printk format warnings
Date: Tue, 1 Mar 2011 16:29:48 -0800
Message-ID: <20110301162948.34c28d6e.randy.dunlap@oracle.com>
References: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:59147 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756266Ab1CBAbJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2011 19:31:09 -0500
In-Reply-To: <20110301181119.f1c7a9c3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c:1379: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
drivers/staging/brcm80211/sys/wl_mac80211.c:1827: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'
drivers/staging/brcm80211/sys/wl_mac80211.c:1832: warning: format '%d' expects type 'int', but argument 3 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c |    2 +-
 drivers/staging/brcm80211/sys/wl_mac80211.c      |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20110301.orig/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
+++ linux-next-20110301/drivers/staging/brcm80211/brcmfmac/wl_cfg80211.c
@@ -1376,7 +1376,7 @@ wl_cfg80211_connect(struct wiphy *wiphy,
 	memcpy(&join_params.params.bssid, &ether_bcast, ETH_ALEN);
 
 	wl_ch_to_chanspec(wl->channel, &join_params, &join_params_size);
-	WL_DBG("join_param_size %d\n", join_params_size);
+	WL_DBG("join_param_size %zd\n", join_params_size);
 
 	if (join_params.ssid.SSID_len < IEEE80211_MAX_SSID_LEN) {
 		WL_DBG("ssid \"%s\", len (%d)\n",
--- linux-next-20110301.orig/drivers/staging/brcm80211/sys/wl_mac80211.c
+++ linux-next-20110301/drivers/staging/brcm80211/sys/wl_mac80211.c
@@ -1824,12 +1824,12 @@ int wl_check_firmwares(struct wl_info *w
 			WL_ERROR("%s: invalid bin/hdr fw\n", __func__);
 			rc = -EBADF;
 		} else if (fw_hdr->size % sizeof(struct wl_fw_hdr)) {
-			WL_ERROR("%s: non integral fw hdr file size %d/%zu\n",
+			WL_ERROR("%s: non integral fw hdr file size %zd/%zu\n",
 				 __func__, fw_hdr->size,
 				 sizeof(struct wl_fw_hdr));
 			rc = -EBADF;
 		} else if (fw->size < MIN_FW_SIZE || fw->size > MAX_FW_SIZE) {
-			WL_ERROR("%s: out of bounds fw file size %d\n",
+			WL_ERROR("%s: out of bounds fw file size %zd\n",
 				 __func__, fw->size);
 			rc = -EBADF;
 		} else {
