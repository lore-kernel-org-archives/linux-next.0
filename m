From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with Linus' tree
Date: Fri, 12 Jun 2009 13:54:29 +1000
Message-ID: <20090612135429.148b10b2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37036 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752656AbZFLEVn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Jun 2009 00:21:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pekka Enberg <penberg@cs.helsinki.fi>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in init/main.c
between commit 83b519e8b9572c319c8e0c615ee5dd7272856090 ("slab: setup
allocators earlier in the boot sequence") from Linus' tree and commit
779e04433765330a3df44d3a4e5409cbf2963000 ("cpuhotplug: remove
cpu_hotplug_init()") from the rr tree.

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc init/main.c
index 5616661,c1b68bb..0000000
--- a/init/main.c
+++ b/init/main.c
@@@ -664,12 -645,14 +664,11 @@@ asmlinkage void __init start_kernel(voi
  		initrd_start = 0;
  	}
  #endif
 -	vmalloc_init();
 -	vfs_caches_init_early();
  	cpuset_init_early();
  	page_cgroup_init();
 -	mem_init();
  	enable_debug_pagealloc();
- 	cpu_hotplug_init();
 -	kmem_cache_init();
  	kmemtrace_init();
 +	kmemleak_init();
  	debug_objects_mem_init();
  	idr_init_cache();
  	setup_per_cpu_pageset();
