From: Pekka J Enberg <penberg@cs.helsinki.fi>
Subject: Re: linux-next: slab tree build warning
Date: Wed, 4 Feb 2009 10:11:16 +0200 (EET)
Message-ID: <Pine.LNX.4.64.0902041009050.32130@melkki.cs.Helsinki.FI>
References: <20090204183847.771df81b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from courier.cs.helsinki.fi ([128.214.9.1]:35478 "EHLO
	mail.cs.helsinki.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751599AbZBDILT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2009 03:11:19 -0500
In-Reply-To: <20090204183847.771df81b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>

On Wed, 4 Feb 2009, Stephen Rothwell wrote:
> Today's linux-next build (powerpc allnoconfig) produced this warning:
> 
> mm/slqb.c: In function 'kmem_cache_open':
> mm/slqb.c:2180: warning: label 'error_lock' defined but not used
> mm/slqb.c:2176: warning: label 'error_cpu_array' defined but not used
> 
> Caused by commit 8b9ffd9d52479bd17b5729c9f3acaefa90c7e585 ("slqb: dynamic
> array allocations").
> 
> Clearly neither CONFIG_SMP not CONFIG_NUMA is set.

Here's a simple fix for it. It would probably be better to get rid of the 
#ifdefs in kmem_cache_open() with empty static inlines for the 
!CONFIG_SMP and !CONFIG_NUMA cases.

Nick, I did not apply this patch yet so ACK/NAK, please.

		Pekka

>From 2e58614cfdc0a823af7e73b4f3f979817cdba465 Mon Sep 17 00:00:00 2001
From: Pekka Enberg <penberg@cs.helsinki.fi>
Date: Wed, 4 Feb 2009 10:06:14 +0200
Subject: [PATCH] SLQB: Fix compile warnings on UMA and UP

As reported by Stephen Rothwell:

  Today's linux-next build (powerpc allnoconfig) produced this warning:

  mm/slqb.c: In function 'kmem_cache_open':
  mm/slqb.c:2180: warning: label 'error_lock' defined but not used
  mm/slqb.c:2176: warning: label 'error_cpu_array' defined but not used

  Caused by commit 8b9ffd9d52479bd17b5729c9f3acaefa90c7e585 ("slqb: dynamic
  array allocations").

  Clearly neither CONFIG_SMP not CONFIG_NUMA is set.

Fix those up by wrapping the labes in ifdef CONFIG_SMP and CONFIG_NUMA where
appropriate.

Cc: Nick Piggin <npiggin@suse.de>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Pekka Enberg <penberg@cs.helsinki.fi>
---
 mm/slqb.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/slqb.c b/mm/slqb.c
index 4352dad..07bf5b3 100644
--- a/mm/slqb.c
+++ b/mm/slqb.c
@@ -2172,12 +2172,12 @@ error_nodes:
 error_node_array:
 #ifdef CONFIG_NUMA
 	kmem_cache_dyn_array_free(s->node_slab);
-#endif
 error_cpu_array:
+#endif
 #ifdef CONFIG_SMP
 	kmem_cache_dyn_array_free(s->cpu_slab);
-#endif
 error_lock:
+#endif
 	up_write(&slqb_lock);
 error:
 	if (flags & SLAB_PANIC)
-- 
1.5.4.3
