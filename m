From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree with the ftace tree
Date: Mon, 26 Jan 2009 15:31:31 +1100
Message-ID: <20090126153131.8a6dcf9a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42819 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751270AbZAZEbl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 25 Jan 2009 23:31:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi all,

Today's linux-next merge of the slab tree got conflicts in
include/linux/slub_def.h and mm/slub.c between commit
5b882be4e00e53a44f47ad7eb997cac2938848bf ("kmemtrace: SLUB hooks") from
the ftrace tree and commit 97a4871761e735b6f1acd3bc7c3bac30dae3eab9
("SLUB: revert direct page allocator pass through") from the slab tree.

I fixed them up (see below, worth a check) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/slub_def.h
index 6b657f7,3bd3662..0000000
--- a/include/linux/slub_def.h
+++ b/include/linux/slub_def.h
@@@ -205,35 -220,9 +221,21 @@@ static __always_inline struct kmem_cach
  void *kmem_cache_alloc(struct kmem_cache *, gfp_t);
  void *__kmalloc(size_t size, gfp_t flags);
  
 +#ifdef CONFIG_KMEMTRACE
 +extern void *kmem_cache_alloc_notrace(struct kmem_cache *s, gfp_t gfpflags);
 +#else
 +static __always_inline void *
 +kmem_cache_alloc_notrace(struct kmem_cache *s, gfp_t gfpflags)
 +{
 +	return kmem_cache_alloc(s, gfpflags);
 +}
 +#endif
 +
- static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
- {
- 	unsigned int order = get_order(size);
- 	void *ret = (void *) __get_free_pages(flags | __GFP_COMP, order);
- 
- 	kmemtrace_mark_alloc(KMEMTRACE_TYPE_KMALLOC, _THIS_IP_, ret,
- 			     size, PAGE_SIZE << order, flags);
- 
- 	return ret;
- }
- 
  static __always_inline void *kmalloc(size_t size, gfp_t flags)
  {
 +	void *ret;
 +
  	if (__builtin_constant_p(size)) {
- 		if (size > PAGE_SIZE)
- 			return kmalloc_large(size, flags);
- 
  		if (!(flags & SLUB_DMA)) {
  			struct kmem_cache *s = kmalloc_slab(size);
  
diff --cc mm/slub.c
index f657c88,d973555..0000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -2688,11 -2661,7 +2692,8 @@@ static struct kmem_cache *get_slab(size
  void *__kmalloc(size_t size, gfp_t flags)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
- 		return kmalloc_large(size, flags);
- 
  	s = get_slab(size, flags);
  
  	if (unlikely(ZERO_OR_NULL_PTR(s)))
@@@ -2722,19 -2675,7 +2712,8 @@@ EXPORT_SYMBOL(__kmalloc)
  void *__kmalloc_node(size_t size, gfp_t flags, int node)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE)) {
- 		ret = kmalloc_large_node(size, flags, node);
- 
- 		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_KMALLOC,
- 					  _RET_IP_, ret,
- 					  size, PAGE_SIZE << get_order(size),
- 					  flags, node);
- 
- 		return ret;
- 	}
- 
  	s = get_slab(size, flags);
  
  	if (unlikely(ZERO_OR_NULL_PTR(s)))
@@@ -2797,14 -2733,9 +2776,11 @@@ void kfree(const void *x
  		return;
  
  	page = virt_to_head_page(x);
- 	if (unlikely(!PageSlab(page))) {
- 		BUG_ON(!PageCompound(page));
- 		put_page(page);
+ 	if (unlikely(WARN_ON(!PageSlab(page)))) /* XXX */
  		return;
- 	}
  	slab_free(page->slab, page, object, _RET_IP_);
 +
 +	kmemtrace_mark_free(KMEMTRACE_TYPE_KMALLOC, _RET_IP_, x);
  }
  EXPORT_SYMBOL(kfree);
  
@@@ -3274,11 -3205,7 +3250,8 @@@ static struct notifier_block __cpuinitd
  void *__kmalloc_track_caller(size_t size, gfp_t gfpflags, unsigned long caller)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
- 		return kmalloc_large(size, gfpflags);
- 
  	s = get_slab(size, gfpflags);
  
  	if (unlikely(ZERO_OR_NULL_PTR(s)))
@@@ -3297,11 -3218,7 +3270,8 @@@ void *__kmalloc_node_track_caller(size_
  					int node, unsigned long caller)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
- 		return kmalloc_large_node(size, gfpflags, node);
- 
  	s = get_slab(size, gfpflags);
  
  	if (unlikely(ZERO_OR_NULL_PTR(s)))
