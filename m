From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: linux-next: build failure after merge of the final tree (mmc
 tree related)
Date: Wed, 1 Jun 2011 11:39:09 +0800
Message-ID: <20110601033909.GB1902@S2100-06.ap.freescale.net>
References: <20110601130431.59f4f0d4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]:53138
	"EHLO VA3EHSOBE003.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933173Ab1FADeR (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 31 May 2011 23:34:17 -0400
Content-Disposition: inline
In-Reply-To: <20110601130431.59f4f0d4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Ball <cjb@laptop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Anton Vorontsov <cbouatmailru@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>

Hi Stephen,

On Wed, Jun 01, 2011 at 01:04:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_pltfm_register':
> (.opd+0xd8): multiple definition of `sdhci_pltfm_register'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0xd8): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_pltfm_init':
> (.text+0x568): multiple definition of `.sdhci_pltfm_init'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x568): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_get_of_property':
> (.text+0x34c): multiple definition of `.sdhci_get_of_property'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x34c): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_be32bs_writel':
> (.text+0x13c): multiple definition of `.sdhci_be32bs_writel'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x13c): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_pltfm_resume':
> (.opd+0x120): multiple definition of `sdhci_pltfm_resume'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x120): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_be32bs_readl':
> (.opd+0x0): multiple definition of `sdhci_be32bs_readl'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_be32bs_readw':
> (.text+0x64): multiple definition of `.sdhci_be32bs_readw'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x64): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_pltfm_free':
> (.text+0x8d0): multiple definition of `.sdhci_pltfm_free'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x8d0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_pltfm_free':
> (.opd+0xc0): multiple definition of `sdhci_pltfm_free'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0xc0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_be32bs_readw':
> (.opd+0x18): multiple definition of `sdhci_be32bs_readw'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x18): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_pltfm_unregister':
> (.text+0xa94): multiple definition of `.sdhci_pltfm_unregister'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0xa94): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_be32bs_readb':
> (.text+0xd0): multiple definition of `.sdhci_be32bs_readb'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0xd0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_be32bs_writew':
> (.text+0x1a0): multiple definition of `.sdhci_be32bs_writew'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x1a0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_be32bs_writel':
> (.opd+0x48): multiple definition of `sdhci_be32bs_writel'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x48): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_pltfm_unregister':
> (.opd+0xf0): multiple definition of `sdhci_pltfm_unregister'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0xf0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_be32bs_writew':
> (.opd+0x60): multiple definition of `sdhci_be32bs_writew'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x60): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_pltfm_resume':
> (.text+0xc70): multiple definition of `.sdhci_pltfm_resume'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0xc70): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_be32bs_writeb':
> (.text+0x2ac): multiple definition of `.sdhci_be32bs_writeb'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x2ac): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_pltfm_suspend':
> (.text+0xc04): multiple definition of `.sdhci_pltfm_suspend'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0xc04): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_pltfm_register':
> (.text+0x9c0): multiple definition of `.sdhci_pltfm_register'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x9c0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `.sdhci_be32bs_readl':
> (.text+0x0): multiple definition of `.sdhci_be32bs_readl'
> drivers/mmc/host/sdhci-of-esdhc.o:(.text+0x0): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_be32bs_writeb':
> (.opd+0x78): multiple definition of `sdhci_be32bs_writeb'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x78): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_pltfm_suspend':
> (.opd+0x108): multiple definition of `sdhci_pltfm_suspend'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x108): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_get_of_property':
> (.opd+0x90): multiple definition of `sdhci_get_of_property'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x90): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_pltfm_init':
> (.opd+0xa8): multiple definition of `sdhci_pltfm_init'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0xa8): first defined here
> drivers/mmc/host/sdhci-of-hlwd.o: In function `sdhci_be32bs_readb':
> (.opd+0x30): multiple definition of `sdhci_be32bs_readb'
> drivers/mmc/host/sdhci-of-esdhc.o:(.opd+0x30): first defined here
> 
> Presumably caused by commit e2d0d7dc5542 ("mmc: sdhci: make sdhci-of
> device drivers self registered").
> 
I did build test for powerpc in the first a few rounds posts, but
forgot the in the last ones.  I will fix this soon.  Sorry for this.

-- 
Regards,
Shawn
