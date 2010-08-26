From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: build failure after merge of the final tree (slab
 tree related)
Date: Wed, 25 Aug 2010 17:01:27 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1008251656390.22018@chino.kir.corp.google.com>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi> <20100825101320.bed89b2a.sfr@canb.auug.org.au> <4C74A01E.1060809@cs.helsinki.fi> <alpine.DEB.2.00.1008250905490.13026@router.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([74.125.121.35]:60982 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752723Ab0HZABf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Aug 2010 20:01:35 -0400
In-Reply-To: <alpine.DEB.2.00.1008250905490.13026@router.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

On Wed, 25 Aug 2010, Christoph Lameter wrote:

> Since the percpu allocator does not provide early allocation in UP
> mode (only in SMP configurations) use __get_free_page() to improvise
> a compound page allocation that can be later freed via kfree().
> 
> Compound pages will be released when the cpu caches are resized.
> 
> Signed-off-by: Christoph Lameter <cl@linux.com>
> 
> ---
>  mm/slub.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Index: linux-2.6/mm/slub.c
> ===================================================================
> --- linux-2.6.orig/mm/slub.c	2010-08-24 20:07:12.766010774 -0500
> +++ linux-2.6/mm/slub.c	2010-08-24 20:15:46.304130417 -0500
> @@ -2064,8 +2064,24 @@
> 
>  static inline int alloc_kmem_cache_cpus(struct kmem_cache *s)
>  {
> +#ifdef CONFIG_SMP
> +	/*
> +	 * Will use reserve that does not require slab operation during
> +	 * early boot.
> +	 */
>  	BUILD_BUG_ON(PERCPU_DYNAMIC_EARLY_SIZE <
>  			SLUB_PAGE_SHIFT * sizeof(struct kmem_cache_cpu));
> +#else
> +	/*
> +	 * Special hack for UP mode. allocpercpu() falls back to kmalloc
> +	 * operations. So we cannot use that before the slab allocator is up
> +	 * Simply get the smallest possible compound page. The page will be
> +	 * released via kfree() when the cpu caches are resized later.
> +	 */
> +	if (slab_state < UP)
> +		s->cpu_slab = (__percpu void *)__get_free_page(GFP_NOWAIT, 1);

__get_free_pages() takes an order argument.

> +	else
> +#endif
> 
>  	s->cpu_slab = alloc_percpu(struct kmem_cache_cpu);
> 
