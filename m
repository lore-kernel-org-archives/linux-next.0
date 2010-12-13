From: Timur Tabi <timur@freescale.com>
Subject: [PATCH 2/2] tty: fix typos/errors in tty_driver.h comments
Date: Mon, 13 Dec 2010 14:08:53 -0600
Message-ID: <1292270933-4127-2-git-send-email-timur@freescale.com>
References: <1292270933-4127-1-git-send-email-timur@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]:23558
	"EHLO DB3EHSOBE002.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754832Ab0LMUYE (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Dec 2010 15:24:04 -0500
In-Reply-To: <1292270933-4127-1-git-send-email-timur@freescale.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org, greg@kroah.com

Fix various typos and other errors in comments of tty_driver.h.  The most
significant is the wrong name of a function for the description of
TTY_DRIVER_DYNAMIC_DEV.

Signed-off-by: Timur Tabi <timur@freescale.com>
---

This patch is for linux-next

 include/linux/tty_driver.h |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
index 09678ed..6a8a1fd 100644
--- a/include/linux/tty_driver.h
+++ b/include/linux/tty_driver.h
@@ -102,7 +102,7 @@
  * 	    unsigned int cmd, unsigned long arg);
  *
  * 	This routine allows the tty driver to implement
- *	device-specific ioctl's.  If the ioctl number passed in cmd
+ *	device-specific ioctls.  If the ioctl number passed in cmd
  * 	is not recognized by the driver, it should return ENOIOCTLCMD.
  *
  *	Optional
@@ -167,12 +167,12 @@
  * 
  * void (*hangup)(struct tty_struct *tty);
  *
- * 	This routine notifies the tty driver that it should hangup the
+ * 	This routine notifies the tty driver that it should hang up the
  * 	tty device.
  *
  *	Optional:
  *
- * int (*break_ctl)(struct tty_stuct *tty, int state);
+ * int (*break_ctl)(struct tty_struct *tty, int state);
  *
  * 	This optional routine requests the tty driver to turn on or
  * 	off BREAK status on the RS-232 port.  If state is -1,
@@ -358,7 +358,7 @@ static inline struct tty_driver *tty_driver_kref_get(struct tty_driver *d)
  * 	overruns, either.)
  *
  * TTY_DRIVER_DYNAMIC_DEV --- if set, the individual tty devices need
- *	to be registered with a call to tty_register_driver() when the
+ *	to be registered with a call to tty_register_device() when the
  *	device is found in the system and unregistered with a call to
  *	tty_unregister_device() so the devices will be show up
  *	properly in sysfs.  If not set, driver->num entries will be
-- 
1.7.2.3
