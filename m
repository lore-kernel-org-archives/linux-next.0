From: Galo <anglor@varoa.net>
Subject: [PATCH v2] staging: rtl8188eu: style fixes
Date: Sun, 23 Apr 2017 21:03:06 +0200
Message-ID: <20170423190305.GB7641@lear>
References: <20170420214226.GB1347@lear>
 <20170421042156.GA11495@kroah.com>
 <20170421080623.GA2553@lear>
 <20170421081849.GA20003@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fnsib-smtp03.srv.cat ([46.16.60.200]:50689 "EHLO
        fnsib-smtp03.srv.cat" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163247AbdDWTDR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 23 Apr 2017 15:03:17 -0400
Content-Disposition: inline
In-Reply-To: <20170421081849.GA20003@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>

Fix multiple CHECK and WARNING issues in rtl8188eu/core/rtw_mlme.c,
mainly long lines, spaces around operators, unnecessary curly brackets.

Signed-off-by: Galo Navarro <anglor@varoa.net>

---
 drivers/staging/rtl8188eu/core/rtw_mlme.c | 186 +++++++++++++++++-------------
 1 file changed, 103 insertions(+), 83 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme.c b/drivers/staging/rtl8188eu/core/rtw_mlme.c
index 301085a..e5bb2f2 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme.c
@@ -38,7 +38,9 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 	struct mlme_priv		*pmlmepriv = &padapter->mlmepriv;
 	int	res = _SUCCESS;
 
-	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
+	/*  We don't need to memset padapter->XXX to zero, because adapter is
+	 *  allocated by vzalloc().
+	 */
 
 	pmlmepriv->nic_hdl = (u8 *)padapter;
 
@@ -209,7 +211,6 @@ struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 	return pnetwork;
 }
 
-
 void rtw_free_network_queue(struct adapter *padapter, u8 isfreeall)
 {
 	struct list_head *phead, *plist;
@@ -265,7 +266,6 @@ u8 *rtw_get_capability_from_ie(u8 *ie)
 	return ie + 8 + 2;
 }
 
-
 u16 rtw_get_capability(struct wlan_bssid_ex *bss)
 {
 	__le16	val;
@@ -353,7 +353,7 @@ struct	wlan_network	*rtw_get_oldest_wlan_network(struct __queue *scanned_queue)
 }
 
 void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
-	struct adapter *padapter, bool update_ie)
+		    struct adapter *padapter, bool update_ie)
 {
 	long rssi_ori = dst->Rssi;
 	u8 sq_smp = src->PhyInfo.SignalQuality;
@@ -524,7 +524,9 @@ static int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *
 	privacy = pnetwork->network.Privacy;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		if (rtw_get_wps_ie(pnetwork->network.IEs+_FIXED_IE_LENGTH_, pnetwork->network.IELength-_FIXED_IE_LENGTH_, NULL, &wps_ielen))
+		if (rtw_get_wps_ie(pnetwork->network.IEs + _FIXED_IE_LENGTH_,
+				   pnetwork->network.IELength - _FIXED_IE_LENGTH_,
+				   NULL, &wps_ielen))
 			return true;
 		else
 			return false;
@@ -534,7 +536,6 @@ static int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *
 			bselected = false;
 	}
 
-
 	if ((desired_encmode != Ndis802_11EncryptionDisabled) && (privacy == 0)) {
 		DBG_88E("desired_encmode: %d, privacy: %d\n", desired_encmode, privacy);
 		bselected = false;
@@ -598,7 +599,6 @@ void rtw_survey_event_callback(struct adapter	*adapter, u8 *pbuf)
 exit:
 
 	spin_unlock_bh(&pmlmepriv->lock);
-	return;
 }
 
 void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
@@ -660,7 +660,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			s_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 			if (s_ret == _SUCCESS) {
 				mod_timer(&pmlmepriv->assoc_timer,
-					jiffies + msecs_to_jiffies(MAX_JOIN_TIMEOUT));
+					  jiffies + msecs_to_jiffies(MAX_JOIN_TIMEOUT));
 			} else if (s_ret == 2) { /* there is no need to wait for join */
 				_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 				rtw_indicate_connect(adapter);
@@ -770,7 +770,6 @@ void rtw_free_assoc_resources_locked(struct adapter *adapter)
 		rtw_init_bcmc_stainfo(adapter);
 	}
 
