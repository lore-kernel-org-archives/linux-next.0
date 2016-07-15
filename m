From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm tree
Date: Fri, 15 Jul 2016 18:38:50 +1000
Message-ID: <20160715183850.594581bf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Russell King <rmk@armlinux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm/mm/dma-mapping.c

between commit:

  f12708965069 ("ARM: 8561/3: dma-mapping: Don't use outer_flush_range when the L2C is coherent")

from the arm tree and patch:

   "dma-mapping: remove dma_get_attr"

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/mm/dma-mapping.c
index 40d3a9be7832,43e03b5293d0..000000000000
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@@ -763,8 -744,7 +763,8 @@@ static void *__dma_alloc(struct device 
  		.gfp = gfp,
  		.prot = prot,
  		.caller = caller,
- 		.want_vaddr = !dma_get_attr(DMA_ATTR_NO_KERNEL_MAPPING, attrs),
+ 		.want_vaddr = ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) == 0),
 +		.coherent_flag = is_coherent ? COHERENT : NORMAL,
  	};
  
  #ifdef CONFIG_DMA_API_DEBUG
