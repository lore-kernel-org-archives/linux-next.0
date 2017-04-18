From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Tue, 18 Apr 2017 15:53:48 +1000
Message-ID: <20170418155348.69ee48c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51961 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753521AbdDRFxu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Apr 2017 01:53:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

Hi all,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:3426:25: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .change_virtual_intf = cfg80211_rtw_change_iface,
                         ^
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:3426:25: note: (near initialization for 'rtw_cfg80211_ops.change_virtual_intf')
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:3445:22: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
  .add_virtual_intf = cfg80211_rtw_add_virtual_intf,
                      ^
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:3445:22: note: (near initialization for 'rtw_cfg80211_ops.add_virtual_intf')

Caused by commit

  554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

interacting with commit

  818a986e4eba ("cfg80211: move add/change interface monitor flags into params")

from the mac80211-next tree.

I have added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 18 Apr 2017 15:43:43 +1000
Subject: [PATCH] staging: merge fix for add/change_virtual-intf API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 52aa65bfd890..f17f4fbd3396 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1310,7 +1310,7 @@ extern int netdev_open(struct net_device *pnetdev);
 
 static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 				     struct net_device *ndev,
-				     enum nl80211_iftype type, u32 *flags,
+				     enum nl80211_iftype type,
 				     struct vif_params *params)
 {
 	enum nl80211_iftype old_type;
@@ -2711,7 +2711,7 @@ static struct wireless_dev *
 		struct wiphy *wiphy,
 		const char *name,
 		unsigned char name_assign_type,
-		enum nl80211_iftype type, u32 *flags, struct vif_params *params)
+		enum nl80211_iftype type, struct vif_params *params)
 {
 	int ret = 0;
 	struct net_device* ndev = NULL;
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
