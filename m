From: Luciano Coelho <luciano.coelho@nokia.com>
Subject: [PATCH -next] wl1271: use __packed annotation
Date: Fri,  9 Jul 2010 14:10:58 +0300
Message-ID: <1278673858-17993-1-git-send-email-luciano.coelho@nokia.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:19434 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753849Ab0GILLt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2010 07:11:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <eric.dumazet@gmail.com>, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, Stephen Rothwell <sfr@canb.auug.org.au>

This patch changes __attribute__ ((packed)) annotations to __packed in wl1271
code that was introduced in a recent patch in wireless-testing.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Luciano Coelho <luciano.coelho@nokia.com>
---
 drivers/net/wireless/wl12xx/wl1271_acx.h  |    2 +-
 drivers/net/wireless/wl12xx/wl1271_scan.h |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/wl12xx/wl1271_acx.h b/drivers/net/wireless/wl12xx/wl1271_acx.h
index 8323360..4235bc5 100644
--- a/drivers/net/wireless/wl12xx/wl1271_acx.h
+++ b/drivers/net/wireless/wl12xx/wl1271_acx.h
@@ -1002,7 +1002,7 @@ struct wl1271_acx_fw_tsf_information {
 	__le32 last_tbtt_low;
 	u8 last_dtim_count;
 	u8 padding[3];
-} __attribute__ ((packed));
+} __packed;
 
 enum {
 	ACX_WAKE_UP_CONDITIONS      = 0x0002,
diff --git a/drivers/net/wireless/wl12xx/wl1271_scan.h b/drivers/net/wireless/wl12xx/wl1271_scan.h
index b0e36e3..f181570 100644
--- a/drivers/net/wireless/wl12xx/wl1271_scan.h
+++ b/drivers/net/wireless/wl12xx/wl1271_scan.h
@@ -76,7 +76,7 @@ struct basic_scan_params {
 	u8 use_ssid_list;
 	u8 scan_tag;
 	u8 padding2;
-} __attribute__ ((packed));
+} __packed;
 
 struct basic_scan_channel_params {
 	/* Duration in TU to wait for frames on a channel for active scan */
@@ -91,19 +91,19 @@ struct basic_scan_channel_params {
 	u8 dfs_candidate;
 	u8 activity_detected;
 	u8 pad;
-} __attribute__ ((packed));
+} __packed;
 
 struct wl1271_cmd_scan {
 	struct wl1271_cmd_header header;
 
 	struct basic_scan_params params;
 	struct basic_scan_channel_params channels[WL1271_SCAN_MAX_CHANNELS];
-} __attribute__ ((packed));
+} __packed;
 
 struct wl1271_cmd_trigger_scan_to {
 	struct wl1271_cmd_header header;
 
 	__le32 timeout;
-} __attribute__ ((packed));
+} __packed;
 
 #endif /* __WL1271_SCAN_H__ */
-- 
1.6.3.3
