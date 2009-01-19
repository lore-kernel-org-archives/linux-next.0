From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: linux-next: hid tree build failure
Date: Mon, 19 Jan 2009 09:23:05 +0100 (CET)
Message-ID: <alpine.LNX.1.10.0901190921470.5377@jikos.suse.cz>
References: <20090119123319.a079edbd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from styx.suse.cz ([82.119.242.94]:55964 "EHLO mail.suse.cz"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752400AbZASIXI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 03:23:08 -0500
In-Reply-To: <20090119123319.a079edbd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>

On Mon, 19 Jan 2009, Stephen Rothwell wrote:

> Hi Jiri,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/hid/usbhid/hid-core.c: In function 'hid_suspend':
> drivers/hid/usbhid/hid-core.c:1220: error: 'struct usb_device' has no member named 'auto_pm'
> drivers/hid/usbhid/hid-core.c:1245: error: 'struct usb_device' has no member named 'auto_pm'
> drivers/hid/usbhid/hid-core.c:1258: error: 'struct usb_device' has no member named 'auto_pm'

Hi Stephen,

thanks a lot for reporting this. I have applied the patch below into the 
branch that gets pulled by you.



From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH] HID: do not try to compile PM code with CONFIG_PM unset

Fixes this build breakage in case when CONFIG_PM is not set

drivers/hid/usbhid/hid-core.c: In function 'hid_suspend':
drivers/hid/usbhid/hid-core.c:1220: error: 'struct usb_device' has no member named 'auto_pm'
drivers/hid/usbhid/hid-core.c:1245: error: 'struct usb_device' has no member named 'auto_pm'
drivers/hid/usbhid/hid-core.c:1258: error: 'struct usb_device' has no member named 'auto_pm'

by throwing both the hid_suspend() and hid_resume() away completely
in such case, as they won't be used anyway.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/usbhid/hid-core.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 625e7e8..d8799a1 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1210,6 +1210,7 @@ static void hid_cease_io(struct usbhid_device *usbhid)
 	flush_scheduled_work();
 }
 
+#ifdef CONFIG_PM
 static int hid_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct hid_device *hid = usb_get_intfdata(intf);
@@ -1292,6 +1293,8 @@ static int hid_resume(struct usb_interface *intf)
 	return 0;
 }
 
+#endif /* CONFIG_PM */
+
 /* Treat USB reset pretty much the same as suspend/resume */
 static int hid_pre_reset(struct usb_interface *intf)
 {
@@ -1353,9 +1356,11 @@ static struct usb_driver hid_driver = {
 	.name =		"usbhid",
 	.probe =	hid_probe,
 	.disconnect =	hid_disconnect,
+#ifdef CONFIG_PM
 	.suspend =	hid_suspend,
 	.resume =	hid_resume,
 	.reset_resume =	hid_post_reset,
+#endif
 	.pre_reset =	hid_pre_reset,
 	.post_reset =	hid_post_reset,
 	.id_table =	hid_usb_ids,
-- 
1.5.6
