From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH] staging/comedi: fix build for USB not enabled
Date: Mon, 11 Jun 2012 16:35:50 -0700
Message-ID: <4FD680D6.8010509@xenotime.net>
References: <Pine.LNX.4.44L0.1205191026400.1348-100000@netrider.rowland.org> <4FB7C0E4.4000008@xenotime.net> <20120611230723.GA25565@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120611230723.GA25565@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, Frank Mori Hess <fmhess@users.sourceforge.net>, devel@driverdev.osuosl.org, USB list <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Calls to optional subsystems cannot be made indiscriminately.
Enclose all of the usb helper functions inside
#if IS_ENABLED(CONFIG_USB)
to fix these build errors.

(The pci helper functions are OK since there are stubs in
linux/pci.h for the called functions when PCI is not enabled.
Possibly the same could be done for the called USB functions.)

ERROR: "usb_deregister" [drivers/staging/comedi/comedi.ko] undefined!
ERROR: "usb_register_driver" [drivers/staging/comedi/comedi.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	Ian Abbott <abbotti@mev.co.uk>
Cc:	Frank Mori Hess <fmhess@users.sourceforge.net>
---
 drivers/staging/comedi/drivers.c |    5 +++++
 1 file changed, 5 insertions(+)

--- linux-next-20120518.orig/drivers/staging/comedi/drivers.c
+++ linux-next-20120518/drivers/staging/comedi/drivers.c
@@ -30,6 +30,7 @@
 #include <linux/pci.h>
 #include <linux/usb.h>
 #include <linux/errno.h>
+#include <linux/kconfig.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/fcntl.h>
@@ -981,6 +982,8 @@ void comedi_pci_driver_unregister(struct
 }
 EXPORT_SYMBOL_GPL(comedi_pci_driver_unregister);
 
+#if IS_ENABLED(CONFIG_USB)
+
 static int comedi_old_usb_auto_config(struct usb_interface *intf,
 				      struct comedi_driver *driver)
 {
@@ -1043,3 +1046,5 @@ void comedi_usb_driver_unregister(struct
 	comedi_driver_unregister(comedi_driver);
 }
 EXPORT_SYMBOL_GPL(comedi_usb_driver_unregister);
+
+#endif
