From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Thu, 2 Nov 2017 19:05:09 +1100
Message-ID: <20171102190509.12bbd37e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sasha Levin <alexander.levin@verizon.com>, David Windsor <dave@nullcore.net>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/fork.c

between commit:

  962b2ff950dd ("fork: Define usercopy region in mm_struct slab caches")
  41359fc82cc7 ("fork: Provide usercopy whitelisting for task_struct")

from the kspp tree and commit:

  9738ce7db723 ("kmemcheck: stop using GFP_NOTRACK and SLAB_NOTRACK")

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

diff --cc kernel/fork.c
index 87bc10bb2b5a,f28d946586c5..000000000000
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@@ -481,14 -701,11 +717,14 @@@ void __init fork_init(void
  #define ARCH_MIN_TASKALIGN	0
  #endif
  	int align = max_t(int, L1_CACHE_BYTES, ARCH_MIN_TASKALIGN);
 +	unsigned long useroffset, usersize;
  
  	/* create a slab on which task_structs can be allocated */
 -	task_struct_cachep = kmem_cache_create("task_struct",
 +	task_struct_whitelist(&useroffset, &usersize);
 +	task_struct_cachep = kmem_cache_create_usercopy("task_struct",
  			arch_task_struct_size, align,
- 			SLAB_PANIC|SLAB_NOTRACK|SLAB_ACCOUNT,
 -			SLAB_PANIC|SLAB_ACCOUNT, NULL);
++			SLAB_PANIC|SLAB_ACCOUNT,
 +			useroffset, usersize, NULL);
  #endif
  
  	/* do the arch specific task caches init */
@@@ -2248,11 -2250,9 +2269,11 @@@ void __init proc_caches_init(void
  	 * maximum number of CPU's we can ever have.  The cpumask_allocation
  	 * is at the end of the structure, exactly for that reason.
  	 */
 -	mm_cachep = kmem_cache_create("mm_struct",
 +	mm_cachep = kmem_cache_create_usercopy("mm_struct",
  			sizeof(struct mm_struct), ARCH_MIN_MMSTRUCT_ALIGN,
- 			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_NOTRACK|SLAB_ACCOUNT,
+ 			SLAB_HWCACHE_ALIGN|SLAB_PANIC|SLAB_ACCOUNT,
 +			offsetof(struct mm_struct, saved_auxv),
 +			sizeof_field(struct mm_struct, saved_auxv),
  			NULL);
  	vm_area_cachep = KMEM_CACHE(vm_area_struct, SLAB_PANIC|SLAB_ACCOUNT);
  	mmap_init();
