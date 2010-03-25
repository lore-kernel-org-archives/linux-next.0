From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH 2/3 -next] usb: fix serial build when SYSRQ is disabled
Date: Thu, 25 Mar 2010 11:29:16 -0700
Message-ID: <4BABAB7C.5000006@oracle.com>
References: <20100325173853.f06a7b33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100325173853.f06a7b33.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@suse.de>, linux-usb <linux-usb@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build error when CONFIG_MAGIC_SYSRQ is not enabled:

drivers/usb/serial/generic.c:566: error: implicit declaration of function 'handle_sysrq'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/serial/generic.c |    9 +++++++++
 1 file changed, 9 insertions(+)

--- linux-next-20100325.orig/drivers/usb/serial/generic.c
+++ linux-next-20100325/drivers/usb/serial/generic.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
+#include <linux/sysrq.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
 #include <linux/module.h>
@@ -558,6 +559,7 @@ void usb_serial_generic_unthrottle(struc
 	}
 }
 
+#ifdef CONFIG_MAGIC_SYSRQ
 int usb_serial_handle_sysrq_char(struct tty_struct *tty,
 			struct usb_serial_port *port, unsigned int ch)
 {
@@ -571,6 +573,13 @@ int usb_serial_handle_sysrq_char(struct 
 	}
 	return 0;
 }
+#else
+int usb_serial_handle_sysrq_char(struct tty_struct *tty,
+			struct usb_serial_port *port, unsigned int ch)
+{
+	return 0;
+}
+#endif
 EXPORT_SYMBOL_GPL(usb_serial_handle_sysrq_char);
 
 int usb_serial_handle_break(struct usb_serial_port *port)
