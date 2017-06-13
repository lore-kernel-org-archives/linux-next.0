From: Galo Navarro <anglor@varoa.net>
Subject: [PATCH v2] staging: rtl8188eu: style fixes
Date: Tue, 13 Jun 2017 21:05:19 +0200
Message-ID: <20170613190518.GA2144@lear>
References: <20170602143643.GA9038@lear>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fnsib-smtp02.srv.cat ([46.16.60.193]:47858 "EHLO
        fnsib-smtp02.srv.cat" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752081AbdFMTFa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2017 15:05:30 -0400
Content-Disposition: inline
In-Reply-To: <20170602143643.GA9038@lear>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>

Fix multiple style issues (CHECK spaces preferred around that $thing).

Signed-off-by: Galo Navarro <anglor@varoa.net>
---
 drivers/staging/rtl8188eu/core/rtw_mlme.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index de9ab59..25b0452 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -370,14 +370,16 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 		sq_final = padapter->recvpriv.signal_qual;
 		/* the rssi value here is undecorated, and will be used for antenna diversity */
 		if (sq_smp != 101) /* from the right channel */
-			rssi_final = (src->Rssi+dst->Rssi*4)/5;
+			rssi_final = (src->Rssi + dst->Rssi * 4) / 5;
 		else
 			rssi_final = rssi_ori;
 	} else {
 		if (sq_smp != 101) { /* from the right channel */
-			ss_final = ((u32)(src->PhyInfo.SignalStrength)+(u32)(dst->PhyInfo.SignalStrength)*4)/5;
-			sq_final = ((u32)(src->PhyInfo.SignalQuality)+(u32)(dst->PhyInfo.SignalQuality)*4)/5;
-			rssi_final = (src->Rssi+dst->Rssi*4)/5;
+			ss_final = ((u32)(src->PhyInfo.SignalStrength) +
+				(u32)(dst->PhyInfo.SignalStrength) * 4) / 5;
+			sq_final = ((u32)(src->PhyInfo.SignalQuality) +
+				(u32)(dst->PhyInfo.SignalQuality) * 4) / 5;
+			rssi_final = (src->Rssi + dst->Rssi * 4) / 5;
 		} else {
 			/* bss info not receiving from the right channel, use the original RX signal infos */
 			ss_final = dst->PhyInfo.SignalStrength;
@@ -1926,7 +1928,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 		if (pqospriv->qos_option == 0) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, _VENDOR_SPECIFIC_IE_,
+			rtw_set_ie(out_ie + out_len, _VENDOR_SPECIFIC_IE_,
 				   _WMM_IE_Length_, WMM_IE, pout_len);
 
 			pqospriv->qos_option = 1;
@@ -1964,10 +1966,10 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 		phtpriv->ht_option = true;
 
-		p = rtw_get_ie(in_ie+12, _HT_ADD_INFO_IE_, &ielen, in_len-12);
+		p = rtw_get_ie(in_ie + 12, _HT_ADD_INFO_IE_, &ielen, in_len - 12);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, _HT_ADD_INFO_IE_, ielen, p+2, pout_len);
+			rtw_set_ie(out_ie + out_len, _HT_ADD_INFO_IE_, ielen, p + 2, pout_len);
 		}
 	}
 	return phtpriv->ht_option;
@@ -2058,8 +2060,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	phtpriv = &psta->htpriv;
 
 	if ((phtpriv->ht_option) && (phtpriv->ampdu_enable)) {
-		issued = (phtpriv->agg_enable_bitmap>>priority)&0x1;
-		issued |= (phtpriv->candidate_tid_bitmap>>priority)&0x1;
+		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
+		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
 
 		if (issued == 0) {
 			DBG_88E("rtw_issue_addbareq_cmd, p=%d\n", priority);
-- 
2.1.4
