From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next] wusb: hwa-hc: Drop unused pci_suspend/resume hooks.
Date: Thu, 30 Apr 2009 17:41:02 +0900
Message-ID: <20090430084101.GA11696@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:43481 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756086AbZD3IqW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Apr 2009 04:46:22 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, David Vrabel <david.vrabel@csr.com>, Greg Kroah-Hartman <gregkh@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>

  CC      drivers/usb/host/hwa-hc.o
drivers/usb/host/hwa-hc.c:601: warning: initialization from incompatible pointer type
drivers/usb/host/hwa-hc.c:602: warning: initialization from incompatible pointer type

The prototype for these changed, so the message itself was dropped. As the only
thing these hooks were doing was printing out the message for debugging, there
is not much point in keeping them around. So, just kill them off.

Cc: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>
Cc: David Vrabel <david.vrabel@csr.com>
Cc: Greg Kroah-Hartman <gregkh@suse.de>
Signed-off-by: Paul Mundt <lethal@linux-sh.org>

---

 drivers/usb/host/hwa-hc.c |   21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/usb/host/hwa-hc.c b/drivers/usb/host/hwa-hc.c
index cbf30e5..88b0321 100644
--- a/drivers/usb/host/hwa-hc.c
+++ b/drivers/usb/host/hwa-hc.c
@@ -172,25 +172,6 @@ error_cluster_id_get:
 
 }
 
-static int hwahc_op_suspend(struct usb_hcd *usb_hcd, pm_message_t msg)
-{
-	struct wusbhc *wusbhc = usb_hcd_to_wusbhc(usb_hcd);
-	struct hwahc *hwahc = container_of(wusbhc, struct hwahc, wusbhc);
-	dev_err(wusbhc->dev, "%s (%p [%p], 0x%lx) UNIMPLEMENTED\n", __func__,
-		usb_hcd, hwahc, *(unsigned long *) &msg);
-	return -ENOSYS;
-}
-
-static int hwahc_op_resume(struct usb_hcd *usb_hcd)
-{
-	struct wusbhc *wusbhc = usb_hcd_to_wusbhc(usb_hcd);
-	struct hwahc *hwahc = container_of(wusbhc, struct hwahc, wusbhc);
-
-	dev_err(wusbhc->dev, "%s (%p [%p]) UNIMPLEMENTED\n", __func__,
-		usb_hcd, hwahc);
-	return -ENOSYS;
-}
-
 /*
  * No need to abort pipes, as when this is called, all the children
  * has been disconnected and that has done it [through
@@ -598,8 +579,6 @@ static struct hc_driver hwahc_hc_driver = {
 	.flags = HCD_USB2,		/* FIXME */
 	.reset = hwahc_op_reset,
 	.start = hwahc_op_start,
-	.pci_suspend = hwahc_op_suspend,
-	.pci_resume = hwahc_op_resume,
 	.stop = hwahc_op_stop,
 	.get_frame_number = hwahc_op_get_frame_number,
 	.urb_enqueue = hwahc_op_urb_enqueue,
