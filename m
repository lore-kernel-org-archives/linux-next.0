From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Thu, 20 Nov 2008 13:10:59 +1100
Message-ID: <20081120131059.bd413f9f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45391 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750738AbYKTCLJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 19 Nov 2008 21:11:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
include/net/mac80211.h between commit
8e3bad65a59915f2ddc40f62a180ad81695d8440 ("mac80211: remove
ieee80211_notify_mac") from the wireless-current tree and commit
ae5eb02641233a4e9d1b92d22090f1b1afa14466 ("mac80211: rewrite HT
handling") from the net tree.

I fixed it up (see below) but assume it will be fixed soon.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/net/mac80211.h
index 73d81bc,5385600..0000000
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@@ -74,22 -74,14 +74,6 @@@
   */
  
  /**
-  * struct ieee80211_ht_bss_info - describing BSS's HT characteristics
-  *
-  * This structure describes most essential parameters needed
-  * to describe 802.11n HT characteristics in a BSS.
-  *
-  * @primary_channel: channel number of primery channel
-  * @bss_cap: 802.11n's general BSS capabilities (e.g. channel width)
-  * @bss_op_mode: 802.11n's BSS operation modes (e.g. HT protection)
-  */
- struct ieee80211_ht_bss_info {
- 	u8 primary_channel;
- 	u8 bss_cap;  /* use IEEE80211_HT_IE_CHA_ */
- 	u8 bss_op_mode; /* use IEEE80211_HT_IE_ */
- };
- 
- /**
 - * enum ieee80211_notification_type - Low level driver notification
 - * @IEEE80211_NOTIFY_RE_ASSOC: start the re-association sequence
 - */
 -enum ieee80211_notification_types {
 -	IEEE80211_NOTIFY_RE_ASSOC,
 -};
 -
 -/**
   * enum ieee80211_max_queues - maximum number of queues
   *
   * @IEEE80211_MAX_QUEUES: Maximum number of regular device queues.
