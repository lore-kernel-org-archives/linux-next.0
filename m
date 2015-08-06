From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: build failure after merge of the slave-dma tree
Date: Thu, 6 Aug 2015 08:30:27 +0530
Message-ID: <20150806030027.GS11789@localhost>
References: <20150806122203.64e25587@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:31029 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753104AbbHFC6i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Aug 2015 22:58:38 -0400
Content-Disposition: inline
In-Reply-To: <20150806122203.64e25587@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>

On Thu, Aug 06, 2015 at 12:22:03PM +1000, Stephen Rothwell wrote:
> Hi Vinod,
> 
> After merging the slave-dma tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/dma/at_hdmac.c: In function 'atc_prep_dma_memset':
> drivers/dma/at_hdmac.c:960:6: error: 'struct at_desc' has no member named 'tx_width'
>   desc->tx_width = 2;
>       ^
> 
> Caused by commit
> 
>   25fed8c2fff1 ("dmaengine: hdmac: Add memset capabilities")
> 
> interacting with commit
> 
>   93dce3a6434f ("dmaengine: at_hdmac: fix residue computation")
Thanks Stephen,

I am dropping this commit now, it need to be fixed to take into account
Cyrille work on remove tx_width and this patch should be updated to reflect
that

-- 
~Vinod
