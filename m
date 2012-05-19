From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next v2] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Sat, 19 May 2012 09:31:11 -0700
Message-ID: <4FB7CACF.9030302@xenotime.net>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au> <4FB6ED55.6090805@xenotime.net> <20120519005031.GA27613@kroah.com> <4FB6FFBF.6000509@xenotime.net> <4FB7AB4D.5040900@mvista.com> <4FB7C028.80406@xenotime.net> <20120519161207.GA31712@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy6-pub.bluehost.com ([67.222.54.6]:43264 "HELO
	oproxy6-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751873Ab2ESQbH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 19 May 2012 12:31:07 -0400
In-Reply-To: <20120519161207.GA31712@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sergei Shtylyov <sshtylyov@mvista.com>, devel@driverdev.osuosl.org, Frank Mori Hess <fmhess@users.sourceforge.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, linux-next@vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Add stubs for some usb core functions when CONFIG_USB
is not enabled.  This fixes these comedi build errors:

ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
I am only adding the stubs that are needed for comedi to build.
I expect that more stubs will be needed as more build errors are
found.  It seems to me that linux/usb.h might need more (major)
moving of lines to support more stubs in the future.

 Documentation/usb/error-codes.txt |    2 ++
 include/linux/usb.h               |   25 ++++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

--- linux-next-20120518.orig/include/linux/usb.h
+++ linux-next-20120518/include/linux/usb.h
@@ -10,10 +10,11 @@
 
 #ifdef __KERNEL__
 
-#include <linux/errno.h>        /* for -ENODEV */
+#include <linux/errno.h>        /* for -ENODEV, -ENOSYS */
 #include <linux/delay.h>	/* for mdelay() */
 #include <linux/interrupt.h>	/* for in_interrupt() */
 #include <linux/list.h>		/* for struct list_head */
+#include <linux/kconfig.h>	/* for IS_ENABLED() */
 #include <linux/kref.h>		/* for struct kref */
 #include <linux/device.h>	/* for struct device */
 #include <linux/fs.h>		/* for struct file_operations */
@@ -515,6 +516,8 @@ static inline struct usb_device *interfa
 	return to_usb_device(intf->dev.parent);
 }
 
+#if IS_ENABLED(CONFIG_USB)
+
 extern struct usb_device *usb_get_dev(struct usb_device *dev);
 extern void usb_put_dev(struct usb_device *dev);
 
@@ -976,6 +979,26 @@ extern void usb_deregister_dev(struct us
 
 extern int usb_disabled(void);
 
+#else	/* stubs for USB not enabled */
+
+static inline int usb_register(struct usb_driver *driver)
+{
+	return -ENOSYS;
+}
+
+static inline int usb_register_driver(struct usb_driver *driver,
+				      struct module *mod,
+				      const char *modname)
+{
+	return -ENOSYS;
+}
+
+static inline void usb_deregister(struct usb_driver *driver)
+{
+}
+
+#endif
+
 /* ----------------------------------------------------------------------- */
 
 /*
--- linux-next-20120518.orig/Documentation/usb/error-codes.txt
+++ linux-next-20120518/Documentation/usb/error-codes.txt
@@ -167,6 +167,8 @@ processing, devices may receive such fau
 
 usb_register():
 -EINVAL			error during registering new driver
+-ENOSYS			CONFIG_USB is not enabled, so the function stub
+			returns an error.
 
 usb_get_*/usb_set_*():
 usb_control_msg():
