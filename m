From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH/RFC] cris: add placeholder DMA functions for build coverage
Date: Sat, 20 Jun 2015 15:52:50 -0400
Message-ID: <1434829970-28568-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:61922 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755127AbbFTTzK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 20 Jun 2015 15:55:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-cris-kernel@axis.com

Currently arch/cris fails the allmodconfig/allyesconfig build
coverage in linux-next with things like:

drivers/media/platform/sti/bdisp/bdisp-hw.c:132:3: error: implicit
 declaration of function 'dma_free_attrs'
drivers/media/platform/sti/bdisp/bdisp-hw.c:157:2: error: implicit
 declaration of function 'dma_alloc_attrs'

drivers/crypto/marvell/cesa.c: In function 'mv_cesa_get_sram':
drivers/crypto/marvell/cesa.c:353:2: error: implicit declaration of
 function 'phys_to_dma'

We steal the 1st 2 from commit e74993aef4411995960052506a000f94411a7103
("xtensa: Provide dummy dma_alloc_attrs() and dma_free_attrs()") and
the remaining two from commit 8d4f5339d1ee4027c07e6b2a1cfa9dc41b0d383b
("x86, IA64, powerpc: add phys_to_dma() and dma_to_phys()")

Cc: Mikael Starvik <starvik@axis.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: linux-cris-kernel@axis.com
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[I don't know anything about cris or what DMA rules it operates under,
 hence RFC and "placeholder" status....]

 arch/cris/include/asm/dma-mapping.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/cris/include/asm/dma-mapping.h b/arch/cris/include/asm/dma-mapping.h
index 57f794ee6039..224e5e85b0d2 100644
--- a/arch/cris/include/asm/dma-mapping.h
+++ b/arch/cris/include/asm/dma-mapping.h
@@ -168,5 +168,27 @@ extern int dma_common_get_sgtable(struct device *dev, struct sg_table *sgt,
 #define dma_mmap_coherent(d, v, c, h, s) dma_common_mmap(d, v, c, h, s)
 #define dma_get_sgtable(d, t, v, h, s) dma_common_get_sgtable(d, t, v, h, s)
 
+static inline void *dma_alloc_attrs(struct device *dev, size_t size,
+				    dma_addr_t *dma_handle, gfp_t flag,
+				    struct dma_attrs *attrs)
+{
+	return NULL;
+}
+
+static inline void dma_free_attrs(struct device *dev, size_t size,
+				  void *vaddr, dma_addr_t dma_handle,
+				  struct dma_attrs *attrs)
+{
+}
+
+static inline dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
+{
+	return paddr;
+}
+
+static inline phys_addr_t dma_to_phys(struct device *dev, dma_addr_t daddr)
+{
+	return daddr;
+}
 
 #endif
-- 
2.2.1
