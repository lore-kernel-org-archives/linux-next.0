From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Fri, 7 Nov 2008 15:24:24 +1100
Message-ID: <20081107152424.175b101a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37432 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751052AbYKGEYd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Nov 2008 23:24:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Andrey Yurovsky <andrey@cozybit.com>, "John W. Linville" <linville@tuxdriver.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/ath5k/base.c between commit
934f6c3f8e7f5d6a6d07ae2df283fd02393019dd ("Revert "ath5k: honor
FIF_BCN_PRBRESP_PROMISC in STA mode"") from the net-current tree and
commit b706e65b40417e03c2451bb3f92488f3736843fa ("ath5k: fix mesh point
operation") from the net tree.

Just a context change.  I fixed it up (see below) and assume it will be
fixed in your tree soon.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/ath5k/base.c
index cfd4d05,7ac5f28..0000000
--- a/drivers/net/wireless/ath5k/base.c
+++ b/drivers/net/wireless/ath5k/base.c
@@@ -2942,13 -2949,14 +2949,16 @@@ static void ath5k_configure_filter(stru
  		sc->opmode != NL80211_IFTYPE_MESH_POINT &&
  		test_bit(ATH_STAT_PROMISC, sc->status))
  		rfilt |= AR5K_RX_FILTER_PROM;
 -	if (sc->opmode == NL80211_IFTYPE_ADHOC)
 +	if (sc->opmode == NL80211_IFTYPE_STATION ||
 +		sc->opmode == NL80211_IFTYPE_ADHOC) {
  		rfilt |= AR5K_RX_FILTER_BEACON;
 +	}
+ 	if (sc->opmode == NL80211_IFTYPE_MESH_POINT)
+ 		rfilt |= AR5K_RX_FILTER_CONTROL | AR5K_RX_FILTER_BEACON |
+ 			AR5K_RX_FILTER_PROBEREQ | AR5K_RX_FILTER_PROM;
  
  	/* Set filters */
- 	ath5k_hw_set_rx_filter(ah,rfilt);
+ 	ath5k_hw_set_rx_filter(ah, rfilt);
  
  	/* Set multicast bits */
  	ath5k_hw_set_mcast_filter(ah, mfilt[0], mfilt[1]);
