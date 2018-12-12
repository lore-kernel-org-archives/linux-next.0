From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: manual merge of the sparc-next tree with the
 dma-mapping tree
Date: Wed, 12 Dec 2018 17:32:08 +0100
Message-ID: <20181212163208.GA15535@ravnborg.org>
References: <20181212093042.00fbf6be@canb.auug.org.au>
 <20181212074420.GB29137@lst.de>
 <20181212161146.GA7176@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181212161146.GA7176@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 12, 2018 at 05:11:46PM +0100, Christoph Hellwig wrote:
> On Wed, Dec 12, 2018 at 08:44:20AM +0100, Christoph Hellwig wrote:
> > Dave, Sam:
> > 
> > should I just apply a version of Rob's tree that takes the refactoring
> > into account to the dma-mapping tree?  That way we should get the right
> > result independent of the merge order.
> 
> E.g. something like the patch below:
> 
> --
> >From 6ee3d6c39a0c8bc4b58fa601bb4370bdec785be7 Mon Sep 17 00:00:00 2001
> From: Christoph Hellwig <hch@lst.de>
> Date: Wed, 12 Dec 2018 17:09:58 +0100
> Subject: sparc: use DT node full_name in sparc_dma_alloc_resource
> 
> The sparc tree already has this change for the pre-refactored code,
> but pulling it into the dma-mapping tree like this should ease
> the merge conflicts a bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/sparc/kernel/ioport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
> index 51c128d80193..baa235652c27 100644
> --- a/arch/sparc/kernel/ioport.c
> +++ b/arch/sparc/kernel/ioport.c
> @@ -252,7 +252,7 @@ unsigned long sparc_dma_alloc_resource(struct device *dev, size_t len)
>  	res = kzalloc(sizeof(*res), GFP_KERNEL);
>  	if (!res)
>  		return 0;
> -	res->name = dev->of_node->name;
> +	res->name = dev->of_node->full_name;
>  
>  	if (allocate_resource(&_sparc_dvma, res, len, _sparc_dvma.start,
>  			      _sparc_dvma.end, PAGE_SIZE, NULL, NULL) != 0) {

Whatever works best for everyone is fine for me, so ack from me.

	Sam
