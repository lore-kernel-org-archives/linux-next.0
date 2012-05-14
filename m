From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH -next] nfc: shdlc needs to select CRC_CCITT
Date: Mon, 14 May 2012 13:13:25 -0700
Message-ID: <4FB16765.3090602@xenotime.net>
References: <20120514200357.e7448e4ca061c8efe3d4757d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120514200357.e7448e4ca061c8efe3d4757d-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>

Fix build error: SHDLC uses crc_ccitt so it should select CRC_CCITT.

ERROR: "crc_ccitt" [net/nfc/hci/hci.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc:	Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc:	Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc:	Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 net/nfc/hci/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20120514.orig/net/nfc/hci/Kconfig
+++ linux-next-20120514/net/nfc/hci/Kconfig
@@ -11,6 +11,7 @@ config NFC_SHDLC
 	depends on NFC_HCI
 	bool "SHDLC link layer for HCI based NFC drivers"
 	default n
+	select CRC_CCITT
 	---help---
 	  Say yes if you use an NFC HCI driver that requires SHDLC link layer.
 	  If unsure, say N here.
--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