-
 	pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.MacAddress);
 	if (pwlan)
 		pwlan->fixed = false;
@@ -857,7 +856,8 @@ void rtw_scan_abort(struct adapter *adapter)
 	}
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
 		if (!adapter->bDriverStopped && !adapter->bSurpriseRemoved)
-			DBG_88E(FUNC_NDEV_FMT"waiting for scan_abort time out!\n", FUNC_NDEV_ARG(adapter->pnetdev));
+			DBG_88E(FUNC_NDEV_FMT"waiting for scan_abort time out!\n",
+				FUNC_NDEV_ARG(adapter->pnetdev));
 		rtw_indicate_scan_done(adapter, true);
 	}
 	pmlmeext->scan_abort = false;
@@ -897,7 +897,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		 * Commented by Albert 2012/07/21
 		 * When doing the WPS, the wps_ie_len won't equal to 0
 		 * And the Wi-Fi driver shouldn't allow the data
-		 * packet to be tramsmitted.
+		 * packet to be transmitted.
 		 */
 		if (padapter->securitypriv.wps_ie_len != 0) {
 			psta->ieee8021x_blocked = true;
@@ -944,7 +944,6 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 		 ("\nfw_state:%x, BSSID:%pM\n",
 		 get_fwstate(pmlmepriv), pnetwork->network.MacAddress));
 
-
 	/*  why not use ptarget_wlan?? */
 	memcpy(&cur_network->network, &pnetwork->network, pnetwork->network.Length);
 	/*  some IEs in pnetwork is wrong, so we should use ptarget_wlan IEs */
@@ -963,8 +962,8 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 	/* update fw_state will clr _FW_UNDER_LINKING here indirectly */
 	switch (pnetwork->network.InfrastructureMode) {
 	case Ndis802_11Infrastructure:
-		if (pmlmepriv->fw_state&WIFI_UNDER_WPS)
-			pmlmepriv->fw_state = WIFI_STATION_STATE|WIFI_UNDER_WPS;
+		if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
+			pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
 		else
 			pmlmepriv->fw_state = WIFI_STATION_STATE;
 		break;
@@ -1136,14 +1135,14 @@ static u8 search_max_mac_id(struct adapter *padapter)
 #if defined(CONFIG_88EU_AP_MODE)
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		for (aid = (pstapriv->max_num_sta); aid > 0; aid--) {
-			if (pstapriv->sta_aid[aid-1])
+			if (pstapriv->sta_aid[aid - 1])
 				break;
 		}
 		mac_id = aid + 1;
 	} else
 #endif
 	{/* adhoc  id =  31~2 */
-		for (mac_id = (NUM_STA-1); mac_id >= IBSS_START_MAC_ID; mac_id--) {
+		for (mac_id = (NUM_STA - 1); mac_id >= IBSS_START_MAC_ID; mac_id--) {
 			if (pmlmeinfo->FW_sta_info[mac_id].status == 1)
 				break;
 		}
@@ -1162,7 +1161,7 @@ void rtw_stassoc_hw_rpt(struct adapter *adapter, struct sta_info *psta)
 
 	macid = search_max_mac_id(adapter);
 	rtw_hal_set_hwreg(adapter, HW_VAR_TX_RPT_MAX_MACID, (u8 *)&macid);
-	media_status = (psta->mac_id<<8)|1; /*   MACID|OPMODE:1 connect */
+	media_status = (psta->mac_id << 8) | 1; /*   MACID|OPMODE:1 connect */
 	rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 }
 
@@ -1249,7 +1248,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	if (mac_id >= 0) {
 		u16 media_status;
 
-		media_status = (mac_id<<8)|0; /*   MACID|OPMODE:0 means disconnect */
+		media_status = (mac_id << 8) | 0; /*   MACID|OPMODE:0 means disconnect */
 		/* for STA, AP, ADHOC mode, report disconnect stauts to FW */
 		rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 	}
@@ -1329,7 +1328,7 @@ void rtw_cpwm_event_callback(struct adapter *padapter, u8 *pbuf)
 }
 
 /*
- * _rtw_join_timeout_handler - Timeout/faliure handler for CMD JoinBss
+ * _rtw_join_timeout_handler - Timeout/failure handler for CMD JoinBss
  * @adapter: pointer to struct adapter structure
  */
 void _rtw_join_timeout_handler (unsigned long data)
