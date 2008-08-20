From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: input tree build failure
Date: Wed, 20 Aug 2008 15:49:24 +1000
Message-ID: <20080820154924.51ac3495.sfr@canb.auug.org.au>
References: <20080819163148.159c7d8c.sfr@canb.auug.org.au>
	<20080819200057.GD10502@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36963 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751304AbYHTFta (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Aug 2008 01:49:30 -0400
In-Reply-To: <20080819200057.GD10502@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-next@vger.kernel.org, "Alfred E. Heggestad" <aeh@db.org>

Hi Greg, Dmitry,

On Tue, 19 Aug 2008 13:00:57 -0700 Greg KH <greg@kroah.com> wrote:
>
> No, these should all use dev_info() instead.
> 
> Actually, they should all use dev_dbg() and drop the #if entirely.  With
> the dynamic dev_dbg() patch that is in -next, that will work just fine,
> no need to rebuild modules which is almost impossible for most users to
> do.

Today I used the following patch instead.  Dmitry, this should be able to
be applied to your tree (I think) assuming that it is OK.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 066af730859c2c2ce2c6a76d21edded33414b735 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 20 Aug 2008 15:40:08 +1000
Subject: [PATCH] input/cm109: fix up for info() removal

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/input/misc/cm109.c |   31 +++++++++++++++----------------
 1 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index 404fd49..a4771cc 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -311,14 +311,12 @@ static void cm109_urb_irq_callback(struct urb *urb)
 	const int status = urb->status;
 	int error;
 
-#if CM109_DEBUG
-	info("### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x",
+	dev_dbg(&urb->dev->dev, "### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x",
 	     dev->irq_data->byte[0],
 	     dev->irq_data->byte[1],
 	     dev->irq_data->byte[2],
 	     dev->irq_data->byte[3],
 	     dev->keybit);
-#endif
 
 	if (status) {
 		if (status == -ESHUTDOWN)
@@ -383,13 +381,11 @@ static void cm109_urb_ctl_callback(struct urb *urb)
 	const int status = urb->status;
 	int error;
 
-#if CM109_DEBUG
-	info("### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]",
+	dev_dbg(&urb->dev->dev, "### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]",
 	     dev->ctl_data->byte[0],
 	     dev->ctl_data->byte[1],
 	     dev->ctl_data->byte[2],
 	     dev->ctl_data->byte[3]);
-#endif
 
 	if (status)
 		err("%s: urb status %d", __func__, status);
@@ -549,9 +545,7 @@ static int cm109_input_ev(struct input_dev *idev, unsigned int type,
 {
 	struct cm109_dev *dev = input_get_drvdata(idev);
 
-#if CM109_DEBUG
-	info("input_ev: type=%u code=%u value=%d", type, code, value);
-#endif
+	dev_dbg(&idev->dev, "input_ev: type=%u code=%u value=%d", type, code, value);
 
 	if (type != EV_SND)
 		return -EINVAL;
@@ -765,7 +759,7 @@ static int cm109_usb_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct cm109_dev *dev = usb_get_intfdata(intf);
 
-	info("cm109: usb_suspend (event=%d)", message.event);
+	dev_info(&intf->dev, "cm109: usb_suspend (event=%d)", message.event);
 
 	mutex_lock(&dev->pm_mutex);
 	cm109_stop_traffic(dev);
@@ -778,7 +772,7 @@ static int cm109_usb_resume(struct usb_interface *intf)
 {
 	struct cm109_dev *dev = usb_get_intfdata(intf);
 
-	info("cm109: usb_resume");
+	dev_info(&intf->dev, "cm109: usb_resume");
 
 	mutex_lock(&dev->pm_mutex);
 	cm109_restore_state(dev);
@@ -837,15 +831,19 @@ static int __init cm109_select_keymap(void)
 	/* Load the phone keymap */
 	if (!strcasecmp(phone, "kip1000")) {
 		keymap = keymap_kip1000;
-		info("Keymap for Komunikate KIP1000 phone loaded");
+		printk(KERN_INFO KBUILD_MODNAME ": "
+			"Keymap for Komunikate KIP1000 phone loaded");
 	} else if (!strcasecmp(phone, "gtalk")) {
 		keymap = keymap_gtalk;
-		info("Keymap for Genius G-talk phone loaded");
+		printk(KERN_INFO KBUILD_MODNAME ": "
+			"Keymap for Genius G-talk phone loaded");
 	} else if (!strcasecmp(phone, "usbph01")) {
 		keymap = keymap_usbph01;
-		info("Keymap for Allied-Telesis Corega USBPH01 phone loaded");
+		printk(KERN_INFO KBUILD_MODNAME ": "
+			"Keymap for Allied-Telesis Corega USBPH01 phone loaded");
 	} else {
-		err("Unsupported phone: %s", phone);
+		printk(KERN_ERR KBUILD_MODNAME ": "
+			"Unsupported phone: %s", phone);
 		return -EINVAL;
 	}
 
@@ -864,7 +862,8 @@ static int __init cm109_init(void)
 	if (err)
 		return err;
 
-	info(DRIVER_DESC ": " DRIVER_VERSION " (C) " DRIVER_AUTHOR);
+	printk(KERN_INFO KBUILD_MODNAME ": "
+		DRIVER_DESC ": " DRIVER_VERSION " (C) " DRIVER_AUTHOR);
 
 	return 0;
 }
-- 
1.5.6.3
