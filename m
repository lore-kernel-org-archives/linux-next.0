From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 26 Nov 2008 17:34:46 +1100
Message-ID: <20081126173446.435a3552.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33889 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750797AbYKZGnR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 01:43:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Martin Xu <martin.xu@intel.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/wireless/ath5k/base.c between commit
02969b38e6f7cef80e71d673d1e512e029a7009f ("ath5k: disable beacon filter
when station is not associated") from the net-current tree and commits da966bcae70e4012b7d999820b728dd6502047e0 ("Ath5k: add AP mode") and 296bf2aefdf7b4b1bf093a7b42a86ee21b46d07f ("ath5k: allow APs to receive
beacons") from the net tree.

I fixed it up (see below) and assume it will be fixed in the net tree
soon.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/ath5k/base.c
index 2d14255,34cd1a4..0000000
--- a/drivers/net/wireless/ath5k/base.c
+++ b/drivers/net/wireless/ath5k/base.c
@@@ -238,12 -240,7 +240,11 @@@ static int ath5k_get_tx_stats(struct ie
  		struct ieee80211_tx_queue_stats *stats);
  static u64 ath5k_get_tsf(struct ieee80211_hw *hw);
  static void ath5k_reset_tsf(struct ieee80211_hw *hw);
- static int ath5k_beacon_update(struct ieee80211_hw *hw,
- 		struct sk_buff *skb);
+ static int ath5k_beacon_update(struct ath5k_softc *sc, struct sk_buff *skb);
 +static void ath5k_bss_info_changed(struct ieee80211_hw *hw,
 +		struct ieee80211_vif *vif,
 +		struct ieee80211_bss_conf *bss_conf,
 +		u32 changes);
  
  static struct ieee80211_ops ath5k_hw_ops = {
  	.tx 		= ath5k_tx,
@@@ -2947,13 -2952,16 +2957,16 @@@ static void ath5k_configure_filter(stru
  		sc->opmode != NL80211_IFTYPE_MESH_POINT &&
  		test_bit(ATH_STAT_PROMISC, sc->status))
  		rfilt |= AR5K_RX_FILTER_PROM;
 -	if (sc->opmode == NL80211_IFTYPE_STATION ||
 +	if ((sc->opmode == NL80211_IFTYPE_STATION && sc->assoc) ||
- 		sc->opmode == NL80211_IFTYPE_ADHOC) {
+ 		sc->opmode == NL80211_IFTYPE_ADHOC ||
+ 		sc->opmode == NL80211_IFTYPE_AP)
  		rfilt |= AR5K_RX_FILTER_BEACON;
- 	}
+ 	if (sc->opmode == NL80211_IFTYPE_MESH_POINT)
+ 		rfilt |= AR5K_RX_FILTER_CONTROL | AR5K_RX_FILTER_BEACON |
+ 			AR5K_RX_FILTER_PROBEREQ | AR5K_RX_FILTER_PROM;
  
  	/* Set filters */
- 	ath5k_hw_set_rx_filter(ah,rfilt);
+ 	ath5k_hw_set_rx_filter(ah, rfilt);
  
  	/* Set multicast bits */
  	ath5k_hw_set_mcast_filter(ah, mfilt[0], mfilt[1]);
@@@ -3085,35 -3090,6 +3095,34 @@@ ath5k_beacon_update(struct ath5k_softc 
  		mmiowb();
  	}
  
- end:
  	return ret;
  }
 +static void
 +set_beacon_filter(struct ieee80211_hw *hw, bool enable)
 +{
 +	struct ath5k_softc *sc = hw->priv;
 +	struct ath5k_hw *ah = sc->ah;
 +	u32 rfilt;
 +	rfilt = ath5k_hw_get_rx_filter(ah);
 +	if (enable)
 +		rfilt |= AR5K_RX_FILTER_BEACON;
 +	else
 +		rfilt &= ~AR5K_RX_FILTER_BEACON;
 +	ath5k_hw_set_rx_filter(ah, rfilt);
 +	sc->filter_flags = rfilt;
 +}
  
 +static void ath5k_bss_info_changed(struct ieee80211_hw *hw,
 +				    struct ieee80211_vif *vif,
 +				    struct ieee80211_bss_conf *bss_conf,
 +				    u32 changes)
 +{
 +	struct ath5k_softc *sc = hw->priv;
 +	if (changes & BSS_CHANGED_ASSOC) {
 +		mutex_lock(&sc->lock);
 +		sc->assoc = bss_conf->assoc;
 +		if (sc->opmode == NL80211_IFTYPE_STATION)
 +			set_beacon_filter(hw, sc->assoc);
 +		mutex_unlock(&sc->lock);
 +	}
 +}
