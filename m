From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the async_tx tree with the arm tree
Date: Tue, 27 Jul 2010 12:08:05 +1000
Message-ID: <20100727120805.f583c70b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50539 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751586Ab0G0CIJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jul 2010 22:08:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin.vincent@stericsson.com>, Russell King <rmk@arm.linux.org.uk>, Jonas Aaberg <jonas.aberg@stericsson.com>, Linus Walleij <linus.walleij@stericsson.com>

Hi Dan,

Today's linux-next merge of the async_tx tree got a conflict in
arch/arm/mach-ux500/devices-db8500.c between commit
6055930cba8fdb2c8855b32bae262aaf69c1fdb4 ("ARM: 6266/1: ux500: add
separate irq lists for DB8500 and DB5500") from the arm tree and commit
5aa12e8c9c57741606e52f43e62ab1b9dc8e9dcc ("DMAENGINE: ste_dma40: arch
updates for LCLA and LCPA") from the async_tx tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mach-ux500/devices-db8500.c
index 654fca9,c62cdbe..0000000
--- a/arch/arm/mach-ux500/devices-db8500.c
+++ b/arch/arm/mach-ux500/devices-db8500.c
@@@ -119,20 -119,15 +119,15 @@@ static struct resource dma40_resources[
  	},
  	[1] = {
  		.start = U8500_DMA_LCPA_BASE,
- 		.end = U8500_DMA_LCPA_BASE + SZ_4K - 1,
+ 		.end   = U8500_DMA_LCPA_BASE + 2 * SZ_1K - 1,
  		.flags = IORESOURCE_MEM,
- 		.name = "lcpa",
+ 		.name  = "lcpa",
  	},
  	[2] = {
- 		.start = U8500_DMA_LCLA_BASE,
- 		.end = U8500_DMA_LCLA_BASE + 16 * 1024 - 1,
- 		.flags = IORESOURCE_MEM,
- 		.name = "lcla",
- 	},
- 	[3] = {
 -		.start = IRQ_DMA,
 -		.end   = IRQ_DMA,
 +		.start = IRQ_DB8500_DMA,
 +		.end   = IRQ_DB8500_DMA,
- 		.flags = IORESOURCE_IRQ}
+ 		.flags = IORESOURCE_IRQ,
+ 	}
  };
  
  /* Default configuration for physcial memcpy */
