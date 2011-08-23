From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the moduleh tree
Date: Tue, 23 Aug 2011 15:08:54 +1000
Message-ID: <20110823150854.2f6da7f66247c3d31b07e072@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50247 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750862Ab1HWFJA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Aug 2011 01:09:00 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Greg KH <greg@kroah.com>

Hi Paul,

After merging the moduleh tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/usb/dwc3/dwc3-pci.c: In function 'dwc3_pci_init':
drivers/usb/dwc3/dwc3-pci.c:211:9: error: 'THIS_MODULE' undeclared (first use in this function)

Caused by the interaction of the module.h split up with commit
72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver") from the usb
tree.

I have applied this patch for today (Greg, this should be applied to your
tree):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 23 Aug 2011 15:05:25 +1000
Subject: [PATCH] usb: include module.h in the DesignWare USB3 DRD driver

Fixes this build error:

drivers/usb/dwc3/dwc3-pci.c: In function 'dwc3_pci_init':
drivers/usb/dwc3/dwc3-pci.c:211:9: error: 'THIS_MODULE' undeclared (first use in this function)

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/dwc3/dwc3-pci.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 2578595..e3b77d2 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -38,6 +38,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-- 
1.7.5.4

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
