From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: fix wlags49 kconfigs
Date: Fri, 30 Oct 2009 11:01:43 -0700
Message-ID: <20091030110143.2d6d76d1.rdunlap@xenotime.net>
References: <20091030200916.e9331f66.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932788AbZJ3SF5@vger.kernel.org>
In-Reply-To: <20091030200916.e9331f66.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix depends/selects in wlags49 drivers.

ERROR: "wireless_spy_update" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "iw_handler_get_spy" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "iw_handler_set_spy" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!

ERROR: "pcmcia_dev_present" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_request_irq" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_register_driver" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_request_configuration" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_request_io" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_error_ret" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_error_func" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_unregister_driver" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_disable_device" [drivers/staging/wlags49_h25/wlags49_h25_cs.ko] undefined!
ERROR: "pcmcia_dev_present" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_request_irq" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_register_driver" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_request_configuration" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_request_io" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_error_ret" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_error_func" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_unregister_driver" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!
ERROR: "pcmcia_disable_device" [drivers/staging/wlags49_h2/wlags49_h2_cs.ko] undefined!


Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/wlags49_h2/Kconfig  |    3 ++-
 drivers/staging/wlags49_h25/Kconfig |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20091030.orig/drivers/staging/wlags49_h2/Kconfig
+++ linux-next-20091030/drivers/staging/wlags49_h2/Kconfig
@@ -1,6 +1,7 @@
 config WLAGS49_H2
 	tristate "Agere Systems HERMES II Wireless PC Card Model 0110"
-	depends on WLAN_80211 && WIRELESS_EXT
+	depends on WLAN_80211 && WIRELESS_EXT && PCMCIA
+	select WEXT_SPY
 	---help---
 	  Driver for wireless cards using Agere's HERMES II chipset
 	  which are identified with Manufacture ID: 0156,0003
--- linux-next-20091030.orig/drivers/staging/wlags49_h25/Kconfig
+++ linux-next-20091030/drivers/staging/wlags49_h25/Kconfig
@@ -1,6 +1,7 @@
 config WLAGS49_H25
 	tristate "Linksys HERMES II.5 WCF54G_Wireless-G_CompactFlash_Card"
-	depends on WLAN_80211 && WIRELESS_EXT
+	depends on WLAN_80211 && WIRELESS_EXT && PCMCIA
+	select WEXT_SPY
 	---help---
 	  Driver for wireless cards using Agere's HERMES II.5 chipset
 	  which are identified with Manufacture ID: 0156,0004
