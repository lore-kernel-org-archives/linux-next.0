From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the staging tree
Date: Tue, 11 Apr 2017 15:04:40 +1000
Message-ID: <20170411150440.0c7fc587@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53115 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752513AbdDKFEm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 11 Apr 2017 01:04:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>

Hi Greg,

After merging the staging tree, today's linux-next build (powerpc
allyesconfig - I presume that an x86_64 allyesconfig will fail the
same way) failed like this:

drivers/staging/rtl8188eu/core/rtw_wlan_util.o: In function `.rtw_get_oper_ch':
(.text+0x9d0): multiple definition of `.rtw_get_oper_ch'
drivers/staging/rtl8723bs/core/rtw_wlan_util.o:(.text+0x9a0): first defined here

and many, many more ...

Presumably caused by commit

  554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

I guess this driver was copied from drivers/staging/rtl8188eu/ at some
point and modified (or they have the same ancestor) since they share a
large number of global symbols.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 11 Apr 2017 14:53:55 +1000
Subject: [PATCH] staging: disable the rtl8723bs sdio wifi driver for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/staging/rtl8723bs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
index 71450eee3b28..04706d3148d6 100644
--- a/drivers/staging/rtl8723bs/Kconfig
+++ b/drivers/staging/rtl8723bs/Kconfig
@@ -1,6 +1,7 @@
 config RTL8723BS
 	tristate "Realtek RTL8723BS SDIO Wireless LAN NIC driver"
 	depends on WLAN && MMC && CFG80211
+	depends on BROKEN
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	---help---
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
