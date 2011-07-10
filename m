From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] usb/gadget: fix langwell printk formats
Date: Sun, 10 Jul 2011 11:41:27 -0700
Message-ID: <20110710114127.ebb0d803.randy.dunlap@oracle.com>
References: <20110707172544.867b980a1196db005b577c14@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:56377 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756312Ab1GJSlw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 10 Jul 2011 14:41:52 -0400
In-Reply-To: <20110707172544.867b980a1196db005b577c14@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Felipe Balbi <balbi@ti.com>, lud <linux-usb@vger.kernel.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix printk formats to use %zu for size_t args, to fix these
build warnings:

drivers/usb/gadget/langwell_udc.c:3274: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
drivers/usb/gadget/langwell_udc.c:3289: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
drivers/usb/gadget/langwell_udc.c:3473: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'
drivers/usb/gadget/langwell_udc.c:3487: warning: format '%d' expects type 'int', but argument 4 has type 'size_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/usb/gadget/langwell_udc.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20110706.orig/drivers/usb/gadget/langwell_udc.c
+++ linux-next-20110706/drivers/usb/gadget/langwell_udc.c
@@ -3271,7 +3271,7 @@ static int langwell_udc_probe(struct pci
 
 	/* allocate device dQH memory */
 	size = dev->ep_max * sizeof(struct langwell_dqh);
-	dev_vdbg(&dev->pdev->dev, "orig size = %d\n", size);
+	dev_vdbg(&dev->pdev->dev, "orig size = %zu\n", size);
 	if (size < DQH_ALIGNMENT)
 		size = DQH_ALIGNMENT;
 	else if ((size % DQH_ALIGNMENT) != 0) {
@@ -3286,7 +3286,7 @@ static int langwell_udc_probe(struct pci
 		goto error;
 	}
 	dev->ep_dqh_size = size;
-	dev_vdbg(&dev->pdev->dev, "ep_dqh_size = %d\n", dev->ep_dqh_size);
+	dev_vdbg(&dev->pdev->dev, "ep_dqh_size = %zu\n", dev->ep_dqh_size);
 
 	/* initialize ep0 status request structure */
 	dev->status_req = kzalloc(sizeof(struct langwell_request), GFP_KERNEL);
@@ -3470,7 +3470,7 @@ static int langwell_udc_resume(struct pc
 
 	/* allocate device dQH memory */
 	size = dev->ep_max * sizeof(struct langwell_dqh);
-	dev_vdbg(&dev->pdev->dev, "orig size = %d\n", size);
+	dev_vdbg(&dev->pdev->dev, "orig size = %zu\n", size);
 	if (size < DQH_ALIGNMENT)
 		size = DQH_ALIGNMENT;
 	else if ((size % DQH_ALIGNMENT) != 0) {
@@ -3484,7 +3484,7 @@ static int langwell_udc_resume(struct pc
 		return -ENOMEM;
 	}
 	dev->ep_dqh_size = size;
-	dev_vdbg(&dev->pdev->dev, "ep_dqh_size = %d\n", dev->ep_dqh_size);
+	dev_vdbg(&dev->pdev->dev, "ep_dqh_size = %zu\n", dev->ep_dqh_size);
 
 	/* create dTD dma_pool resource */
 	dev->dtd_pool = dma_pool_create("langwell_dtd",
