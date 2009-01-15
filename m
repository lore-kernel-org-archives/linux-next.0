From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 16:27:08 +1100
Message-ID: <20090115162708.74cd1428.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41330 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751505AbZAOF1K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 00:27:10 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>, Vegard Nossum <vegard.nossum@gmail.com>, Ingo Molnar <mingo@elte.hu>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in mm/slab.c
between commit 30532cb3c49a2a9fed94127aab26003c52398a51 ("slab: add hooks
for kmemcheck") from the kmemcheck tree and commit
26e73e5a681dc8268bd3fbcb3c26f4ac9fdc8433 ("kmemleak: Add the slab memory
allocation/freeing hooks") from the kmemleak tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slab.c
index dffbac3,8e7c952..0000000
--- a/mm/slab.c
+++ b/mm/slab.c
@@@ -179,13 -178,13 +180,13 @@@
  			 SLAB_STORE_USER | \
  			 SLAB_RECLAIM_ACCOUNT | SLAB_PANIC | \
  			 SLAB_DESTROY_BY_RCU | SLAB_MEM_SPREAD | \
- 			 SLAB_DEBUG_OBJECTS | SLAB_NOTRACK)
 -			 SLAB_DEBUG_OBJECTS | SLAB_NOLEAKTRACE)
++			 SLAB_DEBUG_OBJECTS | SLAB_NOTRACK | SLAB_NOLEAKTRACE)
  #else
  # define CREATE_MASK	(SLAB_HWCACHE_ALIGN | \
  			 SLAB_CACHE_DMA | \
  			 SLAB_RECLAIM_ACCOUNT | SLAB_PANIC | \
  			 SLAB_DESTROY_BY_RCU | SLAB_MEM_SPREAD | \
- 			 SLAB_DEBUG_OBJECTS | SLAB_NOTRACK)
 -			 SLAB_DEBUG_OBJECTS | SLAB_NOLEAKTRACE)
++			 SLAB_DEBUG_OBJECTS | SLAB_NOTRACK | SLAB_NOLEAKTRACE)
  #endif
  
  /*
@@@ -3285,10 -3372,9 +3308,12 @@@ __cache_alloc_node(struct kmem_cache *c
    out:
  	local_irq_restore(save_flags);
  	ptr = cache_alloc_debugcheck_after(cachep, flags, ptr, caller);
+ 	kmemleak_alloc_recursive(ptr, obj_size(cachep), 1, cachep->flags,
+ 				 flags);
  
 +	if (likely(ptr))
 +		kmemcheck_slab_alloc(cachep, flags, ptr, obj_size(cachep));
 +
  	if (unlikely((flags & __GFP_ZERO) && ptr))
  		memset(ptr, 0, obj_size(cachep));
  
@@@ -3341,11 -3427,10 +3366,13 @@@ __cache_alloc(struct kmem_cache *cachep
  	objp = __do_cache_alloc(cachep, flags);
  	local_irq_restore(save_flags);
  	objp = cache_alloc_debugcheck_after(cachep, flags, objp, caller);
+ 	kmemleak_alloc_recursive(objp, obj_size(cachep), 1, cachep->flags,
+ 				 flags);
  	prefetchw(objp);
  
 +	if (likely(objp))
 +		kmemcheck_slab_alloc(cachep, flags, objp, obj_size(cachep));
 +
  	if (unlikely((flags & __GFP_ZERO) && objp))
  		memset(objp, 0, obj_size(cachep));
  
@@@ -3459,10 -3544,9 +3486,11 @@@ static inline void __cache_free(struct 
  	struct array_cache *ac = cpu_cache_get(cachep);
  
  	check_irq_off();
+ 	kmemleak_free_recursive(objp, cachep->flags);
  	objp = cache_free_debugcheck(cachep, objp, __builtin_return_address(0));
  
 +	kmemcheck_slab_free(cachep, objp, obj_size(cachep));
 +
  	/*
  	 * Skip calling cache_free_alien() when the platform is not numa.
  	 * This will avoid cache misses that happen while accessing slabp (which
