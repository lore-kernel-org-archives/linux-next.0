From: Galo Navarro <anglor@varoa.net>
Subject: [PATCH v3] staging: rtl8188eu: style fixes
Date: Sat, 24 Jun 2017 20:32:55 +0200
Message-ID: <20170624183255.GA21826@lear>
References: <20170602143643.GA9038@lear>
 <20170613190518.GA2144@lear>
 <20170614102620.GC8485@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fnsib-smtp01.srv.cat ([46.16.60.187]:49444 "EHLO
        fnsib-smtp01.srv.cat" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751081AbdFXSdJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 24 Jun 2017 14:33:09 -0400
Content-Disposition: inline
In-Reply-To: <20170614102620.GC8485@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

Fix multiple style issues (CHECK spaces preferred around that $operator).

Signed-off-by: Galo Navarro <anglor@varoa.net>

---
 drivers/staging/rtl8188eu/core/rtw_mlme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index de9ab59..fde3060 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -370,7 +370,7 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 		sq_final = padapter->recvpriv.signal_qual;
 		/* the rssi value here is undecorated, and will be used for antenna diversity */
 		if (sq_smp != 101) /* from the right channel */
-			rssi_final = (src->Rssi+dst->Rssi*4)/5;
+			rssi_final = (src->Rssi + dst->Rssi * 4) / 5;
 		else
 			rssi_final = rssi_ori;
 	} else {
@@ -1926,7 +1926,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 		if (pqospriv->qos_option == 0) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, _VENDOR_SPECIFIC_IE_,
+			rtw_set_ie(out_ie + out_len, _VENDOR_SPECIFIC_IE_,
 				   _WMM_IE_Length_, WMM_IE, pout_len);
 
 			pqospriv->qos_option = 1;
@@ -2058,8 +2058,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
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
