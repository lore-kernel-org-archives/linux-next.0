From: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Subject: Re: print_ssid undefined (linux-next 20081103)
Date: Mon, 3 Nov 2008 12:12:06 -0800
Message-ID: <20081103201206.GB6378@tesla>
References: <20081103114222.b257f711.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.36.123.2]:21401 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756252AbYKCUMI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 Nov 2008 15:12:08 -0500
Received: from mail.atheros.com ([10.10.20.105])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Mon, 03 Nov 2008 12:12:08 -0800
Content-Disposition: inline
In-Reply-To: <20081103114222.b257f711.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, Nov 03, 2008 at 11:42:22AM -0800, Randy Dunlap wrote:
> Hi,
> 
> I'm seeing a few instances of
> 
> ERROR: "print_ssid" [drivers/net/wireless/ipw2100.ko] undefined!
> 
> with ipw2100 & ipw2200 in today's linux-next (20081103).
> 
> These configs have
> # CONFIG_WIRELESS is not set
> CONFIG_WIRELESS_EXT=y
> 
> In looking into this more, I see that the wireless drivers can be enabled
> & built even when CONFIG_WIRELESS=n.  Is this the expected behavior?
> Seems a bit odd.

Try this.

diff --git a/drivers/net/wireless/Kconfig b/drivers/net/wireless/Kconfig
index 42afaed..6f85bec 100644
--- a/drivers/net/wireless/Kconfig
+++ b/drivers/net/wireless/Kconfig
@@ -125,7 +125,7 @@ config PCMCIA_RAYCS
 
 config IPW2100
 	tristate "Intel PRO/Wireless 2100 Network Connection"
-	depends on PCI && WLAN_80211
+	depends on PCI && WLAN_80211 && LIB80211
 	select WIRELESS_EXT
 	select FW_LOADER
 	select IEEE80211
@@ -183,7 +183,7 @@ config IPW2100_DEBUG
 
 config IPW2200
 	tristate "Intel PRO/Wireless 2200BG and 2915ABG Network Connection"
-	depends on PCI && WLAN_80211
+	depends on PCI && WLAN_80211 && LIB80211
 	select WIRELESS_EXT
 	select FW_LOADER
 	select IEEE80211
