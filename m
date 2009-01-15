From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 16:26:53 +1100
Message-ID: <20090115162653.033c1351.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41313 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751159AbZAOF1A (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 00:27:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, Pekka Enberg <penberg@cs.helsinki.fi>, Vegard Nossum <vegard.nossum@gmail.com>, Ingo Molnar <mingo@elte.hu>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in mm/slub.c
between commit 18fd427debcf37c06917b55295df682fd05fee76 ("slub: add hooks
for kmemcheck") from the kmemcheck tree and commit
64ea489328c2f450fb4dca49b9a33d1b2ddf0248 ("kmemleak: Add the slub memory
allocation/freeing hooks") from the kmemleak tree.

Just simple overlapping additions.  I fixed it up (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slub.c
index 3f6953d,13543f5..0000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -16,9 -16,9 +16,10 @@@
  #include <linux/slab.h>
  #include <linux/proc_fs.h>
  #include <linux/seq_file.h>
 +#include <trace/kmemtrace.h>
  #include <linux/cpu.h>
  #include <linux/cpuset.h>
+ #include <linux/kmemleak.h>
  #include <linux/mempolicy.h>
  #include <linux/ctype.h>
  #include <linux/debugobjects.h>
@@@ -143,10 -142,10 +144,10 @@@
   * Set of flags that will prevent slab merging
   */
  #define SLUB_NEVER_MERGE (SLAB_RED_ZONE | SLAB_POISON | SLAB_STORE_USER | \
- 		SLAB_TRACE | SLAB_DESTROY_BY_RCU)
+ 		SLAB_TRACE | SLAB_DESTROY_BY_RCU | SLAB_NOLEAKTRACE)
  
  #define SLUB_MERGE_SAME (SLAB_DEBUG_FREE | SLAB_RECLAIM_ACCOUNT | \
 -		SLAB_CACHE_DMA)
 +		SLAB_CACHE_DMA | SLAB_NOTRACK)
  
  #ifndef ARCH_KMALLOC_MINALIGN
  #define ARCH_KMALLOC_MINALIGN __alignof__(unsigned long long)
@@@ -1630,7 -1619,7 +1631,8 @@@ static __always_inline void *slab_alloc
  	if (unlikely((gfpflags & __GFP_ZERO) && object))
  		memset(object, 0, objsize);
  
 +	kmemcheck_slab_alloc(s, gfpflags, object, c->objsize);
+ 	kmemleak_alloc_recursive(object, objsize, 1, s->flags, gfpflags);
  	return object;
  }
  
@@@ -1761,9 -1722,9 +1763,10 @@@ static __always_inline void slab_free(s
  	struct kmem_cache_cpu *c;
  	unsigned long flags;
  
+ 	kmemleak_free_recursive(x, s->flags);
  	local_irq_save(flags);
  	c = get_cpu_slab(s, smp_processor_id());
 +	kmemcheck_slab_free(s, object, c->objsize);
  	debug_check_no_locks_freed(object, c->objsize);
  	if (!(s->flags & SLAB_DEBUG_OBJECTS))
  		debug_check_no_obj_freed(object, s->objsize);
