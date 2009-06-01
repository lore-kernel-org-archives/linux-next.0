From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the kmemleak
 tree
Date: Mon, 1 Jun 2009 17:55:40 +1000
Message-ID: <20090601175540.b5a3a1cf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43769 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755461AbZFAILS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2009 04:11:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
mm/slab.c between commit 5b1173b0ea49874431e1d5f07c57a373a26f75f1
("kmemleak: Add the slab memory allocation/freeing hooks") from the
kmemleak tree and commit 30532cb3c49a2a9fed94127aab26003c52398a51 ("slab:
add hooks for kmemcheck") from the kmemcheck tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/slab.c
index eb96d3b,6bf8a95..0000000
--- a/mm/slab.c
+++ b/mm/slab.c
@@@ -179,13 -179,13 +180,13 @@@
  			 SLAB_STORE_USER | \
  			 SLAB_RECLAIM_ACCOUNT | SLAB_PANIC | \
  			 SLAB_DESTROY_BY_RCU | SLAB_MEM_SPREAD | \
- 			 SLAB_DEBUG_OBJECTS | SLAB_NOLEAKTRACE)
 -			 SLAB_DEBUG_OBJECTS | SLAB_NOTRACK)
++			 SLAB_DEBUG_OBJECTS | SLAB_NOLEAKTRACE | SLAB_NOTRACK)
  #else
  # define CREATE_MASK	(SLAB_HWCACHE_ALIGN | \
  			 SLAB_CACHE_DMA | \
  			 SLAB_RECLAIM_ACCOUNT | SLAB_PANIC | \
  			 SLAB_DESTROY_BY_RCU | SLAB_MEM_SPREAD | \
- 			 SLAB_DEBUG_OBJECTS | SLAB_NOLEAKTRACE)
 -			 SLAB_DEBUG_OBJECTS | SLAB_NOTRACK)
++			 SLAB_DEBUG_OBJECTS | SLAB_NOLEAKTRACE | SLAB_NOTRACK)
  #endif
  
  /*
@@@ -3392,9 -3292,10 +3324,12 @@@ __cache_alloc_node(struct kmem_cache *c
    out:
  	local_irq_restore(save_flags);
  	ptr = cache_alloc_debugcheck_after(cachep, flags, ptr, caller);
 +	kmemleak_alloc_recursive(ptr, obj_size(cachep), 1, cachep->flags,
 +				 flags);
  
+ 	if (likely(ptr))
+ 		kmemcheck_slab_alloc(cachep, flags, ptr, obj_size(cachep));
+ 
  	if (unlikely((flags & __GFP_ZERO) && ptr))
  		memset(ptr, 0, obj_size(cachep));
  
@@@ -3449,10 -3350,11 +3384,13 @@@ __cache_alloc(struct kmem_cache *cachep
  	objp = __do_cache_alloc(cachep, flags);
  	local_irq_restore(save_flags);
  	objp = cache_alloc_debugcheck_after(cachep, flags, objp, caller);
 +	kmemleak_alloc_recursive(objp, obj_size(cachep), 1, cachep->flags,
 +				 flags);
  	prefetchw(objp);
  
+ 	if (likely(objp))
+ 		kmemcheck_slab_alloc(cachep, flags, objp, obj_size(cachep));
+ 
  	if (unlikely((flags & __GFP_ZERO) && objp))
  		memset(objp, 0, obj_size(cachep));
  
@@@ -3566,9 -3468,10 +3504,11 @@@ static inline void __cache_free(struct 
  	struct array_cache *ac = cpu_cache_get(cachep);
  
  	check_irq_off();
 +	kmemleak_free_recursive(objp, cachep->flags);
  	objp = cache_free_debugcheck(cachep, objp, __builtin_return_address(0));
  
+ 	kmemcheck_slab_free(cachep, objp, obj_size(cachep));
+ 
  	/*
  	 * Skip calling cache_free_alien() when the platform is not numa.
  	 * This will avoid cache misses that happen while accessing slabp (which
