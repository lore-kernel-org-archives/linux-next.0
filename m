From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] slub: fix ksize() build error
Date: Sat, 26 Feb 2011 14:39:49 -0800
Message-ID: <4D698135.1050302@oracle.com>
References: <20110225105205.5a1309bb.randy.dunlap@oracle.com> <1298747426-8236-1-git-send-email-mk@lab.zgora.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:24446 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751311Ab1BZWli (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 26 Feb 2011 17:41:38 -0500
In-Reply-To: <1298747426-8236-1-git-send-email-mk@lab.zgora.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mariusz Kozlowski <mk@lab.zgora.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Eric Dumazet <eric.dumazet@gmail.com>, linux-next@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On 02/26/11 11:10, Mariusz Kozlowski wrote:
> mm/slub.c: In function 'ksize':
> mm/slub.c:2728: error: implicit declaration of function 'slab_ksize'
> 
> slab_ksize() needs to go out of CONFIG_SLUB_DEBUG section.
> 
> Signed-off-by: Mariusz Kozlowski <mk@lab.zgora.pl>

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks.

> ---
> Maybe something like this? Compile tested for slub debug enabled/disabled.
> 
>  mm/slub.c |   48 ++++++++++++++++++++++++------------------------
>  1 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 217b5b5..ea6f039 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -281,6 +281,30 @@ static inline int slab_index(void *p, struct kmem_cache *s, void *addr)
>  	return (p - addr) / s->size;
>  }
>  
> +static inline size_t slab_ksize(const struct kmem_cache *s)
> +{
> +#ifdef CONFIG_SLUB_DEBUG
> +	/*
> +	 * Debugging requires use of the padding between object
> +	 * and whatever may come after it.
> +	 */
> +	if (s->flags & (SLAB_RED_ZONE | SLAB_POISON))
> +		return s->objsize;
> +
> +#endif
> +	/*
> +	 * If we have the need to store the freelist pointer
> +	 * back there or track user information then we can
> +	 * only use the space before that information.
> +	 */
> +	if (s->flags & (SLAB_DESTROY_BY_RCU | SLAB_STORE_USER))
> +		return s->inuse;
> +	/*
> +	 * Else we can use all the padding etc for the allocation
> +	 */
> +	return s->size;
> +}
> +
>  static inline struct kmem_cache_order_objects oo_make(int order,
>  						unsigned long size)
>  {
> @@ -797,30 +821,6 @@ static inline int slab_pre_alloc_hook(struct kmem_cache *s, gfp_t flags)
>  	return should_failslab(s->objsize, flags, s->flags);
>  }
>  
> -static inline size_t slab_ksize(const struct kmem_cache *s)
> -{
> -#ifdef CONFIG_SLUB_DEBUG
> -	/*
> -	 * Debugging requires use of the padding between object
> -	 * and whatever may come after it.
> -	 */
> -	if (s->flags & (SLAB_RED_ZONE | SLAB_POISON))
> -		return s->objsize;
> -
> -#endif
> -	/*
> -	 * If we have the need to store the freelist pointer
> -	 * back there or track user information then we can
> -	 * only use the space before that information.
> -	 */
> -	if (s->flags & (SLAB_DESTROY_BY_RCU | SLAB_STORE_USER))
> -		return s->inuse;
> -	/*
> -	 * Else we can use all the padding etc for the allocation
> -	 */
> -	return s->size;
> -}
> -
>  static inline void slab_post_alloc_hook(struct kmem_cache *s, gfp_t flags, void *object)
>  {
>  	flags &= gfp_allowed_mask;


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
