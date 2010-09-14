From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging/bcm: fix build for CONFIG_PM not enabled
Date: Tue, 14 Sep 2010 15:39:50 -0700
Message-ID: <20100914153950.6467248a.randy.dunlap@oracle.com>
References: <20100913134302.a77e9a3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:20428 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752699Ab0INWk3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2010 18:40:29 -0400
In-Reply-To: <20100913134302.a77e9a3e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, driverdevel <devel@driverdev.osuosl.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Handle build case of CONFIG_PM not being enabled.

drivers/staging/bcm/InterfaceInit.c:280: error: 'struct usb_device' has no member named 'autosuspend_delay'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/bcm/InterfaceInit.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20100913.orig/drivers/staging/bcm/InterfaceInit.c
+++ linux-next-20100913/drivers/staging/bcm/InterfaceInit.c
@@ -277,6 +277,7 @@ usbbcm_device_probe(struct usb_interface
 		/* If Suspend then only support dynamic suspend */
 		if(psAdapter->bDoSuspend)
 		{
+#ifdef CONFIG_PM
 			udev->autosuspend_delay = 0;
 			intf->needs_remote_wakeup = 1;
 #if LINUX_VERSION_CODE < KERNEL_VERSION(2, 6, 35)
@@ -290,6 +291,7 @@ usbbcm_device_probe(struct usb_interface
 #endif
 			INIT_WORK(&psIntfAdapter->usbSuspendWork, putUsbSuspend);
 			BCM_DEBUG_PRINT(psAdapter,DBG_TYPE_INITEXIT, DRV_ENTRY, DBG_LVL_ALL, "Enabling USB Auto-Suspend\n");
+#endif
 		}
 		else
 		{
