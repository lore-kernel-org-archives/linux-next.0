From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Wed, 22 Jun 2016 14:54:15 +1000
Message-ID: <20160622145415.2a005cdb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45739 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750824AbcFVEyg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jun 2016 00:54:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/arm64/mm/dma-mapping.c

between commit:

  b67a8b29df7e ("arm64: mm: only initialize swiotlb when necessary")

from the arm64 tree and commit:

  29af59a63ef1 ("arm64: dma-mapping: constify attrs passed to internal functions")

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

diff --cc arch/arm64/mm/dma-mapping.c
index 46a4157adc17,0ef620a34c4e..000000000000
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@@ -30,9 -29,7 +30,9 @@@
  
  #include <asm/cacheflush.h>
  
 +static int swiotlb __read_mostly;
 +
- static pgprot_t __get_dma_pgprot(struct dma_attrs *attrs, pgprot_t prot,
+ static pgprot_t __get_dma_pgprot(const struct dma_attrs *attrs, pgprot_t prot,
  				 bool coherent)
  {
  	if (!coherent || dma_get_attr(DMA_ATTR_WRITE_COMBINE, attrs))
