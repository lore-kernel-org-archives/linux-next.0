From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with Linus'
 tree
Date: Mon, 5 Dec 2016 06:56:56 +0100
Message-ID: <20161205055655.GB30758@dhcp22.suse.cz>
References: <20161205163808.6d3918b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:32850 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750752AbcLEF5c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2016 00:57:32 -0500
Content-Disposition: inline
In-Reply-To: <20161205163808.6d3918b6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>

On Mon 05-12-16 16:38:08, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/workingset.c
> 
> between commit:
> 
>   20ab67a563f5 ("mm: workingset: fix NULL ptr in count_shadow_nodes")
> 
> from Linus' tree and commit:
> 
>   8b6983cf8ca6 ("mm: workingset: update shadow limit to reflect bigger active list")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned,

FWIW this resolution is correct

> but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Sorry about that, I haven't noticed the conflict.
 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc mm/workingset.c
> index fb1f9183d89a,02ab8746abde..000000000000
> --- a/mm/workingset.c
> +++ b/mm/workingset.c
> @@@ -366,16 -394,22 +394,22 @@@ static unsigned long count_shadow_nodes
>   	 *
>   	 * On 64-bit with 7 radix_tree_nodes per page and 64 slots
>   	 * each, this will reclaim shadow entries when they consume
> - 	 * ~2% of available memory:
> + 	 * ~1.8% of available memory:
>   	 *
> - 	 * PAGE_SIZE / radix_tree_nodes / node_entries / PAGE_SIZE
> + 	 * PAGE_SIZE / radix_tree_nodes / node_entries * 8 / PAGE_SIZE
>   	 */
> - 	max_nodes = pages >> (1 + RADIX_TREE_MAP_SHIFT - 3);
>  -	if (memcg_kmem_enabled()) {
> ++	if (sc->memcg) {
> + 		cache = mem_cgroup_node_nr_lru_pages(sc->memcg, sc->nid,
> + 						     LRU_ALL_FILE);
> + 	} else {
> + 		cache = node_page_state(NODE_DATA(sc->nid), NR_ACTIVE_FILE) +
> + 			node_page_state(NODE_DATA(sc->nid), NR_INACTIVE_FILE);
> + 	}
> + 	max_nodes = cache >> (RADIX_TREE_MAP_SHIFT - 3);
>   
> - 	if (shadow_nodes <= max_nodes)
> + 	if (nodes <= max_nodes)
>   		return 0;
> - 
> - 	return shadow_nodes - max_nodes;
> + 	return nodes - max_nodes;
>   }
>   
>   static enum lru_status shadow_lru_isolate(struct list_head *item,

-- 
Michal Hocko
SUSE Labs
