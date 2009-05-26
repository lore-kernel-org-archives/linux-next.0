From: Zhu Yi <yi.zhu@intel.com>
Subject: Re: [Ilw] Re: linux-next: Tree for May 25 (iwmc3200wifi)
Date: Tue, 26 May 2009 10:49:41 +0800
Message-ID: <1243306181.3623.2.camel@debian>
References: <20090525185524.63b80cbf.sfr@canb.auug.org.au>
	 <4A1B2588.7020907@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:57498 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752865AbZEZC5d (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2009 22:57:33 -0400
In-Reply-To: <4A1B2588.7020907@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "ilw@linux.intel.com" <ilw@linux.intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, 2009-05-26 at 07:11 +0800, Randy Dunlap wrote:
> Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20090522:
> 
> 
> ERROR: "wiphy_free" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_ibss_wext_giwfreq" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "ieee80211_frequency_to_channel" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_inform_bss_frame" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_ibss_wext_siwap" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_siwscan" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "ieee80211_hdrlen" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "ieee80211_channel_to_frequency" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "ieee80211_data_to_8023" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_siwmode" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "__ieee80211_get_channel" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_get_bss" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "wiphy_unregister" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_ibss_wext_giwap" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_ibss_wext_siwfreq" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_giwfrag" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_ibss_joined" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_siwrts" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_put_bss" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "wiphy_new" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "wiphy_register" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_classify8021d" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_giwrange" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "ieee80211_data_from_8023" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_giwmode" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_giwname" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_giwscan" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_giwrts" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_wext_siwfrag" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_scan_done" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_ibss_wext_siwessid" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> ERROR: "cfg80211_ibss_wext_giwessid" [drivers/net/wireless/iwmc3200wifi/iwmc3200wifi.ko] undefined!
> 
> 
> config attached.

Good catch. iwmc3200wifi Kconfig forgot to select CFG80211. I'll send a
patch to fix this in linux-wireless.

Thanks,
-yi
