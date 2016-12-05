From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Mon, 5 Dec 2016 16:38:08 +1100
Message-ID: <20161205163808.6d3918b6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49419 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750813AbcLEFiL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Dec 2016 00:38:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/workingset.c

between commit:

  20ab67a563f5 ("mm: workingset: fix NULL ptr in count_shadow_nodes")

from Linus' tree and commit:

  8b6983cf8ca6 ("mm: workingset: update shadow limit to reflect bigger active list")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc mm/workingset.c
index fb1f9183d89a,02ab8746abde..000000000000
--- a/mm/workingset.c
+++ b/mm/workingset.c
@@@ -366,16 -394,22 +394,22 @@@ static unsigned long count_shadow_nodes
  	 *
  	 * On 64-bit with 7 radix_tree_nodes per page and 64 slots
  	 * each, this will reclaim shadow entries when they consume
- 	 * ~2% of available memory:
+ 	 * ~1.8% of available memory:
  	 *
- 	 * PAGE_SIZE / radix_tree_nodes / node_entries / PAGE_SIZE
+ 	 * PAGE_SIZE / radix_tree_nodes / node_entries * 8 / PAGE_SIZE
  	 */
- 	max_nodes = pages >> (1 + RADIX_TREE_MAP_SHIFT - 3);
 -	if (memcg_kmem_enabled()) {
++	if (sc->memcg) {
+ 		cache = mem_cgroup_node_nr_lru_pages(sc->memcg, sc->nid,
+ 						     LRU_ALL_FILE);
+ 	} else {
+ 		cache = node_page_state(NODE_DATA(sc->nid), NR_ACTIVE_FILE) +
+ 			node_page_state(NODE_DATA(sc->nid), NR_INACTIVE_FILE);
+ 	}
+ 	max_nodes = cache >> (RADIX_TREE_MAP_SHIFT - 3);
  
- 	if (shadow_nodes <= max_nodes)
+ 	if (nodes <= max_nodes)
  		return 0;
- 
- 	return shadow_nodes - max_nodes;
+ 	return nodes - max_nodes;
  }
  
  static enum lru_status shadow_lru_isolate(struct list_head *item,
