From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the mac80211-next tree with the
 mac80211 tree
Date: Tue, 16 Jan 2018 11:13:42 +1100
Message-ID: <20180116111342.721301fc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40145 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750716AbeAPANo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Jan 2018 19:13:44 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Beichler <benjamin.beichler@uni-rostock.de>

Hi Johannes,

Today's linux-next merge of the mac80211-next tree got a conflict in:

  drivers/net/wireless/mac80211_hwsim.c

between commit:

  b71d856ab536 ("mac80211_hwsim: add workqueue to wait for deferred radio deletion on mod unload")

from the mac80211 tree and commit:

  c6509cc3b3e8 ("mac80211_hwsim: add hashtable with mac address keys for faster lookup")

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

diff --cc drivers/net/wireless/mac80211_hwsim.c
index e54255597fac,6bf063adcbde..000000000000
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@@ -489,7 -490,7 +490,8 @@@ static const struct ieee80211_iface_com
  
  static spinlock_t hwsim_radio_lock;
  static LIST_HEAD(hwsim_radios);
+ static struct rhashtable hwsim_radios_rht;
 +static struct workqueue_struct *hwsim_wq;
  static int hwsim_radio_idx;
  
  static struct platform_driver mac80211_hwsim_driver = {
@@@ -3352,8 -3396,10 +3402,10 @@@ static void remove_user_radios(u32 port
  	list_for_each_entry_safe(entry, tmp, &hwsim_radios, list) {
  		if (entry->destroy_on_close && entry->portid == portid) {
  			list_del(&entry->list);
+ 			rhashtable_remove_fast(&hwsim_radios_rht, &entry->rht,
+ 					       hwsim_rht_params);
  			INIT_WORK(&entry->destroy_work, destroy_radio);
 -			schedule_work(&entry->destroy_work);
 +			queue_work(hwsim_wq, &entry->destroy_work);
  		}
  	}
  	spin_unlock_bh(&hwsim_radio_lock);
@@@ -3427,8 -3473,10 +3479,10 @@@ static void __net_exit hwsim_exit_net(s
  			continue;
  
  		list_del(&data->list);
+ 		rhashtable_remove_fast(&hwsim_radios_rht, &data->rht,
+ 				       hwsim_rht_params);
  		INIT_WORK(&data->destroy_work, destroy_radio);
 -		schedule_work(&data->destroy_work);
 +		queue_work(hwsim_wq, &data->destroy_work);
  	}
  	spin_unlock_bh(&hwsim_radio_lock);
  }
@@@ -3460,10 -3508,8 +3514,12 @@@ static int __init init_mac80211_hwsim(v
  
  	spin_lock_init(&hwsim_radio_lock);
  
 +	hwsim_wq = alloc_workqueue("hwsim_wq",WQ_MEM_RECLAIM,0);
 +	if (!hwsim_wq)
 +		return -ENOMEM;
 +
+ 	rhashtable_init(&hwsim_radios_rht, &hwsim_rht_params);
+ 
  	err = register_pernet_device(&hwsim_net_ops);
  	if (err)
  		return err;
@@@ -3602,8 -3648,7 +3658,9 @@@ static void __exit exit_mac80211_hwsim(
  	hwsim_exit_netlink();
  
  	mac80211_hwsim_free();
+ 	rhashtable_destroy(&hwsim_radios_rht);
 +	flush_workqueue(hwsim_wq);
 +
  	unregister_netdev(hwsim_mon);
  	platform_driver_unregister(&mac80211_hwsim_driver);
  	unregister_pernet_device(&hwsim_net_ops);
