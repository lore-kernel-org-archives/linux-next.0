From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree with the ftrace tree
Date: Fri, 20 Feb 2009 16:57:28 +1100
Message-ID: <20090220165728.7f2cec61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60259 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751504AbZBTF5f (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Feb 2009 00:57:35 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Pekka Enberg <penberg@cs.helsinki.fi>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi all,

Today's linux-next merge of the slab tree got a conflict in mm/slub.c
between commit 5b882be4e00e53a44f47ad7eb997cac2938848bf ("kmemtrace: SLUB
hooks") from the ftrace tree and commit
8573e12414365585bfd601dc8c093b3efbef8854 ("SLUB: Do not pass 8k objects
through to the page allocator") from the slab tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slub.c
index e6bf32f,23115bd..0000000
--- a/mm/slub.c
+++ b/mm/slub.c
@@@ -2689,9 -2661,8 +2693,9 @@@ static struct kmem_cache *get_slab(size
  void *__kmalloc(size_t size, gfp_t flags)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
+ 	if (unlikely(size > SLUB_MAX_SIZE))
  		return kmalloc_large(size, flags);
  
  	s = get_slab(size, flags);
@@@ -2723,18 -2689,9 +2727,19 @@@ static void *kmalloc_large_node(size_t 
  void *__kmalloc_node(size_t size, gfp_t flags, int node)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
 -	if (unlikely(size > SLUB_MAX_SIZE))
 -		return kmalloc_large_node(size, flags, node);
++	if (unlikely(size > SLUB_MAX_SIZE)) {
 +	if (unlikely(size > PAGE_SIZE)) {
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
  
@@@ -3276,9 -3225,8 +3281,9 @@@ static struct notifier_block __cpuinitd
  void *__kmalloc_track_caller(size_t size, gfp_t gfpflags, unsigned long caller)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
+ 	if (unlikely(size > SLUB_MAX_SIZE))
  		return kmalloc_large(size, gfpflags);
  
  	s = get_slab(size, gfpflags);
@@@ -3299,9 -3241,8 +3304,9 @@@ void *__kmalloc_node_track_caller(size_
  					int node, unsigned long caller)
  {
  	struct kmem_cache *s;
 +	void *ret;
  
- 	if (unlikely(size > PAGE_SIZE))
+ 	if (unlikely(size > SLUB_MAX_SIZE))
  		return kmalloc_large_node(size, gfpflags, node);
  
  	s = get_slab(size, gfpflags);
