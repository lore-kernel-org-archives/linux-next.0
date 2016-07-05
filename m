From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH, RESEND] staging: emxx_udc: allow modular build
Date: Tue, 05 Jul 2016 12:00:49 +0200
Message-ID: <4551753.qTqdp3sOje@wuerfel>
References: <E1bKMRb-0005l2-N2@optimist> <20160705095242.GP6247@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:63480 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752664AbcGEJ6H (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jul 2016 05:58:07 -0400
In-Reply-To: <20160705095242.GP6247@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

A change to the usb gadget core allowed certain API functions to be
part of a loadable module, which breaks having emxx_udc built-in:

drivers/staging/built-in.o: In function `nbu2ss_drv_probe':
(.text+0x2428): undefined reference to `usb_ep_set_maxpacket_limit'

The original patch already fixed tons of other cases that have the
added dependency but apparently missed this one that now appears
in an ARM allmodconfig build.

This patch makes the symbol "tristate", which lets the Kconfig
dependency tracking handle it correctly. To make the module
actually usable, I also revert 0af61e66ee16 ("drivers/staging:
make emxx_udc.c explicitly non-modular"), which Paul Gortmaker
added after noticing that the Kconfig symbol was 'bool'.
Compared to the original version however, I leave out the
'__exit' annotation on the remove callback, as Paul pointed
out that this was incorrect.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 5a8d651a2bde ("usb: gadget: move gadget API functions to udc-core")
---
On Tuesday, July 5, 2016 11:52:42 AM CEST Mark Brown wrote:
> On Tue, Jul 05, 2016 at 10:15:03AM +0100, Build bot for Mark Brown wrote:
> 
> For the past little while both arm and arm64 allmodconfig builds have
> been failing with:
> 
> > drivers/built-in.o: In function `nbu2ss_drv_probe':
> > binder.c:(.text+0x29438c): undefined reference to `usb_ep_set_maxpacket_limit'
> > binder.c:(.text+0x294468): undefined reference to `usb_ep_set_maxpacket_limit'
> 
> That function is a static inline in linux/usb/gadget.h which does seem
> to be included (the driver builds fine) so I'm not entirely sure why
> this is failing - I've not had time to investigate properly, I don't
> know if the compiler is misfiring here.
> 

This is the patch I sent for it when it first appeared:

https://lkml.org/lkml/2016/6/23/528

diff --git a/drivers/staging/emxx_udc/Kconfig b/drivers/staging/emxx_udc/Kconfig
index cc3402020487..d7577096fb25 100644
--- a/drivers/staging/emxx_udc/Kconfig
+++ b/drivers/staging/emxx_udc/Kconfig
@@ -1,5 +1,5 @@
 config USB_EMXX
-	bool "EMXX USB Function Device Controller"
+	tristate "EMXX USB Function Device Controller"
  	depends on USB_GADGET && (ARCH_SHMOBILE || (ARM && COMPILE_TEST))
 	help
 	   The Emma Mobile series of SoCs from Renesas Electronics and
diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index 3bd91758b2da..3b56b2826263 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -15,7 +15,7 @@
  */
 
 #include <linux/kernel.h>
-#include <linux/init.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/ioport.h>
@@ -39,9 +39,11 @@
 
 #include "emxx_udc.h"
 
+#define	DRIVER_DESC	"EMXX UDC driver"
 #define	DMA_ADDR_INVALID	(~(dma_addr_t)0)
 
 static const char	driver_name[] = "emxx_udc";
+static const char	driver_desc[] = DRIVER_DESC;
 
 /*===========================================================================*/
 /* Prototype */
@@ -3296,6 +3298,28 @@ static void nbu2ss_drv_shutdown(struct platform_device *pdev)
 }
 
 /*-------------------------------------------------------------------------*/
+static int nbu2ss_drv_remove(struct platform_device *pdev)
+{
+	struct nbu2ss_udc	*udc;
+	struct nbu2ss_ep	*ep;
+	int	i;
+
+	udc = &udc_controller;
+
+	for (i = 0; i < NUM_ENDPOINTS; i++) {
+		ep = &udc->ep[i];
+		if (ep->virt_buf)
+			dma_free_coherent(NULL, PAGE_SIZE,
+				(void *)ep->virt_buf, ep->phys_buf);
+	}
+
+	/* Interrupt Handler - Release */
+	free_irq(INT_VBUS, udc);
+
+	return 0;
+}
+
+/*-------------------------------------------------------------------------*/
 static int nbu2ss_drv_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct nbu2ss_udc	*udc;
@@ -3347,12 +3371,16 @@ static int nbu2ss_drv_resume(struct platform_device *pdev)
 static struct platform_driver udc_driver = {
 	.probe		= nbu2ss_drv_probe,
 	.shutdown	= nbu2ss_drv_shutdown,
+	.remove		= nbu2ss_drv_remove,
 	.suspend	= nbu2ss_drv_suspend,
 	.resume		= nbu2ss_drv_resume,
 	.driver		= {
-		.name			= driver_name,
-		.suppress_bind_attrs	= true,
+		.name	= driver_name,
 	},
 };
 
-builtin_platform_driver(udc_driver);
+module_platform_driver(udc_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_AUTHOR("Renesas Electronics Corporation");
+MODULE_LICENSE("GPL");
