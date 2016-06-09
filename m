From: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Subject: RE: linux-next: build warning after merge of the slave-dma tree
Date: Thu, 9 Jun 2016 06:04:03 +0000
Message-ID: <C246CAC1457055469EF09E3A7AC4E11A4A5B5325@XAP-PVEXMBX01.xlnx.xilinx.com>
References: <20160609111830.652cb495@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160609111830.652cb495@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Vinod Koul <vinod.koul@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Stephen Rothwell,


> Hi Vinod,
> 
> After merging the slave-dma tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_dma_prep_dma_cyclic':
> drivers/dma/xilinx/xilinx_vdma.c:1808:23: warning: 'segment' may be used
> uninitialized in this function [-Wmaybe-uninitialized]
>    segment->hw.control |= XILINX_DMA_BD_SOP;

Thanks for reporting the issue.
I have fixed it and sent the patch...

> 
> Introduced by commit
> 
>   92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")
> 
> I am not sure if this is tecnically a problem, but gcc certainly cannot tell.

Thanks,
Kedar.
