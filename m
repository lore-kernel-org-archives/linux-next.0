From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Mon, 3 Nov 2008 11:36:40 +1100
Message-ID: <20081103113640.1ad6899d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60853 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753872AbYKCAgr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 2 Nov 2008 19:36:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alexey Klimov <klimov.linux@gmail.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Douglas Schilling Landgraf <dougsland@gmail.com>

Hi Greg,

I am still getting these errors after merging the usb tree:

drivers/media/radio/radio-mr800.c: In function 'vidioc_s_frequency':
drivers/media/radio/radio-mr800.c:362: error: implicit declaration of function 'warn'
drivers/media/radio/radio-mr800.c: In function 'usb_amradio_suspend':
drivers/media/radio/radio-mr800.c:513: error: implicit declaration of function 'info'

I have been reverting these patches for a while:
	USB: remove info() macro from usb.h
	USB: remove warn() macro from usb.h

Today, I excluded those patches completely from my tree and they will
stay excluded until a fix is applied to drivers/media/radio/radio-mr800.c.

Alexey sent a patch on Oct 12 (see below).  Greg, you might as well put
this your series until Mauro or Douglas gets around to sending it to
Linus.  However, that patch does not address the warn() usage ...

Mauro, Douglas, any comment?

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Alexey Klimov <klimov.linux@gmail.com>
Date: Sun, Oct 12, 2008 at 3:05 AM
Subject: [patch] radio-mr800: remove info-macro
To: Douglas Schilling Landgraf <dougsland@gmail.com>


Hello, Douglas!
Here is the patch, that removes 3 info()-statements in radio-mr800,
and place standart printk() there.

Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>

diff -r 4092ed90412b linux/drivers/media/radio/radio-mr800.c
--- a/linux/drivers/media/radio/radio-mr800.c	Sun Oct 12 01:34:43 2008 +0400
+++ b/linux/drivers/media/radio/radio-mr800.c	Sun Oct 12 02:55:32 2008 +0400
@@ -508,7 +508,7 @@
 	if (amradio_stop(radio) < 0)
 		warn("amradio_stop() failed");
 
-	info("radio-mr800: Going into suspend..");
+	printk(KERN_INFO KBUILD_MODNAME ": Going into suspend..\n");
 
 	return 0;
 }
@@ -521,7 +521,7 @@
 	if (amradio_start(radio) < 0)
 		warn("amradio_start() failed");
 
-	info("radio-mr800: Coming out of suspend..");
+	printk(KERN_INFO KBUILD_MODNAME ": Coming out of suspend..\n");
 
 	return 0;
 }
@@ -615,7 +615,8 @@
 {
 	int retval = usb_register(&usb_amradio_driver);
 
-	info(DRIVER_VERSION " " DRIVER_DESC);
+	printk(KERN_INFO KBUILD_MODNAME ": "
+			DRIVER_VERSION " " DRIVER_DESC "\n");
 	if (retval)
 		err("usb_register failed. Error number %d", retval);
 	return retval;
