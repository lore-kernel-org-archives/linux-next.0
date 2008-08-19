From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: input tree build failure
Date: Tue, 19 Aug 2008 16:31:48 +1000
Message-ID: <20080819163148.159c7d8c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47765 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752095AbYHSGbz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 19 Aug 2008 02:31:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, "Alfred E. Heggestad" <aeh@db.org>

Hi Dmitry,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/input/misc/cm109.c: In function 'cm109_usb_suspend':
drivers/input/misc/cm109.c:768: error: implicit declaration of function 'info'

Caused by commit c04148f915e5ba7947752e6348e0da4cdab1329e ("Input: add
driver for USB VoIP phones with CM109 chipset") adding a usage of the info
() function while commit 8aac48f4f2460b00468fd5f1101addf3df04e94c ("USB:
remove info() macro from usb.h") from the usb tree removed it.

I applied the following patch (which may not be the best).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 2a58297038a91ef5ffba3df4a5bd7576735ca205 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 19 Aug 2008 16:28:15 +1000
Subject: [PATCH] input/cm109: fix up for info() removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/input/misc/cm109.c |   26 +++++++++++++++++---------
 1 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index 404fd49..595b3b1 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -312,7 +312,8 @@ static void cm109_urb_irq_callback(struct urb *urb)
 	int error;
 
 #if CM109_DEBUG
-	info("### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x",
+	printk(KERN_INFO KBUILD_MODNAME ": "
+	     "### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x",
 	     dev->irq_data->byte[0],
 	     dev->irq_data->byte[1],
 	     dev->irq_data->byte[2],
@@ -384,7 +385,8 @@ static void cm109_urb_ctl_callback(struct urb *urb)
 	int error;
 
 #if CM109_DEBUG
-	info("### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]",
+	printk(KERN_INFO KBUILD_MODNAME ": "
+	     "### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]",
 	     dev->ctl_data->byte[0],
 	     dev->ctl_data->byte[1],
 	     dev->ctl_data->byte[2],
@@ -550,7 +552,8 @@ static int cm109_input_ev(struct input_dev *idev, unsigned int type,
 	struct cm109_dev *dev = input_get_drvdata(idev);
 
 #if CM109_DEBUG
-	info("input_ev: type=%u code=%u value=%d", type, code, value);
+	printk(KERN_INFO KBUILD_MODNAME ": "
+	       "input_ev: type=%u code=%u value=%d", type, code, value);
 #endif
 
 	if (type != EV_SND)
@@ -765,7 +768,8 @@ static int cm109_usb_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct cm109_dev *dev = usb_get_intfdata(intf);
 
-	info("cm109: usb_suspend (event=%d)", message.event);
+	printk(KERN_INFO KBUILD_MODNAME ": usb_suspend (event=%d)",
+		message.event);
 
 	mutex_lock(&dev->pm_mutex);
 	cm109_stop_traffic(dev);
@@ -778,7 +782,7 @@ static int cm109_usb_resume(struct usb_interface *intf)
 {
 	struct cm109_dev *dev = usb_get_intfdata(intf);
 
-	info("cm109: usb_resume");
+	printk(KERN_INFO KBUILD_MODNAME ": usb_resume");
 
 	mutex_lock(&dev->pm_mutex);
 	cm109_restore_state(dev);
@@ -837,13 +841,16 @@ static int __init cm109_select_keymap(void)
 	/* Load the phone keymap */
 	if (!strcasecmp(phone, "kip1000")) {
 		keymap = keymap_kip1000;
-		info("Keymap for Komunikate KIP1000 phone loaded");
+		printk(KERN_INFO KBUILD_MODNAME ": "
+		       "Keymap for Komunikate KIP1000 phone loaded");
 	} else if (!strcasecmp(phone, "gtalk")) {
 		keymap = keymap_gtalk;
-		info("Keymap for Genius G-talk phone loaded");
+		printk(KERN_INFO KBUILD_MODNAME ": "
+		       "Keymap for Genius G-talk phone loaded");
 	} else if (!strcasecmp(phone, "usbph01")) {
 		keymap = keymap_usbph01;
-		info("Keymap for Allied-Telesis Corega USBPH01 phone loaded");
+		printk(KERN_INFO KBUILD_MODNAME ": "
+		       "Keymap for Allied-Telesis Corega USBPH01 phone loaded");
 	} else {
 		err("Unsupported phone: %s", phone);
 		return -EINVAL;
@@ -864,7 +871,8 @@ static int __init cm109_init(void)
 	if (err)
 		return err;
 
-	info(DRIVER_DESC ": " DRIVER_VERSION " (C) " DRIVER_AUTHOR);
+	printk(KERN_INFO KBUILD_MODNAME ": "
+	       DRIVER_DESC ": " DRIVER_VERSION " (C) " DRIVER_AUTHOR);
 
 	return 0;
 }
-- 
1.5.6.3
