From: Nick Piggin <npiggin@suse.de>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 09:34:45 +0200
Message-ID: <20090630073445.GC2308@wotan.suse.de>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de> <20090629115038.GD9321@osiris.boeblingen.de.ibm.com> <20090629115835.GA2308@wotan.suse.de> <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:49720 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751718AbZF3Hen (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Jun 2009 03:34:43 -0400
Content-Disposition: inline
In-Reply-To: <20090629141234.GF9321@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Sachin Sant <sachinp@in.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

On Mon, Jun 29, 2009 at 04:12:34PM +0200, Heiko Carstens wrote:
> slqb returns ZERO_SIZE_PTR instead of NULL for large size requests it cannot
> handle.

Ah, thank you for debugging this. Great.


> The patch below would fix it. But I think its too ugly. So I leave it up to
> Nick to come up with a real and nice patch ;)

The patch isn't so bad :) It is for the constant case anyway so it
should optimize away. But I think I have a similar problem for
the non constant case too, so I will look at doing another patch.

Thanks,
Nick
> 
> diff --git a/include/linux/slqb_def.h b/include/linux/slqb_def.h
> index 7b4a601..9d03485 100644
> --- a/include/linux/slqb_def.h
> +++ b/include/linux/slqb_def.h
> @@ -187,7 +187,7 @@ static __always_inline int kmalloc_index(size_t size)
>  	if (unlikely(!size))
>  		return 0;
>  	if (unlikely(size > 1UL << KMALLOC_SHIFT_SLQB_HIGH))
> -		return 0;
> +		return -1;
>  
>  	if (unlikely(size <= KMALLOC_MIN_SIZE))
>  		return KMALLOC_SHIFT_LOW;
> @@ -219,7 +219,7 @@ static __always_inline int kmalloc_index(size_t size)
>  	if (size <= 512 * 1024) return 19;
>  	if (size <= 1024 * 1024) return 20;
>  	if (size <=  2 * 1024 * 1024) return 21;
> -	return -1;
> +	return -2;
>  }
>  
>  #ifdef CONFIG_ZONE_DMA
> @@ -239,8 +239,12 @@ static __always_inline struct kmem_cache *kmalloc_slab(size_t size, gfp_t flags)
>  	int index;
>  
>  	index = kmalloc_index(size);
> -	if (unlikely(index == 0))
> -		return ZERO_SIZE_PTR;
> +	if (unlikely(index <= 0)) {
> +		if (index == 0)
> +			return ZERO_SIZE_PTR;
> +		if (index == -1)
> +			return NULL;
> +	}
>  
>  	if (likely(!(flags & SLQB_DMA)))
>  		return &kmalloc_caches[index];
