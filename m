From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slave-dma tree
Date: Tue, 22 Aug 2017 15:36:54 +1000
Message-ID: <20170822153654.6455c8df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>, Dave Jiang <dave.jiang@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/dma/dmaengine.h:9:0,
                 from drivers/dma/altera-msgdma.c:27:
drivers/dma/altera-msgdma.c: In function 'msgdma_probe':
drivers/dma/altera-msgdma.c:946:14: error: 'DMA_SG' undeclared (first use in this function)
  dma_cap_set(DMA_SG, dma_dev->cap_mask);
              ^
include/linux/dmaengine.h:1197:46: note: in definition of macro 'dma_cap_set'
 #define dma_cap_set(tx, mask) __dma_cap_set((tx), &(mask))
                                              ^
drivers/dma/altera-msgdma.c:946:14: note: each undeclared identifier is reported only once for each function it appears in
  dma_cap_set(DMA_SG, dma_dev->cap_mask);
              ^
include/linux/dmaengine.h:1197:46: note: in definition of macro 'dma_cap_set'
 #define dma_cap_set(tx, mask) __dma_cap_set((tx), &(mask))
                                              ^
drivers/dma/altera-msgdma.c:965:9: error: 'struct dma_device' has no member named 'device_prep_dma_sg'
  dma_dev->device_prep_dma_sg = msgdma_prep_sg;
         ^

Caused by commit

  a85c6f1b2921 ("dmaengine: Add driver for Altera / Intel mSGDMA IP core")

interacting with commit

  c678fa66341c ("dmaengine: remove DMA_SG as it is dead code in kernel")

This should have been fixed up in the merge commit

  0a0ab6497093 ("Merge branch 'topic/dmatest' into next")

I have used the slave-dma tree from next-20170817 for today.

-- 
Cheers,
Stephen Rothwell
