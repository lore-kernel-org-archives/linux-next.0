From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the  wireless-drivers-next
 tree
Date: Fri, 7 Aug 2015 13:16:15 +1000
Message-ID: <20150807131615.535d4c04@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47934 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752098AbbHGDQR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Aug 2015 23:16:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>

Hi Kalle,

After merging the wireless-drivers-next tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

drivers/net/wireless/ath/ath9k/debug_sta.c: In function 'read_file_node_aggr':
drivers/net/wireless/ath/ath9k/debug_sta.c:54:25: error: 'struct ath_node' has no member named 'ac'
  for (acno = 0, ac = &an->ac[acno];
                         ^
drivers/net/wireless/ath/ath9k/debug_sta.c:55:43: error: increment of pointer to unknown structure
       acno < IEEE80211_NUM_ACS; acno++, ac++) {
                                           ^
drivers/net/wireless/ath/ath9k/debug_sta.c:55:7: error: arithmetic on pointer to an incomplete type
       acno < IEEE80211_NUM_ACS; acno++, ac++) {
       ^
drivers/net/wireless/ath/ath9k/debug_sta.c:56:11: error: dereferencing pointer to incomplete type
   txq = ac->txq;
           ^
drivers/net/wireless/ath/ath9k/debug_sta.c:60:14: error: dereferencing pointer to incomplete type
      acno, ac->sched);
              ^
drivers/net/wireless/ath/ath9k/debug_sta.c:71:12: error: 'struct ath_atx_tid' has no member named 'ac'
   txq = tid->ac->txq;
            ^
drivers/net/wireless/ath/ath9k/debug_sta.c:83:10: error: 'struct ath_atx_tid' has no member named 'sched'
       tid->sched);
          ^

Caused by commits

  592fa228f213 ("ath9k: remove struct ath_atx_ac")
  d70d848a75fd ("ath9k: remove the sched field in struct ath_atx_tid")

I have used the wireless-drivers-next tree from next-20150806 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
