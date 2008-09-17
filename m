From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the wireless tree
Date: Wed, 17 Sep 2008 17:43:17 +1000
Message-ID: <20080917174317.a5335e6c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45985 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751698AbYIQHnZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 03:43:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Greg KH <greg@kroah.com>

Hi John,

Today's linux-next merge of the wireless tree got a conflict in
drivers/net/wireless/mac80211_hwsim.c between commit
121e2082a81c7988a1399c1a5f43795c95225de2 ("device create: net: convert
device_create_drvdata to device_create") from the driver-core tree and
commit init_mac80211_hwsim( ("mac80211 hwsim: make radio list dynamic")
from the wireless tree.

The former modified the context of the latter.  I fixed it up (see below)
and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/wireless/mac80211_hwsim.c
index 13cee4c,c9e4a43..0000000
--- a/drivers/net/wireless/mac80211_hwsim.c
+++ b/drivers/net/wireless/mac80211_hwsim.c
@@@ -426,14 -530,14 +530,14 @@@ static int __init init_mac80211_hwsim(v
  			err = -ENOMEM;
  			goto failed;
  		}
- 		hwsim_radios[i] = hw;
- 
  		data = hw->priv;
+ 		data->hw = hw;
+ 
 -		data->dev = device_create_drvdata(hwsim_class, NULL, 0, hw,
 -						"hwsim%d", i);
 +		data->dev = device_create(hwsim_class, NULL, 0, hw,
 +					  "hwsim%d", i);
  		if (IS_ERR(data->dev)) {
  			printk(KERN_DEBUG
 -			       "mac80211_hwsim: device_create_drvdata "
 +			       "mac80211_hwsim: device_create "
  			       "failed (%ld)\n", PTR_ERR(data->dev));
  			err = -ENOMEM;
  			goto failed_drvdata;
