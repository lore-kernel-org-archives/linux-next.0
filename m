From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the tip-core
 tree
Date: Fri, 6 Mar 2009 18:21:46 +1100
Message-ID: <20090306182146.8f07e030.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33882 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751304AbZCFHVt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 02:21:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
include/linux/percpu.h between commit
fbf59bc9d74d1fb30b8e0630743aff2806eafcea ("percpu: implement new dynamic
percpu allocator") from the tip-core tree and commit
a1c9c21c85f5c0bda772419c758bd3f4248ce840 ("kmemleak: Remove some of the
kmemleak false positives") from the kmemleak tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/percpu.h
index 545b068,c3b95c0..0000000
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@@ -132,18 -69,25 +132,23 @@@ struct percpu_data 
  	void *ptrs[1];
  };
  
+ /* pointer disguising messes up the kmemleak objects tracking */
+ #ifndef CONFIG_DEBUG_KMEMLEAK
  #define __percpu_disguise(pdata) (struct percpu_data *)~(unsigned long)(pdata)
+ #else
+ #define __percpu_disguise(pdata) (struct percpu_data *)(pdata)
+ #endif
 -/* 
 - * Use this to get to a cpu's version of the per-cpu object dynamically
 - * allocated. Non-atomic access to the current CPU's version should
 - * probably be combined with get_cpu()/put_cpu().
 - */ 
 -#define percpu_ptr(ptr, cpu)                              \
 -({                                                        \
 -        struct percpu_data *__p = __percpu_disguise(ptr); \
 -        (__typeof__(ptr))__p->ptrs[(cpu)];	          \
 +
 +#define per_cpu_ptr(ptr, cpu)						\
 +({									\
 +        struct percpu_data *__p = __percpu_disguise(ptr);		\
 +        (__typeof__(ptr))__p->ptrs[(cpu)];				\
  })
  
 -extern void *__percpu_alloc_mask(size_t size, gfp_t gfp, cpumask_t *mask);
 -extern void percpu_free(void *__pdata);
 +#endif /* CONFIG_HAVE_DYNAMIC_PER_CPU_AREA */
 +
 +extern void *__alloc_percpu(size_t size, size_t align);
 +extern void free_percpu(void *__pdata);
  
  #else /* CONFIG_SMP */
  
