From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] usb: add usb.h stubs for CONFIG_USB not enabled
Date: Fri, 18 May 2012 19:04:47 -0700
Message-ID: <4FB6FFBF.6000509@xenotime.net>
References: <20120518184943.2c762e8441e53ea24748d1b8@canb.auug.org.au>
 <4FB6ED55.6090805@xenotime.net> <20120519005031.GA27613@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <20120519005031.GA27613@kroah.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, Frank Mori Hess <fmhess@users.sourceforge.net>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

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
 include/linux/usb.h               |   24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

--- linux-next-20120518.orig/include/linux/usb.h
+++ linux-next-20120518/include/linux/usb.h
@@ -10,7 +10,7 @@
 
 #ifdef __KERNEL__
 
-#include <linux/errno.h>        /* for -ENODEV */
+#include <linux/errno.h>        /* for -ENODEV, -ENOSYS */
 #include <linux/delay.h>	/* for mdelay() */
 #include <linux/interrupt.h>	/* for in_interrupt() */
 #include <linux/list.h>		/* for struct list_head */
@@ -515,6 +515,8 @@ static inline struct usb_device *interfa
 	return to_usb_device(intf->dev.parent);
 }
 
+#if defined(CONFIG_USB) || defined(CONFIG_USB_MODULE)
+
 extern struct usb_device *usb_get_dev(struct usb_device *dev);
 extern void usb_put_dev(struct usb_device *dev);
 
@@ -976,6 +978,26 @@ extern void usb_deregister_dev(struct us
 
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
