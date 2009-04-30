From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the wireless-current
 tree
Date: Thu, 30 Apr 2009 11:33:28 +1000
Message-ID: <20090430113328.791e835e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50092 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751111AbZD3Bdf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 21:33:35 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "John W. Linville" <linville@tuxdriver.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>

Hi David,

Today's linux-next merge of the net tree got a conflict in
net/mac80211/main.c between commit
d4c4a9a1bce1912ed5681251f0037fd4f2364a3e ("mac80211: fix modprobe
deadlock by not calling wep_init under rtnl_lock") from the
wireless-current tree and commit 10f644a47b76d3e61b98f2d02ce9690b94c51ee5
("mac80211: disable powersave if pm_qos asks for low latency") from the
net tree.

Overlapping changes - in the latter patch, some unrelated whitespace
changes ... I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc net/mac80211/main.c
index 1413419,5320e08..0000000
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@@ -752,12 -776,9 +776,10 @@@ struct ieee80211_hw *ieee80211_alloc_hw
  	/* set up some defaults */
  	local->hw.queues = 1;
  	local->hw.max_rates = 1;
- 	local->rts_threshold = IEEE80211_MAX_RTS_THRESHOLD;
- 	local->fragmentation_threshold = IEEE80211_MAX_FRAG_THRESHOLD;
- 	local->hw.conf.long_frame_max_tx_count = 4;
- 	local->hw.conf.short_frame_max_tx_count = 7;
+ 	local->hw.conf.long_frame_max_tx_count = wiphy->retry_long;
+ 	local->hw.conf.short_frame_max_tx_count = wiphy->retry_short;
  	local->hw.conf.radio_enabled = true;
 +	local->user_power_level = -1;
  
  	INIT_LIST_HEAD(&local->interfaces);
  	mutex_init(&local->iflist_mtx);
@@@ -965,25 -1037,38 +1037,38 @@@ int ieee80211_register_hw(struct ieee80
  		}
  	}
  
+ 	local->network_latency_notifier.notifier_call =
+ 		ieee80211_max_network_latency;
+ 	result = pm_qos_add_notifier(PM_QOS_NETWORK_LATENCY,
+ 				     &local->network_latency_notifier);
+ 
+ 	if (result) {
+ 		rtnl_lock();
+ 		goto fail_pm_qos;
+ 	}
+ 
  	return 0;
  
- fail_rate:
+  fail_pm_qos:
+ 	ieee80211_led_exit(local);
+ 	ieee80211_remove_interfaces(local);
 - fail_wep:
 -	rate_control_deinitialize(local);
+  fail_rate:
  	unregister_netdevice(local->mdev);
  	local->mdev = NULL;
- fail_dev:
+  fail_dev:
  	rtnl_unlock();
 +	ieee80211_wep_free(local);
- fail_wep:
++ fail_wep:
  	sta_info_stop(local);
- fail_sta_info:
+  fail_sta_info:
  	debugfs_hw_del(local);
  	destroy_workqueue(local->hw.workqueue);
- fail_workqueue:
+  fail_workqueue:
  	if (local->mdev)
  		free_netdev(local->mdev);
- fail_mdev_alloc:
+  fail_mdev_alloc:
  	wiphy_unregister(local->hw.wiphy);
- fail_wiphy_register:
+  fail_wiphy_register:
  	kfree(local->int_scan_req.channels);
  	return result;
  }
