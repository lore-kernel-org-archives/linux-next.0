From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH 1/2] usb/bcma: Add missing #include <linux/slab.h>
Date: Mon, 23 Apr 2012 21:55:31 +0200
Message-ID: <1335210932-9565-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: linux-next.vger.kernel.org

m68k/allmodconfig:

drivers/usb/host/bcma-hcd.c: In function =E2=80=98bcma_hcd_probe=E2=80=99=
:
drivers/usb/host/bcma-hcd.c:234: error: implicit declaration of functio=
n =E2=80=98kzalloc=E2=80=99
drivers/usb/host/bcma-hcd.c:234: warning: assignment makes pointer from=
 integer without a cast
drivers/usb/host/bcma-hcd.c:264: error: implicit declaration of functio=
n =E2=80=98kfree=E2=80=99

Signed-off-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/6167030/
---
 drivers/usb/host/bcma-hcd.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/bcma-hcd.c b/drivers/usb/host/bcma-hcd.c
index 0b35d42..443da21 100644
--- a/drivers/usb/host/bcma-hcd.c
+++ b/drivers/usb/host/bcma-hcd.c
@@ -22,6 +22,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include <linux/usb/ehci_pdriver.h>
 #include <linux/usb/ohci_pdriver.h>
=20
--=20
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
