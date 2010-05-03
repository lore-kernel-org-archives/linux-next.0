From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] usbserial: fix mos7720 dependencies
Date: Mon, 3 May 2010 10:07:25 -0700
Message-ID: <20100503100725.c4006b32.randy.dunlap@oracle.com>
References: <20100503151619.f75e3a80.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100503151619.f75e3a80.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, gregkh-l3A5Bk7waGM@public.gmane.org
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Fix mos7720 Kconfig dependencies.
When an enabled bool selects a tristate, the tristate becomes =y,
even if it should be limited to modular, so limit the bool kconfig
option to configs that will build cleanly.
Also change the if-block to a simple depends on.

drivers/built-in.o: In function `mos7720_release':
mos7720.c:(.text+0xad432): undefined reference to `parport_remove_port'
drivers/built-in.o: In function `mos7715_parport_init':
mos7720.c:(.text+0xae197): undefined reference to `parport_register_port'
mos7720.c:(.text+0xae210): undefined reference to `parport_announce_port'
drivers/built-in.o:(.data+0x201c8): undefined reference to `parport_ieee1284_read_nibble'
drivers/built-in.o:(.data+0x201d0): undefined reference to `parport_ieee1284_read_byte'

Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/serial/Kconfig |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- linux-next-20100503.orig/drivers/usb/serial/Kconfig
+++ linux-next-20100503/drivers/usb/serial/Kconfig
@@ -425,16 +425,15 @@ config USB_SERIAL_MOS7720
 	  To compile this driver as a module, choose M here: the
 	  module will be called mos7720.
 
-if USB_SERIAL_MOS7720
 config USB_SERIAL_MOS7715_PARPORT
 	bool "Support for parallel port on the Moschip 7715"
+	depends on USB_SERIAL_MOS7720
+	depends on PARPORT=y || PARPORT=USB_SERIAL_MOS7720
 	select PARPORT_NOT_PC
-	depends on PARPORT
 	---help---
 	Say Y if you have a Moschip 7715 device and would like to use
 	the parallel port it provides.  The port will register with
 	the parport subsystem as a low-level driver.
-endif
 
 config USB_SERIAL_MOS7840
 	tristate "USB Moschip 7840/7820 USB Serial Driver"
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
