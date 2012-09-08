From: Christoph Lameter <cl@linux.com>
Subject: Re: ia64 dies in slab code on next-20120906
Date: Sat, 8 Sep 2012 18:27:10 +0000
Message-ID: <00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com> <20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from a194-183.smtp-out.amazonses.com ([199.255.194.183]:64770 "EHLO
	a194-183.smtp-out.amazonses.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752151Ab2IHS1M (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 8 Sep 2012 14:27:12 -0400
In-Reply-To: <20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org, Pekka Enberg <penberg@kernel.org>

Thanks Tony for the additional information regarding the pointer. That got
me thinking about something different.

Try the following fix:

Subject: slub: Zero initial memory segment for kmem_cache and kmem_cache_node

Earlier patches in the common set moved the zeroing of the kmem_cache structure
into common code. See "Move allocation of kmem_cache into common code".

The allocation for the two special structures is still done
from slub specific code but no zeroing is done since the cache creation functions
used to zero. This now needs to be updated so that the structures
are zeroed during allocation in kmem_cache_init().
Otherwise random pointer values may be followed.

Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/mm/slub.c
===================================================================
--- linux.orig/mm/slub.c	2012-09-08 13:21:33.523056357 -0500
+++ linux/mm/slub.c	2012-09-08 13:22:12.483056947 -0500
@@ -3705,7 +3705,7 @@
 	/* Allocate two kmem_caches from the page allocator */
 	kmalloc_size = ALIGN(kmem_size, cache_line_size());
 	order = get_order(2 * kmalloc_size);
-	kmem_cache = (void *)__get_free_pages(GFP_NOWAIT, order);
+	kmem_cache = (void *)__get_free_pages(GFP_NOWAIT|__GFP_ZERO, order);

 	/*
 	 * Must first have the slab cache available for the allocations of the
