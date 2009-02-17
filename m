From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the tip-core
 tree
Date: Tue, 17 Feb 2009 19:45:27 +1100
Message-ID: <20090217194527.621fe838.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34099 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752094AbZBQIpd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 03:45:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>, Pekka Enberg <penberg@cs.helsinki.fi>, Matt Mackall <mpm@selenic.com>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in mm/slob.c
between commit cf40bd16fdad42c053040bcd3988f5fdedbb6c57 ("lockdep:
annotate reclaim context (__GFP_NOFS)") from the tip-core tree and commit
33d7fde6394827e7d12ad87faf7e0efab12882f3 ("kmemleak: Add the slob memory
allocation/freeing hooks") from the kmemleak tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slob.c
index 318b6dc,30b870f..0000000
--- a/mm/slob.c
+++ b/mm/slob.c
@@@ -501,12 -482,9 +502,13 @@@ void *__kmalloc_node(size_t size, gfp_
  			page = virt_to_page(ret);
  			page->private = size;
  		}
 +
 +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_KMALLOC,
 +					  _RET_IP_, ret,
 +					  size, PAGE_SIZE << order, gfp, node);
  	}
  
+ 	kmemleak_alloc(ret, size, 1, gfp);
  	return ret;
  }
  EXPORT_SYMBOL(__kmalloc_node);
@@@ -517,9 -495,10 +519,10 @@@ void kfree(const void *block
  
  	if (unlikely(ZERO_OR_NULL_PTR(block)))
  		return;
+ 	kmemleak_free(block);
  
 -	sp = (struct slob_page *)virt_to_page(block);
 -	if (slob_page(sp)) {
 +	sp = slob_page(block);
 +	if (is_slob_page(sp)) {
  		int align = max(ARCH_KMALLOC_MINALIGN, ARCH_SLAB_MINALIGN);
  		unsigned int *m = (unsigned int *)(block - align);
  		slob_free(m, *m + align);