@@ -1356,11 +1355,10 @@ void _rtw_join_timeout_handler (unsigned long data)
 					continue;
 				}
 				break;
-			} else {
-				DBG_88E("%s We've try roaming but fail\n", __func__);
-				rtw_indicate_disconnect(adapter);
-				break;
 			}
+			DBG_88E("%s We've try roaming but fail\n", __func__);
+			rtw_indicate_disconnect(adapter);
+			break;
 		}
 	} else {
 		rtw_indicate_disconnect(adapter);
@@ -1370,7 +1368,7 @@ void _rtw_join_timeout_handler (unsigned long data)
 }
 
 /*
- * rtw_scan_timeout_handler - Timeout/Faliure handler for CMD SiteSurvey
+ * rtw_scan_timeout_handler - Timeout/Failure handler for CMD SiteSurvey
  * @adapter: pointer to struct adapter structure
  */
 void rtw_scan_timeout_handler (unsigned long data)
@@ -1378,7 +1376,8 @@ void rtw_scan_timeout_handler (unsigned long data)
 	struct adapter *adapter = (struct adapter *)data;
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	DBG_88E(FUNC_ADPT_FMT" fw_state=%x\n", FUNC_ADPT_ARG(adapter), get_fwstate(pmlmepriv));
+	DBG_88E(FUNC_ADPT_FMT" fw_state=%x\n", FUNC_ADPT_ARG(adapter),
+		get_fwstate(pmlmepriv));
 	spin_lock_bh(&pmlmepriv->lock);
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 	spin_unlock_bh(&pmlmepriv->lock);
@@ -1461,7 +1460,7 @@ static int rtw_check_join_candidate(struct mlme_priv *pmlmepriv
 			goto exit;
 	}
 
-	if (*candidate == NULL || (*candidate)->network.Rssi < competitor->network.Rssi) {
+	if (!*candidate || (*candidate)->network.Rssi < competitor->network.Rssi) {
 		*candidate = competitor;
 		updated = true;
 	}
@@ -1501,9 +1500,12 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 	adapter = (struct adapter *)pmlmepriv->nic_hdl;
 	pmlmepriv->pscanned = phead->next;
 	while (phead != pmlmepriv->pscanned) {
-		pnetwork = container_of(pmlmepriv->pscanned, struct wlan_network, list);
-		if (pnetwork == NULL) {
-			RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_, ("%s return _FAIL:(pnetwork==NULL)\n", __func__));
+		pnetwork = container_of(pmlmepriv->pscanned,
+					struct wlan_network, list);
+		if (!pnetwork) {
+			RT_TRACE(_module_rtl871x_mlme_c_, _drv_err_,
+				 ("%s return _FAIL:(pnetwork==NULL)\n",
+				  __func__));
 			ret = _FAIL;
 			goto exit;
 		}
@@ -1516,7 +1518,8 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 		goto exit;
 	} else {
 		DBG_88E("%s: candidate: %s(%pM ch:%u)\n", __func__,
-			candidate->network.Ssid.Ssid, candidate->network.MacAddress,
+			candidate->network.Ssid.Ssid,
+			candidate->network.MacAddress,
 			candidate->network.Configuration.DSConfig);
 	}
 
@@ -1582,7 +1585,8 @@ int rtw_set_auth(struct adapter *adapter, struct security_priv *psecuritypriv)
 	return res;
 }
 
