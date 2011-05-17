From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the wireless tree
Date: Tue, 17 May 2011 13:14:17 +1000
Message-ID: <20110517131417.731cf095.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41145 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751576Ab1EQDOZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 May 2011 23:14:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, "David S. Miller" <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>, Johannes Berg <johannes.berg@intel.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in
net/mac80211/agg-tx.c between commit ec034b208dc8 ("mac80211: fix TX
a-MPDU locking") from the wireless tree and commit 0744371aeba7
("net,rcu: convert call_rcu(kfree_tid_tx) to kfree_rcu()") from the tip
tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/mac80211/agg-tx.c
index cd5125f,53defaf..0000000
--- a/net/mac80211/agg-tx.c
+++ b/net/mac80211/agg-tx.c
@@@ -136,22 -136,6 +136,14 @@@ void ieee80211_send_bar(struct ieee8021
  	ieee80211_tx_skb(sdata, skb);
  }
  
 +void ieee80211_assign_tid_tx(struct sta_info *sta, int tid,
 +			     struct tid_ampdu_tx *tid_tx)
 +{
 +	lockdep_assert_held(&sta->ampdu_mlme.mtx);
 +	lockdep_assert_held(&sta->lock);
 +	rcu_assign_pointer(sta->ampdu_mlme.tid_tx[tid], tid_tx);
 +}
 +
- static void kfree_tid_tx(struct rcu_head *rcu_head)
- {
- 	struct tid_ampdu_tx *tid_tx =
- 	    container_of(rcu_head, struct tid_ampdu_tx, rcu_head);
- 
- 	kfree(tid_tx);
- }
- 
  int ___ieee80211_stop_tx_ba_session(struct sta_info *sta, u16 tid,
  				    enum ieee80211_back_parties initiator,
  				    bool tx)
@@@ -162,19 -146,16 +154,19 @@@
  
  	lockdep_assert_held(&sta->ampdu_mlme.mtx);
  
 -	if (!tid_tx)
 -		return -ENOENT;
 -
  	spin_lock_bh(&sta->lock);
  
 +	tid_tx = rcu_dereference_protected_tid_tx(sta, tid);
 +	if (!tid_tx) {
 +		spin_unlock_bh(&sta->lock);
 +		return -ENOENT;
 +	}
 +
  	if (test_bit(HT_AGG_STATE_WANT_START, &tid_tx->state)) {
  		/* not even started yet! */
 -		rcu_assign_pointer(sta->ampdu_mlme.tid_tx[tid], NULL);
 +		ieee80211_assign_tid_tx(sta, tid, NULL);
  		spin_unlock_bh(&sta->lock);
- 		call_rcu(&tid_tx->rcu_head, kfree_tid_tx);
+ 		kfree_rcu(tid_tx, rcu_head);
  		return 0;
  	}
  
