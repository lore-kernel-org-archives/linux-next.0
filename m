From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [BUILD FAILURE 11/12] Next April 21 : PPC64 randconfig [drivers/usb/host/ohci-hcd.o]
Date: Wed, 22 Apr 2009 09:30:00 +0200
Message-ID: <200904220930.01735.arnd@arndb.de>
References: <1240340081.9110.144.camel@subratamodak.linux.ibm.com> <200904211919.38104.david-b@pacbell.net> <49EE8855.1080306@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49EE8855.1080306-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: David Brownell <david-b-yBeKhBN/0LDR7s880joybQ@public.gmane.org>, Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, subrata-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linuxppc-dev <Linuxppc-dev-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sachinp <sachinp-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexander Beregalov <a.beregalov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, samr <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Wednesday 22 April 2009, Randy Dunlap wrote:
> > Is there maybe a way to force Kconfig to just reject
> > such illegal configs -- neither option set -- rather
> > than trying some how to fix it?
>=20
> Not that I know of. =A0cc-ing Sam.

We could just make the USB_OHCI_HCD_PPC_OF option implicit
and selected only if at least one of USB_OHCI_HCD_PPC_OF_BE
and USB_OHCI_HCD_PPC_OF_LE are set.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 845479f..07e3e25 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -161,26 +161,26 @@ config USB_OHCI_HCD_PPC_SOC
 	  Enables support for the USB controller on the MPC52xx or
 	  STB03xxx processor chip.  If unsure, say Y.
=20
-config USB_OHCI_HCD_PPC_OF
-	bool "OHCI support for PPC USB controller on OF platform bus"
-	depends on USB_OHCI_HCD && PPC_OF
-	default y
-	---help---
-	  Enables support for the USB controller PowerPC present on the
-	  OpenFirmware platform bus.
-
 config USB_OHCI_HCD_PPC_OF_BE
-	bool "Support big endian HC"
-	depends on USB_OHCI_HCD_PPC_OF
-	default y
+	bool "OHCI support for OF platform bus (big endian)"
+	depends on USB_OHCI_HCD && PPC_OF
 	select USB_OHCI_BIG_ENDIAN_DESC
 	select USB_OHCI_BIG_ENDIAN_MMIO
+	---help---
+	  Enables support for big-endian USB controllers present on the
+	  OpenFirmware platform bus.
=20
 config USB_OHCI_HCD_PPC_OF_LE
-	bool "Support little endian HC"
-	depends on USB_OHCI_HCD_PPC_OF
-	default n
+	bool "OHCI support for OF platform bus (little endian)"
+	depends on USB_OHCI_HCD && PPC_OF
 	select USB_OHCI_LITTLE_ENDIAN
+	---help---
+	  Enables support for little-endian USB controllers present on the
+	  OpenFirmware platform bus.
+
+config USB_OHCI_HCD_PPC_OF
+	bool
+	default USB_OHCI_HCD_PPC_OF_BE || USB_OHCI_HCD_PPC_OF_LE
=20
 config USB_OHCI_HCD_PCI
 	bool "OHCI support for PCI-bus USB controllers"
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