-int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, int keyid, u8 set_tx)
+int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv,
+		int keyid, u8 set_tx)
 {
 	u8	keylen;
 	struct cmd_obj		*pcmd;
@@ -1626,20 +1630,24 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
 	switch (psetkeyparm->algorithm) {
 	case _WEP40_:
 		keylen = 5;
-		memcpy(&(psetkeyparm->key[0]), &(psecuritypriv->dot11DefKey[keyid].skey[0]), keylen);
+		memcpy(&(psetkeyparm->key[0]),
+		       &(psecuritypriv->dot11DefKey[keyid].skey[0]), keylen);
 		break;
 	case _WEP104_:
 		keylen = 13;
-		memcpy(&(psetkeyparm->key[0]), &(psecuritypriv->dot11DefKey[keyid].skey[0]), keylen);
+		memcpy(&(psetkeyparm->key[0]),
+		       &(psecuritypriv->dot11DefKey[keyid].skey[0]), keylen);
 		break;
 	case _TKIP_:
 		keylen = 16;
-		memcpy(&psetkeyparm->key, &psecuritypriv->dot118021XGrpKey[keyid], keylen);
+		memcpy(&psetkeyparm->key,
+		       &psecuritypriv->dot118021XGrpKey[keyid], keylen);
 		psetkeyparm->grpkey = 1;
 		break;
 	case _AES_:
 		keylen = 16;
-		memcpy(&psetkeyparm->key, &psecuritypriv->dot118021XGrpKey[keyid], keylen);
+		memcpy(&psetkeyparm->key,
+		       &psecuritypriv->dot118021XGrpKey[keyid], keylen);
 		psetkeyparm->grpkey = 1;
 		break;
 	default:
@@ -1666,7 +1674,8 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
 }
 
 /* adjust IEs for rtw_joinbss_cmd in WMM */
-int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len)
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			uint in_len, uint initial_out_len)
 {
 	unsigned	int ielength = 0;
 	unsigned int i, j;
@@ -1708,13 +1717,12 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 
 	do {
 		if ((psecuritypriv->PMKIDList[i].bUsed) &&
-		    (!memcmp(psecuritypriv->PMKIDList[i].Bssid, bssid, ETH_ALEN))) {
+		    (!memcmp(psecuritypriv->PMKIDList[i].Bssid,
+			     bssid, ETH_ALEN))) {
 			break;
-		} else {
-			i++;
-			/* continue; */
 		}
-
+		i++;
+		/* continue; */
 	} while (i < NUM_PMKID_CACHE);
 
 	if (i == NUM_PMKID_CACHE)
@@ -1731,7 +1739,8 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 /*  13th element in the array is the IE length */
 /*  */
 
-static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie_len)
+static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie,
+			    uint ie_len)
 {
 	struct security_priv *psecuritypriv = &Adapter->securitypriv;
 
@@ -1749,7 +1758,8 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 	return ie_len;
 }
 
-int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len)
+int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
+			uint in_len)
 {
 	u8 authmode;
 	uint	ielength;
@@ -1769,29 +1779,30 @@ int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	ielength = 12;
 	if ((ndisauthmode == Ndis802_11AuthModeWPA) ||
 	    (ndisauthmode == Ndis802_11AuthModeWPAPSK))
-			authmode = _WPA_IE_ID_;
+		authmode = _WPA_IE_ID_;
 	if ((ndisauthmode == Ndis802_11AuthModeWPA2) ||
 	    (ndisauthmode == Ndis802_11AuthModeWPA2PSK))
 		authmode = _WPA2_IE_ID_;
 
 	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
-		memcpy(out_ie+ielength, psecuritypriv->wps_ie, psecuritypriv->wps_ie_len);
+		memcpy(out_ie + ielength, psecuritypriv->wps_ie,
+		       psecuritypriv->wps_ie_len);
 
 		ielength += psecuritypriv->wps_ie_len;
 	} else if ((authmode == _WPA_IE_ID_) || (authmode == _WPA2_IE_ID_)) {
 		/* copy RSN or SSN */
-		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0], psecuritypriv->supplicant_ie[1]+2);
-		ielength += psecuritypriv->supplicant_ie[1]+2;
-		rtw_report_sec_ie(adapter, authmode, psecuritypriv->supplicant_ie);
+		memcpy(&out_ie[ielength], &psecuritypriv->supplicant_ie[0],
+		       psecuritypriv->supplicant_ie[1] + 2);
+		ielength += psecuritypriv->supplicant_ie[1] + 2;
+		rtw_report_sec_ie(adapter, authmode,
+				  psecuritypriv->supplicant_ie);
 	}
 
 	iEntry = SecIsInPMKIDList(adapter, pmlmepriv->assoc_bssid);
