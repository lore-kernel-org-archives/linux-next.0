From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH v2] dma: vdma: Fix compilation warnings
Date: Mon, 30 Mar 2015 18:48:29 +0530
Message-ID: <32a1f768-901f-4728-b11e-6d5dc9a622ab@BN1BFFO11FD025.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bn1bon0065.outbound.protection.outlook.com ([157.56.111.65]:8292
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752436AbbC3NSo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2015 09:18:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: vinod.koul@intel.com, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anirudh@xilinx.com, Kedareswara rao Appana <appanad@xilinx.com>

This patch fixes the following compilation warnings.
In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
include/linux/dmapool.h:18:4: warning: 'struct device' declared inside parameter list
    size_t size, size_t align, size_t allocation);
    ^
include/linux/dmapool.h:18:4: warning: its scope is only this definition or declaration, which is probably not what you want
include/linux/dmapool.h:31:7: warning: 'struct device' declared inside parameter list
       size_t size, size_t align, size_t allocation);
       ^
drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_vdma_alloc_chan_resources':
drivers/dma/xilinx/xilinx_vdma.c:501:20: warning: passing argument 2 of 'dma_pool_create' from incompatible pointer type
  chan->desc_pool = dma_pool_create("xilinx_vdma_desc_pool",
                    ^
In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
include/linux/dmapool.h:17:18: note: expected 'struct device *' but argument is of type 'struct device *'
 struct dma_pool *dma_pool_create(const char *name, struct device *dev, .

Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
---
This patch is rebased on the slave-dma next.
Changes for v2:
- Don't include header file instead use struct device as 
  suggested by Stephen Rothwell.

 include/linux/dmapool.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
index 022e34f..52456aa 100644
--- a/include/linux/dmapool.h
+++ b/include/linux/dmapool.h
@@ -14,6 +14,8 @@
 #include <asm/io.h>
 #include <asm/scatterlist.h>
 
+struct device;
+
 struct dma_pool *dma_pool_create(const char *name, struct device *dev, 
 			size_t size, size_t align, size_t allocation);
 
-- 
2.1.2
