From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next resend] ati_pcigart: fix printk format warning
Date: Mon, 1 Feb 2010 07:54:53 -0800
Message-ID: <20100201075453.ee715fad.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet11.oracle.com ([148.87.113.123]:48060 "EHLO
	rcsinet11.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753157Ab0BAPze (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Feb 2010 10:55:34 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>

This patch is still needed in linux-next 20100201.

Begin forwarded message:
Date: Sun, 17 Jan 2010 15:15:40 -0800
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] ati_pcigart: fix printk format warning


From: Randy Dunlap <randy.dunlap@oracle.com>

Fix ati_pcigart printk format warning:

drivers/gpu/drm/ati_pcigart.c:115: warning: format '%Lx' expects type 'long long unsigned int', but argument 3 has type 'dma_addr_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/gpu/drm/ati_pcigart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20100111.orig/drivers/gpu/drm/ati_pcigart.c
+++ linux-next-20100111/drivers/gpu/drm/ati_pcigart.c
@@ -113,7 +113,7 @@ int drm_ati_pcigart_init(struct drm_devi
 
 		if (pci_set_dma_mask(dev->pdev, gart_info->table_mask)) {
 			DRM_ERROR("fail to set dma mask to 0x%Lx\n",
-				  gart_info->table_mask);
+				  (unsigned long long)gart_info->table_mask);
 			ret = 1;
 			goto done;
 		}


---
~Randy
