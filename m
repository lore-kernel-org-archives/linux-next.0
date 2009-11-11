From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/rtl8192u: depends on USB
Date: Wed, 11 Nov 2009 09:31:23 -0800
Message-ID: <20091111093123.f137a04c.randy.dunlap@oracle.com>
References: <20091111203159.a2a6eeeb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:19543 "EHLO
	rgminet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756164AbZKKRbr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2009 12:31:47 -0500
In-Reply-To: <20091111203159.a2a6eeeb.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

From: Randy Dunlap <randy.dunlap@oracle.com>

rtl8192u uses usb_* interfaces so it should depend on USB.

ERROR: "usb_kill_urb" [drivers/staging/rtl8192u/r8192u_usb.ko] undefined!
ERROR: "usb_deregister" [drivers/staging/rtl8192u/r8192u_usb.ko] undefined!
ERROR: "usb_control_msg" [drivers/staging/rtl8192u/r8192u_usb.ko] undefined!
ERROR: "usb_submit_urb" [drivers/staging/rtl8192u/r8192u_usb.ko] undefined!
ERROR: "usb_register_driver" [drivers/staging/rtl8192u/r8192u_usb.ko] undefined!
ERROR: "usb_free_urb" [drivers/staging/rtl8192u/r8192u_usb.ko] undefined!
ERROR: "usb_alloc_urb" [drivers/staging/rtl8192u/r8192u_usb.ko] undefined!

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/rtl8192u/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20091110.orig/drivers/staging/rtl8192u/Kconfig
+++ linux-next-20091110/drivers/staging/rtl8192u/Kconfig
@@ -1,6 +1,6 @@
 config RTL8192U
 	tristate "RealTek RTL8192U Wireless LAN NIC driver"
-	depends on PCI && WLAN
+	depends on PCI && WLAN && USB
 	depends on WIRELESS_EXT
 	default N
 	---help---
