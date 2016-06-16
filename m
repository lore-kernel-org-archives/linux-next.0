From: Prasun Maiti <prasunmaiti87@gmail.com>
Subject: [PATCH] mwifiex: Fixed endianness for event TLV type TLV_BTCOEX_WL_SCANTIME
Date: Thu, 16 Jun 2016 09:49:30 +0530
Message-ID: <1466050770-21789-1-git-send-email-prasunmaiti87@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>
Cc: Linux Wireless <linux-wireless@vger.kernel.org>, Linux Next <linux-next@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

The two members min_scan_time and max_scan_time of structure
"mwifiex_ie_types_btcoex_scan_time" are of two bytes each. The values
are assigned directtly from firmware without endian conversion handling.
So, wrong datas will get saved in big-endian systems.

This patch converts the values into cpu's byte order before assigning them
into the local members.

Signed-off-by: Prasun Maiti <prasunmaiti87@gmail.com>
---
 drivers/net/wireless/marvell/mwifiex/sta_event.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/sta_event.c b/drivers/net/wireless/marvell/mwifiex/sta_event.c
index 0104108..7dff452 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_event.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_event.c
@@ -474,8 +474,8 @@ void mwifiex_bt_coex_wlan_param_update_event(struct mwifiex_private *priv,
 			scantlv =
 			    (struct mwifiex_ie_types_btcoex_scan_time *)tlv;
 			adapter->coex_scan = scantlv->coex_scan;
-			adapter->coex_min_scan_time = scantlv->min_scan_time;
-			adapter->coex_max_scan_time = scantlv->max_scan_time;
+			adapter->coex_min_scan_time = le16_to_cpu(scantlv->min_scan_time);
+			adapter->coex_max_scan_time = le16_to_cpu(scantlv->max_scan_time);
 			break;
 
 		default:
-- 
1.9.1
