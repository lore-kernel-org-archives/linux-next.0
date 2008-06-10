From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb build failure
Date: Tue, 10 Jun 2008 11:56:03 +1000
Message-ID: <20080610115603.db3c1847.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44433 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753602AbYFJB4O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Jun 2008 21:56:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Alan Cox <alan@lxorguk.ukuu.org.uk>, Jiri Kosina <jikos@jikos.cz>

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) with the usb tree
applied failed like this:

drivers/hid/usbhid/hiddev.c: In function 'hiddev_compat_ioctl':
drivers/hid/usbhid/hiddev.c:767: warning: passing argument 1 of 'hiddev_ioctl' from incompatible pointer type
drivers/hid/usbhid/hiddev.c:767: warning: passing argument 2 of 'hiddev_ioctl' makes integer from pointer without a cast
drivers/hid/usbhid/hiddev.c:767: error: too many arguments to function 'hiddev_ioctl'

This was fixed in Jiri's hid tree on May 27 using a patch like that below
(though this patch is more complete in that it removes the now unused
inode variable).

You and Jiri should decide who is carrying the patch "USB: hiddev: Switch
to unlocked_ioctl".  Currently it is in both the usb and the hid trees.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From c273b2d199770abf6176c9413faefc733a3fd572 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 10 Jun 2008 11:53:41 +1000
Subject: [PATCH] usb: fix hiddev BLK pushdown fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/hid/usbhid/hiddev.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 527b7ef..6eb41a9 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -763,8 +763,7 @@ static long hiddev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 #ifdef CONFIG_COMPAT
 static long hiddev_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct inode *inode = file->f_path.dentry->d_inode;
-	return hiddev_ioctl(inode, file, cmd, (unsigned long)compat_ptr(arg));
+	return hiddev_ioctl(file, cmd, (unsigned long)compat_ptr(arg));
 }
 #endif
 
-- 
1.5.5.4

