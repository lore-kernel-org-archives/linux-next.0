From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] staging: ozwpan depends on NET
Date: Wed, 14 Mar 2012 10:02:39 -0700
Message-ID: <4F60CF2F.5050505@xenotime.net>
References: <20120314181921.59451eca117c276461f7dc28@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120314181921.59451eca117c276461f7dc28@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Chris Kelly <ckelly@ozmodevices.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Fix build errors:  add depends on NET.

ERROR: "skb_clone" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "dev_get_by_name" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "dev_remove_pack" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "init_net" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "__alloc_skb" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "kfree_skb" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "dev_add_pack" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "consume_skb" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "dev_queue_xmit" [drivers/staging/ozwpan/ozwpan.ko] undefined!
ERROR: "skb_put" [drivers/staging/ozwpan/ozwpan.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc: Chris Kelly <ckelly@ozmodevices.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/ozwpan/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120314.orig/drivers/staging/ozwpan/Kconfig
+++ linux-next-20120314/drivers/staging/ozwpan/Kconfig
@@ -1,6 +1,6 @@
 config USB_WPAN_HCD
 	tristate "USB over WiFi Host Controller"
-	depends on USB
+	depends on USB && NET
 	help
 	  A driver for USB Host Controllers that are compatible with
 	  Ozmo Devices USB over WiFi technology.
