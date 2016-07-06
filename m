From: Peter Chen <hzpeterchen@gmail.com>
Subject: Re: next-20160705 build: 2 failures 6 warnings (next-20160705)
Date: Wed, 6 Jul 2016 10:31:56 +0800
Message-ID: <20160706023156.GA5081@shlinux2>
References: <E1bKMRb-0005l2-N2@optimist>
 <20160705095242.GP6247@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:34789 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752138AbcGFCjV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jul 2016 22:39:21 -0400
Content-Disposition: inline
In-Reply-To: <20160705095242.GP6247@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-usb@vger.kernel.org

On Tue, Jul 05, 2016 at 11:52:42AM +0200, Mark Brown wrote:
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

The reason for that is: USB_GADGET is m, but USB_EMXX can be 'y' due to
it is boolean although it depends on USB_GADGET. Commit 5a8d651a2
"usb: gadget: move gadget API functions to udc-core" moves gadget APIs
definitions from .h to .c causes this build error, but this change
is worthwhile. The udc driver (emxx) should can be built as module
too. Below patch should fix it:

>From 414926524cb1096d2f937f4006baa5574b01e87c Mon Sep 17 00:00:00 2001
From: Peter Chen <peter.chen@nxp.com>
Date: Wed, 6 Jul 2016 10:09:50 +0800
Subject: [PATCH 1/1] staging: emxx_udc: let the driver can be built as module

emxx_ucd depends on USB_GADGET, but USB_GADGET can be built as module,
it should can be built as module too.

It fixes below build error:

drivers/built-in.o: In function `nbu2ss_drv_probe':
binder.c:(.text+0x29438c): undefined reference to `usb_ep_set_maxpacket_limit'
binder.c:(.text+0x294468): undefined reference to `usb_ep_set_maxpacket_limit'

Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/staging/emxx_udc/Kconfig    | 2 +-
 drivers/staging/emxx_udc/emxx_udc.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/emxx_udc/Kconfig b/drivers/staging/emxx_udc/Kconfig
index cc34020..d757709 100644
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
index 3bd9175..ac13e43 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -14,6 +14,7 @@
  *  GNU General Public License for more details.
  */
 
+#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -3355,4 +3356,5 @@ static struct platform_driver udc_driver = {
 	},
 };
 
-builtin_platform_driver(udc_driver);
+module_platform_driver(udc_driver);
+MODULE_LICENSE("GPL");
-- 
1.9.1


-- 

Best Regards,
Peter Chen
