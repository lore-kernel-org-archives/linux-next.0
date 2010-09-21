From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: brcm80211 depends on MAC80211
Date: Tue, 21 Sep 2010 09:35:49 -0700
Message-ID: <20100921093549.a39a2a8d.randy.dunlap@oracle.com>
References: <20100921170055.4512dd19.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:27012 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753740Ab0IUQh3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2010 12:37:29 -0400
In-Reply-To: <20100921170055.4512dd19.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, driverdevel <devel@driverdev.osuosl.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de, Brett Rudley <brudley@broadcom.com>, Henry Ptasinski <henryp@broadcom.com>, ohee Ko <noheek@broadcom.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix brcm890211 build: it should depend on MAC80211.
MAC80211 depends on CFG80211, which takes care of <regulatory_hint>
below.

ERROR: "ieee80211_rx_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_unregister_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_stop_queues" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_wake_queues" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_stop_tx_ba_cb_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_tx_status_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_register_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "regulatory_hint" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_alloc_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_free_hw" [drivers/staging/brcm80211/brcm80211.ko] undefined!
ERROR: "ieee80211_start_tx_ba_cb_irqsafe" [drivers/staging/brcm80211/brcm80211.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>
Cc: Henry Ptasinski <henryp@broadcom.com>
Cc: Nohee Ko <noheek@broadcom.com>
---
 drivers/staging/brcm80211/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100921.orig/drivers/staging/brcm80211/Kconfig
+++ linux-next-20100921/drivers/staging/brcm80211/Kconfig
@@ -1,6 +1,6 @@
 menuconfig BRCM80211
 	tristate "Broadcom 802.11 WLAN driver for bcm43xx chips"
-	depends on PCI && WLAN
+	depends on PCI && WLAN && MAC80211
 	select WIRELESS_EXT
 	select WEXT_PRIV
 	default N
