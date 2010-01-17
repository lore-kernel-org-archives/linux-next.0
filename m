From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] ati_pcigart: fix printk format warning
Date: Sun, 17 Jan 2010 15:15:40 -0800
Message-ID: <20100117151540.43d03395.randy.dunlap@oracle.com>
References: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:27125 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753515Ab0AQXP5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 17 Jan 2010 18:15:57 -0500
In-Reply-To: <20100114172047.406ebda8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

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
