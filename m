From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb tree with the davinci tree
Date: Thu, 23 Jul 2009 10:15:08 +1000
Message-ID: <20090723101508.39f36ddd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38802 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751676AbZGWBCe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jul 2009 21:02:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Muralidharan Karicheri <m-karicheri2@ti.com>, Chaithrika U S <chaithrika@ti.com>, Naresh Medisetty <naresh@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>

Hi Mauro,

Today's linux-next merge of the v4l-dvb tree got a conflict in
arch/arm/mach-davinci/dm644x.c between commit
e94c101ce3ef11bc00f8ea5db4b65c4b01874cf8 ("davinci: ASoC: Add the
platform devices for ASP") from the davinci tree and commit
751970533394e56a84289abe6c92605460ada306 ("V4L/DVB: DM6446 platform
changes for vpfe capture driver") from the v4l-dvb tree.

Again, I assume these are orthogonal changes.  I fixed it up (see below)
and can carry the fixes as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-davinci/dm644x.c
index e554aa6,cc8fc78..0000000
--- a/arch/arm/mach-davinci/dm644x.c
+++ b/arch/arm/mach-davinci/dm644x.c
@@@ -554,32 -530,59 +554,85 @@@ static struct platform_device dm644x_ed
  	.resource		= edma_resources,
  };
  
 +/* DM6446 EVM uses ASP0; line-out is a pair of RCA jacks */
 +static struct resource dm644x_asp_resources[] = {
 +	{
 +		.start	= DAVINCI_ASP0_BASE,
 +		.end	= DAVINCI_ASP0_BASE + SZ_8K - 1,
 +		.flags	= IORESOURCE_MEM,
 +	},
 +	{
 +		.start	= DAVINCI_DMA_ASP0_TX,
 +		.end	= DAVINCI_DMA_ASP0_TX,
 +		.flags	= IORESOURCE_DMA,
 +	},
 +	{
 +		.start	= DAVINCI_DMA_ASP0_RX,
 +		.end	= DAVINCI_DMA_ASP0_RX,
 +		.flags	= IORESOURCE_DMA,
 +	},
 +};
 +
 +static struct platform_device dm644x_asp_device = {
 +	.name		= "davinci-asp",
 +	.id		= -1,
 +	.num_resources	= ARRAY_SIZE(dm644x_asp_resources),
 +	.resource	= dm644x_asp_resources,
 +};
 +
+ static struct resource dm644x_vpss_resources[] = {
+ 	{
+ 		/* VPSS Base address */
+ 		.name		= "vpss",
+ 		.start          = 0x01c73400,
+ 		.end            = 0x01c73400 + 0xff,
+ 		.flags          = IORESOURCE_MEM,
+ 	},
+ };
+ 
+ static struct platform_device dm644x_vpss_device = {
+ 	.name			= "vpss",
+ 	.id			= -1,
+ 	.dev.platform_data	= "dm644x_vpss",
+ 	.num_resources		= ARRAY_SIZE(dm644x_vpss_resources),
+ 	.resource		= dm644x_vpss_resources,
+ };
+ 
+ static struct resource vpfe_resources[] = {
+ 	{
+ 		.start          = IRQ_VDINT0,
+ 		.end            = IRQ_VDINT0,
+ 		.flags          = IORESOURCE_IRQ,
+ 	},
+ 	{
+ 		.start          = IRQ_VDINT1,
+ 		.end            = IRQ_VDINT1,
+ 		.flags          = IORESOURCE_IRQ,
+ 	},
+ 	{
+ 		.start          = 0x01c70400,
+ 		.end            = 0x01c70400 + 0xff,
+ 		.flags          = IORESOURCE_MEM,
+ 	},
+ };
+ 
+ static u64 vpfe_capture_dma_mask = DMA_BIT_MASK(32);
+ static struct platform_device vpfe_capture_dev = {
+ 	.name		= CAPTURE_DRV_NAME,
+ 	.id		= -1,
+ 	.num_resources	= ARRAY_SIZE(vpfe_resources),
+ 	.resource	= vpfe_resources,
+ 	.dev = {
+ 		.dma_mask		= &vpfe_capture_dma_mask,
+ 		.coherent_dma_mask	= DMA_BIT_MASK(32),
+ 	},
+ };
+ 
+ void dm644x_set_vpfe_config(struct vpfe_config *cfg)
+ {
+ 	vpfe_capture_dev.dev.platform_data = cfg;
+ }
+ 
  /*----------------------------------------------------------------------*/
  
  static struct map_desc dm644x_io_desc[] = {
