From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2] dma: vdma: Fix compilation warnings
Date: Mon, 30 Mar 2015 22:48:46 +0530
Message-ID: <20150330171846.GG7192@intel.com>
References: <32a1f768-901f-4728-b11e-6d5dc9a622ab@BN1BFFO11FD025.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <32a1f768-901f-4728-b11e-6d5dc9a622ab@BN1BFFO11FD025.protection.gbl>
Sender: linux-kernel-owner@vger.kernel.org
To: Kedareswara rao Appana <appana.durga.rao@xilinx.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anirudh@xilinx.com, Kedareswara rao Appana <appanad@xilinx.com>
List-Id: linux-next.vger.kernel.org

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
Well this does fix this error but this can also be fixed by rearranging the
driver header files order.  Since I am not inclined to update a patch for
dmapool.h I would go for rearranging drivers header

--><8---------------><8--------------

diff --git a/drivers/dma/xilinx/xilinx_vdma.c
b/drivers/dma/xilinx/xilinx_vdma.c
index d8434d465885..356ca4bc0ea5 100644
--- a/drivers/dma/xilinx/xilinx_vdma.c
+++ b/drivers/dma/xilinx/xilinx_vdma.c
@@ -23,12 +23,12 @@
  */

 #include <linux/bitops.h>
-#include <linux/dmapool.h>
 #include <linux/dma/xilinx_dma.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/dmapool.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
 #include <linux/of_platform.h>

Any objections?

-- 
~Vinod
> Signed-off-by: Kedareswara rao Appana <appanad@xilinx.com>
> ---
> This patch is rebased on the slave-dma next.
> Changes for v2:
> - Don't include header file instead use struct device as 
>   suggested by Stephen Rothwell.
> 
>  include/linux/dmapool.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h
> index 022e34f..52456aa 100644
> --- a/include/linux/dmapool.h
> +++ b/include/linux/dmapool.h
> @@ -14,6 +14,8 @@
>  #include <asm/io.h>
>  #include <asm/scatterlist.h>
>  
> +struct device;
> +
>  struct dma_pool *dma_pool_create(const char *name, struct device *dev, 
>  			size_t size, size_t align, size_t allocation);
>  
> -- 
> 2.1.2
> 

-- 
