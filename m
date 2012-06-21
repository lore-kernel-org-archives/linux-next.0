From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: manual merge of the tip tree with the slab tree
Date: Thu, 21 Jun 2012 00:24:23 -0700 (PDT)
Message-ID: <alpine.DEB.2.00.1206210024030.31077@chino.kir.corp.google.com>
References: <20120621134844.36eacc287e76a38b960f2ef2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:48869 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753428Ab2FUHY0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jun 2012 03:24:26 -0400
Received: by pbbrp8 with SMTP id rp8so1699572pbb.19
        for <linux-next@vger.kernel.org>; Thu, 21 Jun 2012 00:24:26 -0700 (PDT)
In-Reply-To: <20120621134844.36eacc287e76a38b960f2ef2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, Christoph Lameter <cl@linux.com>, KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, David Mackey <tdmackey@twitter.com>, Pekka Enberg <penberg@kernel.org>

On Thu, 21 Jun 2012, Stephen Rothwell wrote:

> diff --cc mm/slab.c
> index dd607a8,5070f96..0000000
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@@ -3341,8 -3367,8 +3341,8 @@@ static void *fallback_alloc(struct kmem
>   	local_flags = flags & (GFP_CONSTRAINT_MASK|GFP_RECLAIM_MASK);
>   
>   retry_cpuset:
> - 	cpuset_mems_cookie = get_mems_allowed();
> + 	cpuset_mems_cookie = read_mems_allowed_begin();
>  -	zonelist = node_zonelist(slab_node(current->mempolicy), flags);
>  +	zonelist = node_zonelist(slab_node(), flags);
>   
>   retry:
>   	/*
> diff --cc mm/slub.c
> index f96d8bc,fb2ef09..0000000
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@@ -1616,8 -1616,8 +1616,8 @@@ static void *get_any_partial(struct kme
>   		return NULL;
>   
>   	do {
> - 		cpuset_mems_cookie = get_mems_allowed();
> + 		cpuset_mems_cookie = read_mems_allowed_begin();
>  -		zonelist = node_zonelist(slab_node(current->mempolicy), flags);
>  +		zonelist = node_zonelist(slab_node(), flags);
>   		for_each_zone_zonelist(zone, z, zonelist, high_zoneidx) {
>   			struct kmem_cache_node *n;
>   

Looks good.
