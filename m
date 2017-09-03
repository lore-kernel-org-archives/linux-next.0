From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the dma-mapping tree
Date: Mon, 4 Sep 2017 08:34:20 +1000
Message-ID: <20170904083420.42852c8e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57533 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753060AbdICWeX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 3 Sep 2017 18:34:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Christoph,

After merging the dma-mapping tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/base/dma-coherent.c: In function '__dma_alloc_from_coherent':
drivers/base/dma-coherent.c:160:6: warning: unused variable 'dma_memory_map' [-Wunused-variable]
  int dma_memory_map;
      ^

Introduced by commit

  2436bdcda53f ("dma-coherent: remove the DMA_MEMORY_MAP and DMA_MEMORY_IO flags")

-- 
Cheers,
Stephen Rothwell
