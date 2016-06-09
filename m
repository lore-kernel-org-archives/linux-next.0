From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the slave-dma tree
Date: Thu, 9 Jun 2016 11:18:30 +1000
Message-ID: <20160609111830.652cb495@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58857 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1423920AbcFIBSd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jun 2016 21:18:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kedareswara rao Appana <appana.durga.rao@xilinx.com>

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_dma_prep_dma_cyclic':
drivers/dma/xilinx/xilinx_vdma.c:1808:23: warning: 'segment' may be used uninitialized in this function [-Wmaybe-uninitialized]
   segment->hw.control |= XILINX_DMA_BD_SOP;

Introduced by commit

  92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")

I am not sure if this is tecnically a problem, but gcc certainly cannot
tell.

-- 
Cheers,
Stephen Rothwell
