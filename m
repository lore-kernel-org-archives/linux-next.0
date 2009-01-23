From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the iommu tree with the kmemcheck tree
Date: Fri, 23 Jan 2009 16:39:10 +1100
Message-ID: <20090123163910.333619da.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50361 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751172AbZAWFjP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 00:39:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Vegard Nossum <vegard.nossum@gmail.com>

Hi Ingo,

Today's linux-next merge of the iommu tree got a conflict in
arch/x86/include/asm/dma-mapping.h between commit
19dd5283c3b1f3f8abab705c23658403910dfe23 ("kmemcheck: add DMA hooks")
from the kmemcheck tree and commit
d7dff84053524186b139342ac66a4160ce6bb517 ("x86: remove map_single and
unmap_single in struct dma_mapping_ops") from the iommu tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/include/asm/dma-mapping.h
index e93265c,5a34780..0000000
--- a/arch/x86/include/asm/dma-mapping.h
+++ b/arch/x86/include/asm/dma-mapping.h
@@@ -6,8 -6,8 +6,9 @@@
   * documentation.
   */
  
 +#include <linux/kmemcheck.h>
  #include <linux/scatterlist.h>
+ #include <linux/dma-attrs.h>
  #include <asm/io.h>
  #include <asm/swiotlb.h>
  #include <asm-generic/dma-coherent.h>
@@@ -91,13 -53,14 +54,15 @@@ extern void *dma_generic_alloc_coherent
  
  static inline dma_addr_t
  dma_map_single(struct device *hwdev, void *ptr, size_t size,
- 	       int direction)
+ 	       enum dma_data_direction dir)
  {
- 	struct dma_mapping_ops *ops = get_dma_ops(hwdev);
+ 	struct dma_map_ops *ops = get_dma_ops(hwdev);
  
- 	BUG_ON(!valid_dma_direction(direction));
+ 	BUG_ON(!valid_dma_direction(dir));
 +	kmemcheck_mark_initialized(ptr, size);
- 	return ops->map_single(hwdev, virt_to_phys(ptr), size, direction);
+ 	return ops->map_page(hwdev, virt_to_page(ptr),
+ 			     (unsigned long)ptr & ~PAGE_MASK, size,
+ 			     dir, NULL);
  }
  
  static inline void
