From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] crypto: marvell/cesa - another fix up for
 of_get_named_gen_pool() rename
Date: Fri, 3 Jul 2015 10:59:07 -0700
Message-ID: <20150703175907.GA27122@roeck-us.net>
References: <20150703134937.36a048b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58127 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755251AbbGCR7Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jul 2015 13:59:16 -0400
Content-Disposition: inline
In-Reply-To: <20150703134937.36a048b0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 03, 2015 at 01:49:37PM +1000, Stephen Rothwell wrote:
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/crypto/mv_cesa.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Andrew, you seem to have forgotten this one (or maybe it was not needed
> in Linus' tree when you sent that last patch bomb).  Anyway, this is
> now needed in Linus' tree.
> 
See also https://lkml.org/lkml/2015/6/25/122.

Guenter

> diff --git a/drivers/crypto/mv_cesa.c b/drivers/crypto/mv_cesa.c
> index 5bcd575fa96f..e6b658faef63 100644
> --- a/drivers/crypto/mv_cesa.c
> +++ b/drivers/crypto/mv_cesa.c
> @@ -1034,8 +1034,8 @@ static int mv_cesa_get_sram(struct platform_device *pdev,
>  			     &sram_size);
>  
>  	cp->sram_size = sram_size;
> -	cp->sram_pool = of_get_named_gen_pool(pdev->dev.of_node,
> -					      "marvell,crypto-srams", 0);
> +	cp->sram_pool = of_gen_pool_get(pdev->dev.of_node,
> +					"marvell,crypto-srams", 0);
>  	if (cp->sram_pool) {
>  		cp->sram = gen_pool_dma_alloc(cp->sram_pool, sram_size,
>  					      &cp->sram_dma);
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 
> 
