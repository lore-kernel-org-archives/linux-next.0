From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mac80211-next tree with Linus' tree
Date: Mon, 3 Oct 2016 10:21:15 +1100
Message-ID: <20161003102115.7cee23f9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
List-Id: linux-next.vger.kernel.org

Hi Johannes,

Today's linux-next merge of the mac80211-next tree got a conflict in:

  net/mac80211/tx.c

between commits:

  df6ef5d8a87a ("mac80211: fix sequence number assignment for PS response frames")
  0b97a484e52c ("mac80211: check skb_linearize() return value")

from Linus' tree and commits:

  e0e2effff5e1 ("mac80211: Move ieee802111_tx_dequeue() to later in tx.c")
  bb42f2d13ffc ("mac80211: Move reorder-sensitive TX handlers to after TXQ dequeue")

from the mac80211-next tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/mac80211/tx.c
index 1ff08be90a98,0ea1b0d02186..000000000000
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@@ -3156,8 -3193,71 +3195,73 @@@ out
  	return ret;
  }
  
+ /*
+  * Can be called while the sta lock is held. Anything that can cause packets to
+  * be generated will cause deadlock!
+  */
+ static void ieee80211_xmit_fast_finish(struct ieee80211_sub_if_data *sdata,
+ 				       struct sta_info *sta, u8 pn_offs,
+ 				       struct ieee80211_key *key,
+ 				       struct sk_buff *skb)
+ {
+ 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+ 	struct ieee80211_hdr *hdr = (void *)skb->data;
++	struct ieee80211_local *local = sdata->local;
+ 	u8 tid = IEEE80211_NUM_TIDS;
+ 
+ 	if (key)
+ 		info->control.hw_key = &key->conf;
+ 
+ 	ieee80211_tx_stats(skb->dev, skb->len);
+ 
+ 	if (hdr->frame_control & cpu_to_le16(IEEE80211_STYPE_QOS_DATA)) {
+ 		tid = skb->priority & IEEE80211_QOS_CTL_TAG1D_MASK;
+ 		*ieee80211_get_qos_ctl(hdr) = tid;
 -		hdr->seq_ctrl = ieee80211_tx_next_seq(sta, tid);
++		if (!ieee80211_get_txq(local, &sdata->vif, &sta->sta, skb))
++			hdr->seq_ctrl = ieee80211_tx_next_seq(sta, tid);
+ 	} else {
+ 		info->flags |= IEEE80211_TX_CTL_ASSIGN_SEQ;
+ 		hdr->seq_ctrl = cpu_to_le16(sdata->sequence_number);
+ 		sdata->sequence_number += 0x10;
+ 	}
+ 
+ 	if (skb_shinfo(skb)->gso_size)
+ 		sta->tx_stats.msdu[tid] +=
+ 			DIV_ROUND_UP(skb->len, skb_shinfo(skb)->gso_size);
+ 	else
+ 		sta->tx_stats.msdu[tid]++;
+ 
+ 	info->hw_queue = sdata->vif.hw_queue[skb_get_queue_mapping(skb)];
+ 
+ 	/* statistics normally done by ieee80211_tx_h_stats (but that
+ 	 * has to consider fragmentation, so is more complex)
+ 	 */
+ 	sta->tx_stats.bytes[skb_get_queue_mapping(skb)] += skb->len;
+ 	sta->tx_stats.packets[skb_get_queue_mapping(skb)]++;
+ 
+ 	if (pn_offs) {
+ 		u64 pn;
+ 		u8 *crypto_hdr = skb->data + pn_offs;
+ 
+ 		switch (key->conf.cipher) {
+ 		case WLAN_CIPHER_SUITE_CCMP:
+ 		case WLAN_CIPHER_SUITE_CCMP_256:
+ 		case WLAN_CIPHER_SUITE_GCMP:
+ 		case WLAN_CIPHER_SUITE_GCMP_256:
+ 			pn = atomic64_inc_return(&key->conf.tx_pn);
+ 			crypto_hdr[0] = pn;
+ 			crypto_hdr[1] = pn >> 8;
+ 			crypto_hdr[4] = pn >> 16;
+ 			crypto_hdr[5] = pn >> 24;
+ 			crypto_hdr[6] = pn >> 32;
+ 			crypto_hdr[7] = pn >> 40;
+ 			break;
+ 		}
+ 	}
+ }
+ 
  static bool ieee80211_xmit_fast(struct ieee80211_sub_if_data *sdata,
- 				struct net_device *dev, struct sta_info *sta,
+ 				struct sta_info *sta,
  				struct ieee80211_fast_tx *fast_tx,
  				struct sk_buff *skb)
  {
@@@ -3316,6 -3374,90 +3378,94 @@@
  	return true;
  }
  
+ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
+ 				     struct ieee80211_txq *txq)
+ {
+ 	struct ieee80211_local *local = hw_to_local(hw);
+ 	struct txq_info *txqi = container_of(txq, struct txq_info, txq);
+ 	struct ieee80211_hdr *hdr;
+ 	struct sk_buff *skb = NULL;
+ 	struct fq *fq = &local->fq;
+ 	struct fq_tin *tin = &txqi->tin;
+ 	struct ieee80211_tx_info *info;
+ 	struct ieee80211_tx_data tx;
+ 	ieee80211_tx_result r;
+ 
+ 	spin_lock_bh(&fq->lock);
+ 
+ 	if (test_bit(IEEE80211_TXQ_STOP, &txqi->flags))
+ 		goto out;
+ 
+ 	/* Make sure fragments stay together. */
+ 	skb = __skb_dequeue(&txqi->frags);
+ 	if (skb)
+ 		goto out;
+ 
+ begin:
+ 	skb = fq_tin_dequeue(fq, tin, fq_tin_dequeue_func);
+ 	if (!skb)
+ 		goto out;
+ 
+ 	ieee80211_set_skb_vif(skb, txqi);
+ 
+ 	hdr = (struct ieee80211_hdr *)skb->data;
+ 	info = IEEE80211_SKB_CB(skb);
+ 
+ 	memset(&tx, 0, sizeof(tx));
+ 	__skb_queue_head_init(&tx.skbs);
+ 	tx.local = local;
+ 	tx.skb = skb;
+ 	tx.sdata = vif_to_sdata(info->control.vif);
+ 
+ 	if (txq->sta)
+ 		tx.sta = container_of(txq->sta, struct sta_info, sta);
+ 
+ 	/*
+ 	 * The key can be removed while the packet was queued, so need to call
+ 	 * this here to get the current key.
+ 	 */
+ 	r = ieee80211_tx_h_select_key(&tx);
+ 	if (r != TX_CONTINUE) {
+ 		ieee80211_free_txskb(&local->hw, skb);
+ 		goto begin;
+ 	}
+ 
+ 	if (info->control.flags & IEEE80211_TX_CTRL_FAST_XMIT) {
+ 		struct sta_info *sta = container_of(txq->sta, struct sta_info,
+ 						    sta);
+ 		u8 pn_offs = 0;
+ 
+ 		if (tx.key &&
+ 		    (tx.key->conf.flags & IEEE80211_KEY_FLAG_GENERATE_IV))
+ 			pn_offs = ieee80211_hdrlen(hdr->frame_control);
+ 
+ 		ieee80211_xmit_fast_finish(sta->sdata, sta, pn_offs,
+ 					   tx.key, skb);
+ 	} else {
+ 		if (invoke_tx_handlers_late(&tx))
+ 			goto begin;
+ 
+ 		skb = __skb_dequeue(&tx.skbs);
+ 
+ 		if (!skb_queue_empty(&tx.skbs))
+ 			skb_queue_splice_tail(&tx.skbs, &txqi->frags);
+ 	}
+ 
+ out:
+ 	spin_unlock_bh(&fq->lock);
+ 
+ 	if (skb && skb_has_frag_list(skb) &&
 -	    !ieee80211_hw_check(&local->hw, TX_FRAG_LIST))
 -		skb_linearize(skb);
++	    !ieee80211_hw_check(&local->hw, TX_FRAG_LIST)) {
++		if (skb_linearize(skb)) {
++			ieee80211_free_txskb(&local->hw, skb);
++			return NULL;
++		}
++	}
+ 
+ 	return skb;
+ }
+ EXPORT_SYMBOL(ieee80211_tx_dequeue);
+ 
  void __ieee80211_subif_start_xmit(struct sk_buff *skb,
  				  struct net_device *dev,
  				  u32 info_flags)
