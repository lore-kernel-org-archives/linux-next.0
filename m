From: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Subject: Re: linux-next: Tree for April 22 (rndis_wlan)
Date: Wed, 22 Apr 2009 13:28:05 -0400
Message-ID: <20090422172804.GE3288@tuxdriver.com>
References: <20090422154247.dbffd285.sfr@canb.auug.org.au> <49EF4B73.2050702@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <49EF4B73.2050702-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, jussi.kivilinna-E01nCVcF24I@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, Apr 22, 2009 at 09:53:07AM -0700, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090421:
> > 
> > For those who care about the order of trees, I have moved the merging of
> > all the fs trees together and nearer the start of the process.
> > 
> > This tree will not build a powerpc allyesconfig.
> > 
> > The net tree lost its conflict.
> > 
> > The wireless tree gained a conflict against eahc of the v4l-dvb and
> > wireless-current trees and a build failure due to an interaction with the
> > acpi tree for which I reverted a commit.
> 
> ERROR: "wiphy_free" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_wext_siwscan" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_wext_siwmode" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "__ieee80211_get_channel" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "wiphy_unregister" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_inform_bss" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "wiphy_new" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "wiphy_register" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_wext_giwrange" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_wext_giwmode" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_wext_giwname" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_wext_giwscan" [drivers/net/wireless/rndis_wlan.ko] undefined!
> ERROR: "cfg80211_scan_done" [drivers/net/wireless/rndis_wlan.ko] undefined!

> # CONFIG_CFG80211 is not set

No doubt this is the problem...

---

>From bce85c97aeeb9c34098951e9ef3de425c6830b63 Mon Sep 17 00:00:00 2001
From: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Date: Wed, 22 Apr 2009 13:27:08 -0400
Subject: [PATCH] rndis_wlan: select CFG80211 in Kconfig

Signed-off-by: John W. Linville <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
---
 drivers/net/wireless/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/Kconfig b/drivers/net/wireless/Kconfig
index 11c2481..2d8434f 100644
--- a/drivers/net/wireless/Kconfig
+++ b/drivers/net/wireless/Kconfig
@@ -337,6 +337,7 @@ config USB_NET_RNDIS_WLAN
 	select USB_NET_CDCETHER
 	select USB_NET_RNDIS_HOST
 	select WIRELESS_EXT
+	select CFG80211
 	---help---
 	  This is a driver for wireless RNDIS devices.
 	  These are USB based adapters found in devices such as:
-- 
1.6.0.6

-- 
John W. Linville		Someday the world will need a hero, and you
linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org			might be all we have.  Be ready.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
