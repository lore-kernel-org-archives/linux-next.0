From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] usb/ssb: Add missing #include <linux/slab.h>
Date: Mon, 23 Apr 2012 21:55:32 +0200
Message-ID: <1335210932-9565-2-git-send-email-geert@linux-m68k.org>
References: <1335210932-9565-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:49163 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753395Ab2DWTzu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Apr 2012 15:55:50 -0400
In-Reply-To: <1335210932-9565-1-git-send-email-geert@linux-m68k.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hauke Mehrtens <hauke@hauke-m.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

m68k/allmodconfig:

drivers/usb/host/ssb-hcd.c: In function =E2=80=98ssb_hcd_probe=E2=80=99=
:
drivers/usb/host/ssb-hcd.c:170: error: implicit declaration of function=
 =E2=80=98kzalloc=E2=80=99
drivers/usb/host/ssb-hcd.c:170: warning: assignment makes pointer from =
integer without a cast
drivers/usb/host/ssb-hcd.c:205: error: implicit declaration of function=
 =E2=80=98kfree=E2=80=99

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/6167030/
---
 drivers/usb/host/ssb-hcd.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ssb-hcd.c b/drivers/usb/host/ssb-hcd.c
index c2e7343..c2a29fa 100644
--- a/drivers/usb/host/ssb-hcd.c
+++ b/drivers/usb/host/ssb-hcd.c
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