-	if (iEntry < 0) {
+	if (iEntry < 0)
 		return ielength;
-	} else {
-		if (authmode == _WPA2_IE_ID_)
-			ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
-	}
+	if (authmode == _WPA2_IE_ID_)
+		ielength = rtw_append_pmkid(adapter, iEntry, out_ie, ielength);
 	return ielength;
 }
 
@@ -1804,7 +1815,8 @@ void rtw_init_registrypriv_dev_network(struct adapter *adapter)
 
 	memcpy(pdev_network->MacAddress, myhwaddr, ETH_ALEN);
 
-	memcpy(&pdev_network->Ssid, &pregistrypriv->ssid, sizeof(struct ndis_802_11_ssid));
+	memcpy(&pdev_network->Ssid, &pregistrypriv->ssid,
+	       sizeof(struct ndis_802_11_ssid));
 
 	pdev_network->Configuration.Length = sizeof(struct ndis_802_11_config);
 	pdev_network->Configuration.BeaconPeriod = 100;
@@ -1898,15 +1910,18 @@ void rtw_joinbss_reset(struct adapter *padapter)
 			threshold = 1;
 		else
 			threshold = 0;
-		rtw_hal_set_hwreg(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
+		rtw_hal_set_hwreg(padapter, HW_VAR_RXDMA_AGG_PG_TH,
+				  (u8 *)(&threshold));
 	} else {
 		threshold = 1;
-		rtw_hal_set_hwreg(padapter, HW_VAR_RXDMA_AGG_PG_TH, (u8 *)(&threshold));
+		rtw_hal_set_hwreg(padapter, HW_VAR_RXDMA_AGG_PG_TH,
+				  (u8 *)(&threshold));
 	}
 }
 
 /* the function is >= passive_level */
-unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_ie, uint in_len, uint *pout_len)
+unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie,
+				   u8 *out_ie, uint in_len, uint *pout_len)
 {
 	u32 ielen, out_len;
 	enum ht_cap_ampdu_factor max_rx_ampdu_factor;
@@ -1919,14 +1934,14 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 
 	phtpriv->ht_option = false;
 
-	p = rtw_get_ie(in_ie+12, _HT_CAPABILITY_IE_, &ielen, in_len-12);
+	p = rtw_get_ie(in_ie + 12, _HT_CAPABILITY_IE_, &ielen, in_len - 12);
 
 	if (p && ielen > 0) {
 		struct ieee80211_ht_cap ht_cap;
 
 		if (pqospriv->qos_option == 0) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, _VENDOR_SPECIFIC_IE_,
+			rtw_set_ie(out_ie + out_len, _VENDOR_SPECIFIC_IE_,
 				   _WMM_IE_Length_, WMM_IE, pout_len);
 
 			pqospriv->qos_option = 1;
@@ -1942,13 +1957,15 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 					      IEEE80211_HT_CAP_TX_STBC |
 					      IEEE80211_HT_CAP_DSSSCCK40);
 
-		rtw_hal_get_def_var(padapter, HAL_DEF_RX_PACKET_OFFSET, &rx_packet_offset);
-		rtw_hal_get_def_var(padapter, HAL_DEF_MAX_RECVBUF_SZ, &max_recvbuf_sz);
+		rtw_hal_get_def_var(padapter, HAL_DEF_RX_PACKET_OFFSET,
+				    &rx_packet_offset);
+		rtw_hal_get_def_var(padapter, HAL_DEF_MAX_RECVBUF_SZ,
+				    &max_recvbuf_sz);
 
 		/*
-		ampdu_params_info [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
-		ampdu_params_info [4:2]:Min MPDU Start Spacing
-		*/
+		 * ampdu_params_info [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
+		 * ampdu_params_info [4:2]:Min MPDU Start Spacing
+		 */
 
 		rtw_hal_get_def_var(padapter, HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
 		ht_cap.ampdu_params_info = max_rx_ampdu_factor & 0x03;
@@ -1958,16 +1975,18 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 		else
 			ht_cap.ampdu_params_info |= IEEE80211_HT_CAP_AMPDU_DENSITY & 0x00;
 
-		rtw_set_ie(out_ie+out_len, _HT_CAPABILITY_IE_,
+		rtw_set_ie(out_ie + out_len, _HT_CAPABILITY_IE_,
 			   sizeof(struct ieee80211_ht_cap),
 			   (unsigned char *)&ht_cap, pout_len);
 
 		phtpriv->ht_option = true;
 
-		p = rtw_get_ie(in_ie+12, _HT_ADD_INFO_IE_, &ielen, in_len-12);
+		p = rtw_get_ie(in_ie + 12, _HT_ADD_INFO_IE_, &ielen,
+			       in_len - 12);
 		if (p && (ielen == sizeof(struct ieee80211_ht_addt_info))) {
 			out_len = *pout_len;
-			rtw_set_ie(out_ie+out_len, _HT_ADD_INFO_IE_, ielen, p+2, pout_len);
+			rtw_set_ie(out_ie + out_len, _HT_ADD_INFO_IE_,
+				   ielen, p + 2, pout_len);
 		}
 	}
 	return phtpriv->ht_option;
@@ -2033,7 +2052,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len)
 	pmlmeinfo->HT_protection = pmlmeinfo->HT_info.infos[1] & 0x3;
 }
 
-void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitframe)
+void rtw_issue_addbareq_cmd(struct adapter *padapter,
+			    struct xmit_frame *pxmitframe)
 {
 	u8 issued;
 	int priority;
@@ -2058,8 +2078,8 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	phtpriv = &psta->htpriv;
 
 	if ((phtpriv->ht_option) && (phtpriv->ampdu_enable)) {
-		issued = (phtpriv->agg_enable_bitmap>>priority)&0x1;
-		issued |= (phtpriv->candidate_tid_bitmap>>priority)&0x1;
+		issued = (phtpriv->agg_enable_bitmap >> priority) & 0x1;
+		issued |= (phtpriv->candidate_tid_bitmap >> priority) & 0x1;
 
 		if (issued == 0) {
 			DBG_88E("rtw_issue_addbareq_cmd, p=%d\n", priority);
@@ -2092,27 +2112,27 @@ void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 
 	if (pmlmepriv->to_roaming > 0) {
 		DBG_88E("roaming from %s(%pM length:%d\n",
-			pnetwork->network.Ssid.Ssid, pnetwork->network.MacAddress,
+			pnetwork->network.Ssid.Ssid,
+			pnetwork->network.MacAddress,
 			pnetwork->network.Ssid.SsidLength);
-		memcpy(&pmlmepriv->assoc_ssid, &pnetwork->network.Ssid, sizeof(struct ndis_802_11_ssid));
+		memcpy(&pmlmepriv->assoc_ssid, &pnetwork->network.Ssid,
+		       sizeof(struct ndis_802_11_ssid));
 
 		pmlmepriv->assoc_by_bssid = false;
 
 		while (1) {
 			do_join_r = rtw_do_join(padapter);
-			if (do_join_r == _SUCCESS) {
+			if (do_join_r == _SUCCESS)
 				break;
-			} else {
-				DBG_88E("roaming do_join return %d\n", do_join_r);
-				pmlmepriv->to_roaming--;
+			DBG_88E("roaming do_join return %d\n", do_join_r);
+			pmlmepriv->to_roaming--;
 
-				if (pmlmepriv->to_roaming > 0) {
-					continue;
-				} else {
-					DBG_88E("%s(%d) -to roaming fail, indicate_disconnect\n", __func__, __LINE__);
-					rtw_indicate_disconnect(padapter);
-					break;
-				}
+			if (pmlmepriv->to_roaming > 0) {
+				continue;
+			} else {
+				DBG_88E("%s(%d) -to roaming fail, indicate_disconnect\n", __func__, __LINE__);
+				rtw_indicate_disconnect(padapter);
+				break;
 			}
 		}
 	}
-- 
2.1.4
