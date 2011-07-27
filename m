From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slave-dma tree with Linus' tree
Date: Wed, 27 Jul 2011 12:08:26 +1000
Message-ID: <20110727120826.ea1227276707790e162dee18@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45461 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751223Ab1G0CId (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Jul 2011 22:08:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>

Hi Vinod,

Today's linux-next merge of the slave-dma tree got a conflict in
drivers/spi/spi-pl022.c (called drivers/spi/amba-pl022.c in the sleav-dma
tree) between commit 083be3f05371 ("spi/pl022: initialize burstsize from
FIFO trigger level") from Linus' tree and commit 001b0585ff16 ("Improve
slave/cyclic DMA engine documentation") from the slave-dma tree.

I fixed it up (see below) anc acn carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/spi/spi-pl022.c
index eba88c7,99e7880..0000000
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@@ -910,11 -908,11 +910,9 @@@ static int configure_dma(struct pl022 *
  {
  	struct dma_slave_config rx_conf = {
  		.src_addr = SSP_DR(pl022->phybase),
  	};
  	struct dma_slave_config tx_conf = {
  		.dst_addr = SSP_DR(pl022->phybase),
- 		.direction = DMA_TO_DEVICE,
 -		.dst_maxburst = pl022->vendor->fifodepth >> 1,
  	};
  	unsigned int pages;
  	int ret;
