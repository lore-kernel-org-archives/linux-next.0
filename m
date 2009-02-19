From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree with the
 wireless-current tree
Date: Thu, 19 Feb 2009 16:27:15 +1100
Message-ID: <20090219162715.9860f098.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56101 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751264AbZBSF1S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Feb 2009 00:27:18 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Bob Copeland <me@bobcopeland.com>, Vasanthakumar Thiagarajan <vasanth@atheros.com>

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/ath9k/main.c between commit
11cb2b00a5f8654102e34df3cfa44992b9c2fc8e ("ath9k: Fix panic upon attach
failure") from the wireless-current tree and commit ath_attach ("ath9k:
move common regulatory code out of if() branches") from the wireless tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/ath9k/main.c
index 7d7537e,1b2c9af..0000000
--- a/drivers/net/wireless/ath9k/main.c
+++ b/drivers/net/wireless/ath9k/main.c
@@@ -1566,7 -1569,8 +1570,8 @@@ bad
  int ath_attach(u16 devid, struct ath_softc *sc)
  {
  	struct ieee80211_hw *hw = sc->hw;
+ 	const struct ieee80211_regdomain *regd;
 -	int error = 0;
 +	int error = 0, i;
  
  	DPRINTF(sc, ATH_DBG_CONFIG, "Attach ATH hw\n");
  
