From: eudyptula@merlin.geekmail.org
Subject: [PATCH linux-next] staging: vt6655: coding style: use C89 comments
Date: Thu, 19 Jun 2014 19:59:32 +0200
Message-ID: <1403200772-26042-1-git-send-email-eudyptula@merlin.geekmail.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from leonardo.netwichtig.de ([213.133.111.59]:49630 "EHLO
	leonardo.netwichtig.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933173AbaFSST0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Jun 2014 14:19:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Merlin Chlosta <eudyptula@merlin.geekmail.org>, Greg Kroah-Hartman <greg@kroah.com>, Forest Bond <forest@alittletooquiet.net>

From: Merlin Chlosta <eudyptula@merlin.geekmail.org>

fix coding style: use C89 comments, not C99

Signed-off-by: Merlin Chlosta <eudyptula@merlin.geekmail.org>
---
diff --git a/drivers/staging/vt6655/vntwifi.c b/drivers/staging/vt6655/vntwifi.c
index 7d61598..085878e 100644
--- a/drivers/staging/vt6655/vntwifi.c
+++ b/drivers/staging/vt6655/vntwifi.c
@@ -255,7 +255,7 @@ VNTWIFIbyGetACKTxRate(
 	if (byRxDataRate <= RATE_11M) {
 		byMaxAckRate = RATE_1M;
 	} else  {
-		// 24M is mandatory for 802.11a and 802.11g
+		/* 24M is mandatory for 802.11a and 802.11g */
 		byMaxAckRate = RATE_24M;
 	}
 	if (pSupportRateIEs) {
@@ -491,7 +491,7 @@ VNTWIFIvUpdateNodeTxCounter(
 
 	pMgmt->sNodeDBTable[uNodeIndex].uTxAttempts++;
 	if (bTxOk) {
-		// transmit success, TxAttempts at least plus one
+		/* transmit success, TxAttempts at least plus one */
 		pMgmt->sNodeDBTable[uNodeIndex].uTxOk[MAX_RATE]++;
 		pMgmt->sNodeDBTable[uNodeIndex].uTxOk[wRate]++;
 	} else {
@@ -525,7 +525,7 @@ VNTWIFIvGetTxRate(
 
 	if ((pMgmt->eCurrMode == WMAC_MODE_IBSS_STA) ||
 	    (pMgmt->eCurrMode == WMAC_MODE_ESS_AP)) {
-		// Adhoc Tx rate decided from node DB
+		/* Adhoc Tx rate decided from node DB */
 		if (BSSDBbIsSTAInNodeDB(pMgmt, pbyDestAddress, &uNodeIndex)) {
 			wTxDataRate = (pMgmt->sNodeDBTable[uNodeIndex].wTxDataRate);
 			pSupportRateIEs = (PWLAN_IE_SUPP_RATES) (pMgmt->sNodeDBTable[uNodeIndex].abyCurrSuppRates);
@@ -539,7 +539,7 @@ VNTWIFIvGetTxRate(
 			pSupportRateIEs = (PWLAN_IE_SUPP_RATES) pMgmt->abyCurrSuppRates;
 			pExtSupportRateIEs = (PWLAN_IE_SUPP_RATES) pMgmt->abyCurrExtSuppRates;
 		}
-	} else { // Infrastructure: rate decided from AP Node, index = 0
+	} else { /* Infrastructure: rate decided from AP Node, index = 0 */
 
 		wTxDataRate = (pMgmt->sNodeDBTable[0].wTxDataRate);
 #ifdef	PLICE_DEBUG
-- 
2.0.0
