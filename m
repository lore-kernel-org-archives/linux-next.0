From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the slave-dma tree
Date: Mon, 5 Sep 2016 16:43:21 +1000
Message-ID: <20160905164321.4dd8801b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49604 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755033AbcIEGnX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Sep 2016 02:43:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nandor Han <nandor.han@ge.com>, Dave Jiang <dave.jiang@intel.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/dma/imx-sdma.c

between commit:

  48dc77e2d4fc ("dmaengine: imx-sdma: convert callback to helper function")

from the slave-dma tree and commit:

  15f30f513111 ("dmaengine: imx-sdma - reduce transfer latency for DMA cyclic clients")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/dma/imx-sdma.c
index a6bffbc47ee2,3cb47386fbb9..000000000000
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@@ -689,12 -664,36 +686,35 @@@ static void sdma_update_channel_loop(st
  		if (bd->mode.status & BD_DONE)
  			break;
  
- 		if (bd->mode.status & BD_RROR)
+ 		if (bd->mode.status & BD_RROR) {
+ 			bd->mode.status &= ~BD_RROR;
  			sdmac->status = DMA_ERROR;
+ 			error = -EIO;
+ 		}
  
+ 	       /*
+ 		* We use bd->mode.count to calculate the residue, since contains
+ 		* the number of bytes present in the current buffer descriptor.
+ 		*/
+ 
+ 		sdmac->chn_real_count = bd->mode.count;
  		bd->mode.status |= BD_DONE;
+ 		bd->mode.count = sdmac->period_len;
+ 
+ 		/*
+ 		 * The callback is called from the interrupt context in order
+ 		 * to reduce latency and to avoid the risk of altering the
+ 		 * SDMA transaction status by the time the client tasklet is
+ 		 * executed.
+ 		 */
+ 
 -		if (sdmac->desc.callback)
 -			sdmac->desc.callback(sdmac->desc.callback_param);
++		dmaengine_desc_get_callback_invoke(&sdmac->desc, NULL);
+ 
  		sdmac->buf_tail++;
  		sdmac->buf_tail %= sdmac->num_bd;
+ 
+ 		if (error)
+ 			sdmac->status = old_status;
  	}
  }
  
@@@ -722,20 -722,10 +743,10 @@@ static void mxc_sdma_handle_channel_nor
  		sdmac->status = DMA_COMPLETE;
  
  	dma_cookie_complete(&sdmac->desc);
 -	if (sdmac->desc.callback)
 -		sdmac->desc.callback(sdmac->desc.callback_param);
 +
 +	dmaengine_desc_get_callback_invoke(&sdmac->desc, NULL);
  }
  
- static void sdma_tasklet(unsigned long data)
- {
- 	struct sdma_channel *sdmac = (struct sdma_channel *) data;
- 
- 	if (sdmac->flags & IMX_DMA_SG_LOOP)
- 		sdma_handle_channel_loop(sdmac);
- 	else
- 		mxc_sdma_handle_channel_normal(sdmac);
- }
- 
  static irqreturn_t sdma_int_handler(int irq, void *dev_id)
  {
  	struct sdma_engine *sdma = dev_id;
