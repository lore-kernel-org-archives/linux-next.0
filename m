From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Mon, 14 Nov 2016 17:08:35 +1100
Message-ID: <20161114170835.0c3726e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49185 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934182AbcKNGIj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Nov 2016 01:08:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Vladimir Davydov <vdavydov.dev@gmail.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/memcontrol.c

between commit:

  308167fcb330 ("mm/memcg: Convert to hotplug state machine")

from the tip tree and commit:

  2558c318449d ("mm: memcontrol: use special workqueue for creating per-memcg caches")

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

diff --cc mm/memcontrol.c
index 6c2043509fb5,91dfc7c5ce8f..000000000000
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@@ -5774,8 -5785,18 +5776,19 @@@ static int __init mem_cgroup_init(void
  {
  	int cpu, node;
  
+ #ifndef CONFIG_SLOB
+ 	/*
+ 	 * Kmem cache creation is mostly done with the slab_mutex held,
+ 	 * so use a special workqueue to avoid stalling all worker
+ 	 * threads in case lots of cgroups are created simultaneously.
+ 	 */
+ 	memcg_kmem_cache_create_wq =
+ 		alloc_ordered_workqueue("memcg_kmem_cache_create", 0);
+ 	BUG_ON(!memcg_kmem_cache_create_wq);
+ #endif
+ 
 -	hotcpu_notifier(memcg_cpu_hotplug_callback, 0);
 +	cpuhp_setup_state_nocalls(CPUHP_MM_MEMCQ_DEAD, "mm/memctrl:dead", NULL,
 +				  memcg_hotplug_cpu_dead);
  
  	for_each_possible_cpu(cpu)
  		INIT_WORK(&per_cpu_ptr(&memcg_stock, cpu)->work,
