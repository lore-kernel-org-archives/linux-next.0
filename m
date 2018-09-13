From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: linux-next: build warning after merge of the slave-dma tree
Date: Thu, 13 Sep 2018 09:17:38 +0200
Message-ID: <20180913071738.GA11013@jerusalem>
References: <20180913122218.0fb31482@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180913122218.0fb31482@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vinod Koul <vkoul@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi,

sorry, there was no build-test robot warning anymore about it.
Will fix it in a patch in short.


On Thu, Sep 13, 2018 at 12:22:18PM +1000, Stephen Rothwell wrote:
> Hi Vinod,
> 
> After merging the slave-dma tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/dma/mcf-edma.c: In function 'mcf_edma_filter_fn':
> drivers/dma/mcf-edma.c:296:33: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>    return (mcf_chan->slave_id == (u32)param);
>                                  ^
> 
> Introduced by commit
> 
>   e7a3ff92eaf1 ("dmaengine: fsl-edma: add ColdFire mcf5441x edma support")
> 

Regards,
Angelo

> -- 
> Cheers,
> Stephen Rothwell
