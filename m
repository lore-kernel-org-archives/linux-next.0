From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the nommu tree
Date: Thu, 11 Dec 2008 18:43:35 +1100
Message-ID: <20081211184335.837aca47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51540 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751094AbYLKHnm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 02:43:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>

Hi David,

Today's linux-next merge of the nommu tree got a conflict in
kernel/fork.c between commit e6df1035b1b488cafde1e69f1a25f2706c3ac1f7
("kmemcheck: add mm functions") from the kmemcheck tree and commit
f65466230e8afd45f716e5b836711ce270f45105 ("NOMMU: Make VMAs per MM as for
MMU-mode linux") from the nommu tree.

I fixed it up as best I can (see below) and can carry the fix as
necessary (though it would be good if you guys could figure out a better
solution).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/fork.c
index 446167a,d7c5b42..0000000
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@@ -1459,23 -1451,21 +1459,21 @@@ void __init proc_caches_init(void
  {
  	sighand_cachep = kmem_cache_create("sighand_cache",
  			sizeof(struct sighand_struct), 0,
 -			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_DESTROY_BY_RCU,
 -			sighand_ctor);
 +			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_DESTROY_BY_RCU|
 +			SLAB_NOTRACK, sighand_ctor);
  	signal_cachep = kmem_cache_create("signal_cache",
  			sizeof(struct signal_struct), 0,
 -			SLAB_HWCACHE_ALIGN|SLAB_PANIC, NULL);
 +			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_NOTRACK, NULL);
  	files_cachep = kmem_cache_create("files_cache",
  			sizeof(struct files_struct), 0,
 -			SLAB_HWCACHE_ALIGN|SLAB_PANIC, NULL);
 +			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_NOTRACK, NULL);
  	fs_cachep = kmem_cache_create("fs_cache",
  			sizeof(struct fs_struct), 0,
 -			SLAB_HWCACHE_ALIGN|SLAB_PANIC, NULL);
 +			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_NOTRACK, NULL);
- 	vm_area_cachep = kmem_cache_create("vm_area_struct",
- 			sizeof(struct vm_area_struct), 0,
- 			SLAB_PANIC|SLAB_NOTRACK, NULL);
  	mm_cachep = kmem_cache_create("mm_struct",
  			sizeof(struct mm_struct), ARCH_MIN_MMSTRUCT_ALIGN,
 -			SLAB_HWCACHE_ALIGN|SLAB_PANIC, NULL);
 +			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_NOTRACK, NULL);
+ 	mmap_init();
  }
  
  /*
diff --git a/mm/mmap.c b/mm/mmap.c
index 6e5fc98..d85193e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -2478,5 +2478,5 @@ void __init mmap_init(void)
 {
 	vm_area_cachep = kmem_cache_create("vm_area_struct",
 			sizeof(struct vm_area_struct), 0,
-			SLAB_PANIC, NULL);
+			SLAB_PANIC|SLAB_NOTRACK, NULL);
 }
diff --git a/mm/nommu.c b/mm/nommu.c
index 61b7f7a..efb3d01 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -447,10 +447,10 @@ void __init mmap_init(void)
 {
 	vm_region_jar = kmem_cache_create("vm_region_jar",
 					  sizeof(struct vm_region), 0,
-					  SLAB_PANIC, NULL);
+					  SLAB_PANIC|SLAB_NOTRACK, NULL);
 	vm_area_cachep = kmem_cache_create("vm_area_struct",
 					   sizeof(struct vm_area_struct), 0,
-					   SLAB_PANIC, NULL);
+					   SLAB_PANIC|SLAB_NOTRACK, NULL);
 }
 
 /*
