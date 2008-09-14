From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pxa tree
Date: Mon, 15 Sep 2008 05:27:50 +1000
Message-ID: <20080915052750.0b0c924c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49685 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753131AbYINT14 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 15:27:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Eric Miao <eric.y.miao@gmail.com>
Cc: linux-next@vger.kernel.org, Ned Forrester <nforrester@whoi.edu>

Hi Eric,

Today's linux-next merge of the pxa tree got a conflict in
drivers/spi/pxa2xx_spi.c between commit
8423597d676615f3dd2d9ab36f59f147086b90b8 ("pxa2xx_spi: chipselect
bugfixes") from Linus' tree and commit
5625ef19d54c02838c867b6a5c87823e021ac7a5 ("spi: pxa2xx_spi introduce chip
select gpio to simplify the common cases") from the pxa tree.

I fixed it up (see below) and can carry the fixup (though it could be
fixed in the pxa tree in a merge with Linus' tree).  Please check the
fixup.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/spi/pxa2xx_spi.c
index 0e53354,98d2338..0000000
--- a/drivers/spi/pxa2xx_spi.c
+++ b/drivers/spi/pxa2xx_spi.c
@@@ -406,46 -430,11 +430,48 @@@ static void giveback(struct driver_dat
  					struct spi_transfer,
  					transfer_list);
  
 +	/* Delay if requested before any change in chip select */
 +	if (last_transfer->delay_usecs)
 +		udelay(last_transfer->delay_usecs);
 +
 +	/* Drop chip select UNLESS cs_change is true or we are returning
 +	 * a message with an error, or next message is for another chip
 +	 */
  	if (!last_transfer->cs_change)
- 		drv_data->cs_control(PXA2XX_CS_DEASSERT);
+ 		cs_deassert(drv_data);
 +	else {
 +		struct spi_message *next_msg;
 +
 +		/* Holding of cs was hinted, but we need to make sure
 +		 * the next message is for the same chip.  Don't waste
 +		 * time with the following tests unless this was hinted.
 +		 *
 +		 * We cannot postpone this until pump_messages, because
 +		 * after calling msg->complete (below) the driver that
 +		 * sent the current message could be unloaded, which
 +		 * could invalidate the cs_control() callback...
 +		 */
 +
 +		/* get a pointer to the next message, if any */
 +		spin_lock_irqsave(&drv_data->lock, flags);
 +		if (list_empty(&drv_data->queue))
 +			next_msg = NULL;
 +		else
 +			next_msg = list_entry(drv_data->queue.next,
 +					struct spi_message, queue);
 +		spin_unlock_irqrestore(&drv_data->lock, flags);
 +
 +		/* see if the next and current messages point
 +		 * to the same chip
 +		 */
 +		if (next_msg && next_msg->spi != msg->spi)
 +			next_msg = NULL;
 +		if (!next_msg || msg->state == ERROR_STATE)
- 			drv_data->cs_control(PXA2XX_CS_DEASSERT);
++			cs_deassert(drv_data);
 +	}
  
+ 	drv_data->cur_chip = NULL;
+ 
  	msg->state = NULL;
  	if (msg->complete)
  		msg->complete(msg->context);
@@@ -882,33 -873,16 +908,33 @@@ static void pump_transfers(unsigned lon
  					transfer_list);
  		if (previous->delay_usecs)
  			udelay(previous->delay_usecs);
 +
 +		/* Drop chip select only if cs_change is requested */
 +		if (previous->cs_change)
- 			drv_data->cs_control(PXA2XX_CS_DEASSERT);
++			cs_deassert(drv_data);
  	}
  
 -	/* Check transfer length */
 -	if (transfer->len > 8191)
 -	{
 -		dev_warn(&drv_data->pdev->dev, "pump_transfers: transfer "
 -				"length greater than 8191\n");
 -		message->status = -EINVAL;
 -		giveback(drv_data);
 -		return;
 +	/* Check for transfers that need multiple DMA segments */
 +	if (transfer->len > MAX_DMA_LEN && chip->enable_dma) {
 +
 +		/* reject already-mapped transfers; PIO won't always work */
 +		if (message->is_dma_mapped
 +				|| transfer->rx_dma || transfer->tx_dma) {
 +			dev_err(&drv_data->pdev->dev,
 +				"pump_transfers: mapped transfer length "
 +				"of %lu is greater than %d\n",
 +				transfer->len, MAX_DMA_LEN);
 +			message->status = -EINVAL;
 +			giveback(drv_data);
 +			return;
 +		}
 +
 +		/* warn ... we force this to PIO mode */
 +		if (printk_ratelimit())
 +			dev_warn(&message->spi->dev, "pump_transfers: "
 +				"DMA disabled for transfer length %ld "
 +				"greater than %d\n",
 +				(long)drv_data->len, MAX_DMA_LEN);
  	}
  
  	/* Setup the transfer state based on the type of transfer */
