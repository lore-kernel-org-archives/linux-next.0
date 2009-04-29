From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the wireless-current
 tree
Date: Wed, 29 Apr 2009 13:51:18 +1000
Message-ID: <20090429135118.fa02210b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49666 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750887AbZD2DvV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Apr 2009 23:51:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>

Hi David,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/iwlwifi/iwl-scan.c between commit
74aa9be0ea0ffeb233f45c39f3cf594b68bbbb89 ("iwlwifi: notify on scan
completion even when shutting down") from the wireless-current tree and
commit 1ecf9fc1317f8df91eb1d74360f408558d657478 ("iwlwifi: improve scan
support") from the net tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/wireless/iwlwifi/iwl-scan.c
index e7c65c4,799f5eb..0000000
--- a/drivers/net/wireless/iwlwifi/iwl-scan.c
+++ b/drivers/net/wireless/iwlwifi/iwl-scan.c
@@@ -925,11 -814,12 +814,12 @@@ void iwl_bg_scan_completed(struct work_
  
  	IWL_DEBUG_SCAN(priv, "SCAN complete scan\n");
  
 -	if (test_bit(STATUS_EXIT_PENDING, &priv->status))
 -		return;
 -
+ 	priv->scan_request = NULL;
  	ieee80211_scan_completed(priv->hw, false);
  
 +	if (test_bit(STATUS_EXIT_PENDING, &priv->status))
 +		return;
 +
  	/* Since setting the TXPOWER may have been deferred while
  	 * performing the scan, fire one off */
  	mutex_lock(&priv->mutex);
