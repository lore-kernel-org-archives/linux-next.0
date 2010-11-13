From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] iwlwifi: fix modular legacy build errors
Date: Sat, 13 Nov 2010 08:44:31 -0800
Message-ID: <20101113084431.d72d096a.randy.dunlap@oracle.com>
References: <20101112130547.c2a3c2c1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101112130547.c2a3c2c1.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, akpm <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org, einette Chatre <reinette.chatre-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Wey-Yi Guy <wey-yi.w.guy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

With CONFIG_IWLWIFI=m, CONFIG_IWLAGN=m, and CONFIG_IWL3945=m,
a kernel build has errors as below.  Changing a few lines in the
Makefile is one possible fix for these build errors.

ERROR: "iwl_legacy_mac_config" [drivers/net/wireless/iwlwifi/iwl3945.ko] undefined!
ERROR: "iwl_isr_legacy" [drivers/net/wireless/iwlwifi/iwl3945.ko] undefined!
ERROR: "iwl_legacy_tx_cmd_protection" [drivers/net/wireless/iwlwifi/iwl3945.ko] undefined!
ERROR: "iwl_legacy_mac_bss_info_changed" [drivers/net/wireless/iwlwifi/iwl3945.ko] undefined!
ERROR: "iwl_legacy_mac_reset_tsf" [drivers/net/wireless/iwlwifi/iwl3945.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc:	Reinette Chatre <reinette.chatre-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc:	Wey-Yi Guy <wey-yi.w.guy-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
---
 drivers/net/wireless/iwlwifi/Makefile |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

--- linux-next-20101112.orig/drivers/net/wireless/iwlwifi/Makefile
+++ linux-next-20101112/drivers/net/wireless/iwlwifi/Makefile
@@ -2,8 +2,6 @@ obj-$(CONFIG_IWLWIFI)	+= iwlcore.o
 iwlcore-objs 		:= iwl-core.o iwl-eeprom.o iwl-hcmd.o iwl-power.o
 iwlcore-objs 		+= iwl-rx.o iwl-tx.o iwl-sta.o
 iwlcore-objs 		+= iwl-scan.o iwl-led.o
-iwlcore-$(CONFIG_IWL3945) += iwl-legacy.o
-iwlcore-$(CONFIG_IWL4965) += iwl-legacy.o
 iwlcore-$(CONFIG_IWLWIFI_DEBUGFS) += iwl-debugfs.o
 iwlcore-$(CONFIG_IWLWIFI_DEVICE_TRACING) += iwl-devtrace.o
 
@@ -17,7 +15,7 @@ iwlagn-objs		+= iwl-agn-lib.o iwl-agn-rx
 iwlagn-objs		+= iwl-agn-tt.o iwl-agn-sta.o iwl-agn-eeprom.o
 iwlagn-$(CONFIG_IWLWIFI_DEBUGFS) += iwl-agn-debugfs.o
 
-iwlagn-$(CONFIG_IWL4965) += iwl-4965.o
+iwlagn-$(CONFIG_IWL4965) += iwl-4965.o iwl-legacy.o
 iwlagn-$(CONFIG_IWL5000) += iwl-agn-rxon.o iwl-agn-hcmd.o iwl-agn-ict.o
 iwlagn-$(CONFIG_IWL5000) += iwl-5000.o
 iwlagn-$(CONFIG_IWL5000) += iwl-6000.o
@@ -25,7 +23,7 @@ iwlagn-$(CONFIG_IWL5000) += iwl-1000.o
 
 # 3945
 obj-$(CONFIG_IWL3945)	+= iwl3945.o
-iwl3945-objs		:= iwl3945-base.o iwl-3945.o iwl-3945-rs.o iwl-3945-led.o
+iwl3945-objs		:= iwl3945-base.o iwl-3945.o iwl-3945-rs.o iwl-3945-led.o iwl-legacy.o
 iwl3945-$(CONFIG_IWLWIFI_DEBUGFS) += iwl-3945-debugfs.o
 
 ccflags-y += -D__CHECK_ENDIAN__
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
