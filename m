From: "Alfred E. Heggestad" <aeh@db.org>
Subject: Re: linux-next: input tree build failure
Date: Sat, 23 Aug 2008 00:15:06 +0200
Message-ID: <48AF3A6A.6040505@db.org>
References: <20080819163148.159c7d8c.sfr@canb.auug.org.au> <20080819200057.GD10502@kroah.com> <20080820154924.51ac3495.sfr@canb.auug.org.au> <20080822162832.ZZRA012@mailhub.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from submit-tmp.sysedata.no ([195.159.29.133]:53091 "EHLO
	submit-tmp.sysedata.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752018AbYHVWui (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Aug 2008 18:50:38 -0400
In-Reply-To: <20080822162832.ZZRA012@mailhub.coreip.homeip.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org

Dmitry Torokhov wrote:
> On Wed, Aug 20, 2008 at 03:49:24PM +1000, Stephen Rothwell wrote:
>> Hi Greg, Dmitry,
>>
>> On Tue, 19 Aug 2008 13:00:57 -0700 Greg KH <greg@kroah.com> wrote:
>>> No, these should all use dev_info() instead.
>>>
>>> Actually, they should all use dev_dbg() and drop the #if entirely.  With
>>> the dynamic dev_dbg() patch that is in -next, that will work just fine,
>>> no need to rebuild modules which is almost impossible for most users to
>>> do.
>> Today I used the following patch instead.  Dmitry, this should be able to
>> be applied to your tree (I think) assuming that it is OK.
>>
> 
> Applied, thank you Stephen.
> 

I have tested the linux-next kernel on my i386 laptop with a
CM109 device (Komunikate KIP1000) and it is still working.

This patch does some minor cleanups, and adds the missing
newline to some debug statements.


Signed-off-by: Alfred E. Heggestad <aeh@db.org>
Tested-by: Alfred E. Heggestad <aeh@db.org>
---
diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
index 0a11029..3d3cc2d 100644
--- a/drivers/input/misc/cm109.c
+++ b/drivers/input/misc/cm109.c
@@ -36,8 +36,6 @@
 #include <linux/rwsem.h>
 #include <linux/usb/input.h>
 
-#define CM109_DEBUG 0
-
 #define DRIVER_VERSION "20080805"
 #define DRIVER_AUTHOR  "Alfred E. Heggestad"
 #define DRIVER_DESC    "CM109 phone driver"
@@ -311,7 +309,7 @@ static void cm109_urb_irq_callback(struct urb *urb)
 	const int status = urb->status;
 	int error;
 
-	dev_dbg(&urb->dev->dev, "### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x",
+	dev_dbg(&urb->dev->dev, "### URB IRQ: [0x%02x 0x%02x 0x%02x 0x%02x] keybit=0x%02x\n",
 	     dev->irq_data->byte[0],
 	     dev->irq_data->byte[1],
 	     dev->irq_data->byte[2],
@@ -381,7 +379,7 @@ static void cm109_urb_ctl_callback(struct urb *urb)
 	const int status = urb->status;
 	int error;
 
-	dev_dbg(&urb->dev->dev, "### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]",
+	dev_dbg(&urb->dev->dev, "### URB CTL: [0x%02x 0x%02x 0x%02x 0x%02x]\n",
 	     dev->ctl_data->byte[0],
 	     dev->ctl_data->byte[1],
 	     dev->ctl_data->byte[2],
@@ -545,7 +543,7 @@ static int cm109_input_ev(struct input_dev *idev, unsigned int type,
 {
 	struct cm109_dev *dev = input_get_drvdata(idev);
 
-	dev_dbg(&idev->dev, "input_ev: type=%u code=%u value=%d", type, code, value);
+	dev_dbg(&idev->dev, "input_ev: type=%u code=%u value=%d\n", type, code, value);
 
 	if (type != EV_SND)
 		return -EINVAL;
@@ -759,8 +757,6 @@ static int cm109_usb_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct cm109_dev *dev = usb_get_intfdata(intf);
 
-	dev_info(&intf->dev, "cm109: usb_suspend (event=%d)", message.event);
-
 	mutex_lock(&dev->pm_mutex);
 	cm109_stop_traffic(dev);
 	mutex_unlock(&dev->pm_mutex);
@@ -772,8 +768,6 @@ static int cm109_usb_resume(struct usb_interface *intf)
 {
 	struct cm109_dev *dev = usb_get_intfdata(intf);
 
-	dev_info(&intf->dev, "cm109: usb_resume");
-
 	mutex_lock(&dev->pm_mutex);
 	cm109_restore_state(dev);
 	mutex_unlock(&dev->pm_mutex);
@@ -832,18 +826,18 @@ static int __init cm109_select_keymap(void)
 	if (!strcasecmp(phone, "kip1000")) {
 		keymap = keymap_kip1000;
 		printk(KERN_INFO KBUILD_MODNAME ": "
-			"Keymap for Komunikate KIP1000 phone loaded");
+			"Keymap for Komunikate KIP1000 phone loaded\n");
 	} else if (!strcasecmp(phone, "gtalk")) {
 		keymap = keymap_gtalk;
 		printk(KERN_INFO KBUILD_MODNAME ": "
-			"Keymap for Genius G-talk phone loaded");
+			"Keymap for Genius G-talk phone loaded\n");
 	} else if (!strcasecmp(phone, "usbph01")) {
 		keymap = keymap_usbph01;
 		printk(KERN_INFO KBUILD_MODNAME ": "
-			"Keymap for Allied-Telesis Corega USBPH01 phone loaded");
+			"Keymap for Allied-Telesis Corega USBPH01 phone loaded\n");
 	} else {
 		printk(KERN_ERR KBUILD_MODNAME ": "
-			"Unsupported phone: %s", phone);
+			"Unsupported phone: %s\n", phone);
 		return -EINVAL;
 	}
 
@@ -863,7 +857,7 @@ static int __init cm109_init(void)
 		return err;
 
 	printk(KERN_INFO KBUILD_MODNAME ": "
-		DRIVER_DESC ": " DRIVER_VERSION " (C) " DRIVER_AUTHOR);
+		DRIVER_DESC ": " DRIVER_VERSION " (C) " DRIVER_AUTHOR "\n");
 
 	return 0;
 }
