From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build failure
Date: Wed, 13 Aug 2008 16:37:28 +1000
Message-ID: <20080813163728.08551adf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34926 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750943AbYHMGhc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 02:37:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

Hi Greg,

Today's linux-next build (powerpc ppc44x_config) failed like this:

drivers/usb/host/ohci-ppc-of.c: In function 'ohci_hcd_ppc_of_probe':
drivers/usb/host/ohci-ppc-of.c:103: error: implicit declaration of function 'usb_dbg'

Caused by commit f64f8413f2cf9f4d549c033bc546b9c3d30e78f6 ("USB: convert
the USB host controller code to use usb_dbg()").

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 13 Aug 2008 16:34:50 +1000
Subject: [PATCH] usb: fix up use of usb_dbg

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/host/ohci-ppc-of.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/host/ohci-ppc-of.c b/drivers/usb/host/ohci-ppc-of.c
index a1170e4..5b07e42 100644
--- a/drivers/usb/host/ohci-ppc-of.c
+++ b/drivers/usb/host/ohci-ppc-of.c
@@ -18,6 +18,7 @@
 
 #include <asm/prom.h>
 
+#include "../core/usb.h"
 
 static int __devinit
 ohci_ppc_of_start(struct usb_hcd *hcd)
-- 
1.5.6.3
