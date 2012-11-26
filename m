From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] dma-mapping: fix dma_common_get_sgtable() conditional
 compilation
Date: Mon, 26 Nov 2012 14:41:48 +0100
Message-ID: <1353937308-887-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <owner-linux-mm@kvack.org>
Sender: owner-linux-mm@kvack.org
To: linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

dma_common_get_sgtable() function doesn't depend on
ARCH_HAS_DMA_DECLARE_COHERENT_MEMORY, so it must not be compiled
conditionally.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/base/dma-mapping.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/dma-mapping.c b/drivers/base/dma-mapping.c
index 3fbedc7..0ce39a3 100644
--- a/drivers/base/dma-mapping.c
+++ b/drivers/base/dma-mapping.c
@@ -218,6 +218,8 @@ void dmam_release_declared_memory(struct device *dev)
 }
 EXPORT_SYMBOL(dmam_release_declared_memory);
 
+#endif
+
 /*
  * Create scatter-list for the already allocated DMA buffer.
  */
@@ -236,8 +238,6 @@ int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 }
 EXPORT_SYMBOL(dma_common_get_sgtable);
 
-#endif
-
 /*
  * Create userspace mapping for the DMA-coherent memory.
  */
-- 
1.7.9.5

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
