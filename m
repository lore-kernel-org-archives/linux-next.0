From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the slab tree with the ftrace tree
Date: Fri, 20 Feb 2009 12:16:51 +0100
Message-ID: <20090220111651.GJ28581@elte.hu>
References: <20090220165728.7f2cec61.sfr@canb.auug.org.au> <20090220195911.3bff30fb.sfr@canb.auug.org.au> <20090220093734.GI24555@elte.hu> <1235122897.29813.28.camel@penberg-laptop> <20090220095355.GL24555@elte.hu> <1235128361.29813.32.camel@penberg-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:33650 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753399AbZBTLRQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 06:17:16 -0500
Content-Disposition: inline
In-Reply-To: <1235128361.29813.32.camel@penberg-laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Pekka Enberg <penberg@cs.helsinki.fi> wrote:

> Hi Ingo,
> 
> On Fri, 2009-02-20 at 10:53 +0100, Ingo Molnar wrote:
> > > Is it a big problem, though? We could do the 
> > > s/PAGE_SIZE/SLUB_MAX_SIZE/g rename as a separate preparational 
> > > patch (without any of the functional changes) and see if Linus 
> > > merges it to mainline...
> > 
> > Linus does not have to merge the changes - it's enough if both 
> > you and me merge it, then there will be no conflicts if the two 
> > trees are combined - Git will sort it all out.
> > 
> > Could you prepare such a patch please, merge it into a separate 
> > (and append-only) branch your tree and then send me a pull 
> > request after a bit of testing so i can merge it into the 
> > tracing tree?
> 
> Aye, aye, cap'n:
> 
>   git pull git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2.6.git for-ingo
> 
> the commit is here in case someone wants to take a look at it:
> 
> http://git.kernel.org/?p=linux/kernel/git/penberg/slab-2.6.git;a=commitdiff;h=fe1200b63d158b28eef6d4de1e5b5f99c681ba2f

Pulled into tip:tracing/kmemtrace, thanks Pekka!

Below is the conflict resolution i did. Will push out a new 
tip:auto-ftrace-next tree once it got a bit of testing.

	Ingo

------------------->
commit 057685cf57066bc8aaed68de1b1970e12f0075d2
Merge: 64b36ca... fe1200b...
Author: Ingo Molnar <mingo@elte.hu>
Date:   Fri Feb 20 12:15:30 2009 +0100

    Merge branch 'for-ingo' of git://git.kernel.org/pub/scm/linux/kernel/git/penberg/slab-2.6 into tracing/kmemtrace
    
    Conflicts:
    	mm/slub.c

diff --cc include/linux/slub_def.h
index 6b657f7,986e09d..9e3a575
--- a/include/linux/slub_def.h
+++ b/include/linux/slub_def.h
@@@ -228,10 -224,8 +241,10 @@@ static __always_inline void *kmalloc_la
  
  static __always_inline void *kmalloc(size_t size, gfp_t flags)
  {
 +	void *ret;
 +
  	if (__builtin_constant_p(size)) {
- 		if (size > PAGE_SIZE)
+ 		if (size > SLUB_MAX_SIZE)
  			return kmalloc_large(size, flags);
  
  		if (!(flags & SLUB_DMA)) {
@@@ -256,26 -244,10 +269,26 @@@
  void *__kmalloc_node(size_t size, gfp_t flags, int node);
  void *kmem_cache_alloc_node(struct kmem_cache *, gfp_t flags, int node);
  
 +#ifdef CONFIG_KMEMTRACE
 +extern void *kmem_cache_alloc_node_notrace(struct kmem_cache *s,
 +					   gfp_t gfpflags,
 +					   int node);
 +#else
 +static __always_inline void *
 +kmem_cache_alloc_node_notrace(struct kmem_cache *s,
 +			      gfp_t gfpflags,
 +			      int node)
 +{
 +	return kmem_cache_alloc_node(s, gfpflags, node);
 +}
 +#endif
 +
  static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
  {
 +	void *ret;
 +
  	if (__builtin_constant_p(size) &&
- 		size <= PAGE_SIZE && !(flags & SLUB_DMA)) {
+ 		size <= SLUB_MAX_SIZE && !(flags & SLUB_DMA)) {
  			struct kmem_cache *s = kmalloc_slab(size);
  
  		if (!s)
diff --cc mm/slub.c
index 3525e7b,5a5e7f5..6de5e07
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -2688,9 -2657,8 +2688,9 @@@ static struct kmem_cache *get_slab(size
  void *__kmalloc(size_t size, gfp_t flags)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
+ 	if (unlikely(size > SLUB_MAX_SIZE))
  		return kmalloc_large(size, flags);
  
  	s = get_slab(size, flags);
@@@ -2722,18 -2685,9 +2722,18 @@@ static void *kmalloc_large_node(size_t 
  void *__kmalloc_node(size_t size, gfp_t flags, int node)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE)) {
 -	if (unlikely(size > SLUB_MAX_SIZE))
 -		return kmalloc_large_node(size, flags, node);
++	if (unlikely(size > SLUB_MAX_SIZE)) {
 +		ret = kmalloc_large_node(size, flags, node);
 +
 +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_KMALLOC,
 +					  _RET_IP_, ret,
 +					  size, PAGE_SIZE << get_order(size),
 +					  flags, node);
 +
 +		return ret;
 +	}
  
  	s = get_slab(size, flags);
  
@@@ -3275,9 -3221,8 +3275,9 @@@ static struct notifier_block __cpuinitd
  void *__kmalloc_track_caller(size_t size, gfp_t gfpflags, unsigned long caller)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
+ 	if (unlikely(size > SLUB_MAX_SIZE))
  		return kmalloc_large(size, gfpflags);
  
  	s = get_slab(size, gfpflags);
@@@ -3298,9 -3237,8 +3298,9 @@@ void *__kmalloc_node_track_caller(size_
  					int node, unsigned long caller)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
+ 	if (unlikely(size > SLUB_MAX_SIZE))
  		return kmalloc_large_node(size, gfpflags, node);
  
  	s = get_slab(size, gfpflags);
