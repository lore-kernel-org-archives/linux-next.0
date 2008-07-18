From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ttydev tree build failure
Date: Fri, 18 Jul 2008 18:59:45 +1000
Message-ID: <20080718185945.858a18ee.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33605 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751685AbYGRI7r (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2008 04:59:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Greg KH <greg@kroah.com>, Aleksey Gorelov <dared1st@yahoo.com>

Hi Alan,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/usb/serial/usb_debug.c: In function 'usb_debug_open':
drivers/usb/serial/usb_debug.c:37: warning: passing argument 1 of 'usb_serial_generic_open' from incompatible pointer type
drivers/usb/serial/usb_debug.c:37: warning: passing argument 2 of 'usb_serial_generic_open' from incompatible pointer type
drivers/usb/serial/usb_debug.c:37: error: too few arguments to function 'usb_serial_generic_open'
drivers/usb/serial/usb_debug.c: At top level:
drivers/usb/serial/usb_debug.c:47: warning: initialization from incompatible pointer type

usb_debug_open was added in commit
1d051a41474c386498bc37e3ae89f7937222cfe7 ("USB: debug port converter does
not accept more than 8 byte packets") from the usb tree.

I applied the patch below and will do so until it can be resolved.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

>From 36676f026d56652cf4d42c13651373dc6a232141 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 18 Jul 2008 18:54:09 +1000
Subject: [PATCH] usb: tty API change fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/serial/usb_debug.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/usb_debug.c b/drivers/usb/serial/usb_debug.c
index 9ca4d4d..06a272b 100644
--- a/drivers/usb/serial/usb_debug.c
+++ b/drivers/usb/serial/usb_debug.c
@@ -31,10 +31,10 @@ static struct usb_driver debug_driver = {
 	.no_dynamic_id = 	1,
 };
 
-int usb_debug_open(struct usb_serial_port *port, struct file *filp)
+int usb_debug_open(struct tty_struct *tty, struct usb_serial_port *port, struct file *filp)
 {
 	port->bulk_out_size = USB_DEBUG_MAX_PACKET_SIZE;
-	return usb_serial_generic_open(port, filp);
+	return usb_serial_generic_open(tty, port, filp);
 }
 
 static struct usb_serial_driver debug_device = {
-- 
1.5.6.2
