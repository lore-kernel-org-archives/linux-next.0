From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree with the ftrace tree
Date: Tue, 20 Jan 2009 14:57:59 +1100
Message-ID: <20090120145759.e707b9de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48902 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753364AbZATD6J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 22:58:09 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?IkFtw6lyaWNvIFdhbmci?= <xiyou.wangcong@gmail.com>, Matt Mackall <mpm@selenic.com>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi all,

Today's linux-next merge of the slab tree got a conflict in mm/slob.c
between commit 3eae2cb24a96509e0a38cc48dc1538a2826f4e33 ("kmemtrace: SLOB
hooks") from the ftrace tree and commit
6e9ed0cc4b963fde66ab47d9fb19147631e44555 ("slob: clean up the code") from
the slab tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slob.c
index 4d1c0fc,c9cd31d..0000000
--- a/mm/slob.c
+++ b/mm/slob.c
@@@ -475,15 -482,11 +485,15 @@@ void *__kmalloc_node(size_t size, gfp_
  		if (!m)
  			return NULL;
  		*m = size;
 -		return (void *)m + align;
 +		ret = (void *)m + align;
 +
 +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_KMALLOC,
 +					  _RET_IP_, ret,
 +					  size, size + align, gfp, node);
  	} else {
 -		void *ret;
 +		unsigned int order = get_order(size);
  
- 		ret = slob_new_page(gfp | __GFP_COMP, order, node);
 -		ret = slob_new_pages(gfp | __GFP_COMP, get_order(size), node);
++		ret = slob_new_pages(gfp | __GFP_COMP, order, node);
  		if (ret) {
  			struct page *page;
  			page = virt_to_page(ret);
@@@ -583,19 -579,10 +593,19 @@@ void *kmem_cache_alloc_node(struct kmem
  {
  	void *b;
  
 -	if (c->size < PAGE_SIZE)
 +	if (c->size < PAGE_SIZE) {
  		b = slob_alloc(c->size, flags, c->align, node);
 -	else
 +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_CACHE,
 +					  _RET_IP_, b, c->size,
 +					  SLOB_UNITS(c->size) * SLOB_UNIT,
 +					  flags, node);
 +	} else {
- 		b = slob_new_page(flags, get_order(c->size), node);
+ 		b = slob_new_pages(flags, get_order(c->size), node);
 +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_CACHE,
 +					  _RET_IP_, b, c->size,
 +					  PAGE_SIZE << get_order(c->size),
 +					  flags, node);
 +	}
  
  	if (c->ctor)
  		c->ctor(b);
