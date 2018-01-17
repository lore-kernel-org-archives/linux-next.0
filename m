From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the dma-mapping
 tree
Date: Wed, 17 Jan 2018 13:38:17 +1100
Message-ID: <20180117133817.739d6751@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45555 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750816AbeAQCiT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jan 2018 21:38:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>

Hi Jens,

Today's linux-next merge of the block tree got a conflict in:

  lib/Kconfig

between commit:

  002e67454f61 ("dma-direct: rename dma_noop to dma_direct")

from the dma-mapping tree and commit:

  e80a0af4759a ("lib/scatterlist: Introduce sgl_alloc() and sgl_free()")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc lib/Kconfig
index 9d3d649c9dc9,4dd5c11366f9..000000000000
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@@ -409,7 -409,11 +409,11 @@@ config HAS_DM
  	depends on !NO_DMA
  	default y
  
+ config SGL_ALLOC
+ 	bool
+ 	default n
+ 
 -config DMA_NOOP_OPS
 +config DMA_DIRECT_OPS
  	bool
  	depends on HAS_DMA && (!64BIT || ARCH_DMA_ADDR_T_64BIT)
  	default n
