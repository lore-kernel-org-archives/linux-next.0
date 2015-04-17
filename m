From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2] dma: vdma: Fix compilation warnings
Date: Fri, 17 Apr 2015 23:19:34 +0530
Message-ID: <20150417174934.GE30624@intel.com>
References: <32a1f768-901f-4728-b11e-6d5dc9a622ab@BN1BFFO11FD025.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:46710 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754141AbbDQRyw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Apr 2015 13:54:52 -0400
Content-Disposition: inline
In-Reply-To: <32a1f768-901f-4728-b11e-6d5dc9a622ab@BN1BFFO11FD025.protection.gbl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anirudh@xilinx.com, Kedareswara rao Appana <appanad@xilinx.com>

On Mon, Mar 30, 2015 at 06:48:29PM +0530, Kedareswara rao Appana wrote:
> This patch fixes the following compilation warnings.
> In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> include/linux/dmapool.h:18:4: warning: 'struct device' declared inside parameter list
>     size_t size, size_t align, size_t allocation);
>     ^
> include/linux/dmapool.h:18:4: warning: its scope is only this definition or declaration, which is probably not what you want
> include/linux/dmapool.h:31:7: warning: 'struct device' declared inside parameter list
>        size_t size, size_t align, size_t allocation);
>        ^
> drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_vdma_alloc_chan_resources':
> drivers/dma/xilinx/xilinx_vdma.c:501:20: warning: passing argument 2 of 'dma_pool_create' from incompatible pointer type
>   chan->desc_pool = dma_pool_create("xilinx_vdma_desc_pool",
>                     ^
> In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> include/linux/dmapool.h:17:18: note: expected 'struct device *' but argument is of type 'struct device *'
>  struct dma_pool *dma_pool_create(const char *name, struct device *dev, .
> 
I have applied this now

-- 
~Vinod
