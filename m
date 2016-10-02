From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mac80211-next tree with Linus' tree
Date: Mon, 3 Oct 2016 10:02:11 +1100
Message-ID: <20161003100211.68fe609c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48319 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751130AbcJBXCQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Oct 2016 19:02:16 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@toke.dk>, Felix Fietkau <nbd@nbd.name>

Hi Johannes,

Today's linux-next merge of the mac80211-next tree got a conflict in:

  net/mac80211/sta_info.c

between commit:

  83843c80dcf1 ("mac80211: fix tim recalculation after PS response")

from Linus' tree and commit:

  bb42f2d13ffc ("mac80211: Move reorder-sensitive TX handlers to after TXQ dequeue")

from the mac80211-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc net/mac80211/sta_info.c
index 011880d633b4,167bff078bdd..000000000000
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@@ -1638,10 -1647,7 +1636,8 @@@ ieee80211_sta_ps_deliver_response(struc
  			return;
  
  		for (tid = 0; tid < ARRAY_SIZE(sta->sta.txq); tid++) {
- 			struct txq_info *txqi = to_txq_info(sta->sta.txq[tid]);
- 
 -			if (!(tids & BIT(tid)) || txq_has_queue(sta->sta.txq[tid]))
 +			if (!(driver_release_tids & BIT(tid)) ||
- 			    txqi->tin.backlog_packets)
++			    txq_has_queue(sta->sta.txq[tid]))
  				continue;
  
  			sta_info_recalc_tim(sta);
