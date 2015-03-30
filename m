From: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Subject: [PATCH] dma: vdma: Fix compilation warnings
Date: Mon, 30 Mar 2015 14:30:26 +0530
Message-ID: <3912f868-18f8-44ef-9312-b3842270b4da@BY2FFO11OLC001.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anirudh@xilinx.com, Kedareswara rao Appana <appanad@xilinx.com>
List-Id: linux-next.vger.kernel.org

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
- This patch is rebased on the slave-dma next.

 include/linux/dmapool.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
index 022e34f..01c91bb 100644
--- a/include/linux/dmapool.h
+++ b/include/linux/dmapool.h
@@ -13,6 +13,7 @@
 
 #include <asm/io.h>
 #include <asm/scatterlist.h>
+#include <linux/device.h>
 
 struct dma_pool *dma_pool_create(const char *name, struct device *dev, 
 			size_t size, size_t align, size_t allocation);
-- 
2.1.2
