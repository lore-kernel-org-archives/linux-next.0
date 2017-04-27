From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Thu, 27 Apr 2017 14:20:21 +1000
Message-ID: <20170427142021.1ae68aa9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34223 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751733AbdD0EUZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 27 Apr 2017 00:20:25 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Arend Van Spriel <arend.vanspriel@broadcom.com>

Hi Greg,

After merging the staging tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_preinit_wiphy':
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:3409:18: error: 'WIPHY_FLAG_SUPPORTS_SCHED_SCAN' undeclared (first use in this function)
  wiphy->flags |= WIPHY_FLAG_SUPPORTS_SCHED_SCAN;
                  ^

Caused by commit

  554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

interacting with commit

  ca986ad9bcd3 ("nl80211: allow multiple active scheduled scan requests")

from the mac80211-next tree.

I applied the below merge fix patch.

Also, I noticed that CONFIG_PNO_SUPPORT is checked for in several
files, but there is no such Kconfig option ...

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 27 Apr 2017 14:12:12 +1000
Subject: [PATCH] staging: merge fix for "nl80211: allow multiple active
 scheduled scan requests"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index f17f4fbd3396..c1977b11b6ac 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -3406,7 +3406,7 @@ static void rtw_cfg80211_preinit_wiphy(struct adapter *padapter, struct wiphy *w
 	wiphy->flags |= WIPHY_FLAG_OFFCHAN_TX | WIPHY_FLAG_HAVE_AP_SME;
 
 #if defined(CONFIG_PM)
-	wiphy->flags |= WIPHY_FLAG_SUPPORTS_SCHED_SCAN;
+	wiphy->max_sched_scan_reqs = 1;
 #ifdef CONFIG_PNO_SUPPORT
 	wiphy->max_sched_scan_ssids = MAX_PNO_LIST_COUNT;
 #endif
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
