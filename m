From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the ftrace and
 slab trees
Date: Tue, 20 Jan 2009 16:59:33 +1100
Message-ID: <20090120165933.78c864b9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38946 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751841AbZATF7n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jan 2009 00:59:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, =?UTF-8?B?IkFtw6lyaWNvIFdhbmci?= <xiyou.wangcong@gmail.com>, Matt Mackall <mpm@selenic.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in mm/slob.c
between commits 3eae2cb24a96509e0a38cc48dc1538a2826f4e33 ("kmemtrace: SLOB
hooks") from the ftrace tree and 6e9ed0cc4b963fde66ab47d9fb19147631e44555
("slob: clean up the code") from the slab tree and commit
1d5ae58738519c5228a022f22d560f27f99b8d4b ("kmemleak: Add the slob memory
allocation/freeing hooks") from the kmemleak tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slob.c
index f6b0d07,30b870f..0000000
--- a/mm/slob.c
+++ b/mm/slob.c
@@@ -499,12 -482,9 +500,13 @@@ void *__kmalloc_node(size_t size, gfp_
  			page = virt_to_page(ret);
  			page->private = size;
  		}
 +
 +		kmemtrace_mark_alloc_node(KMEMTRACE_TYPE_KMALLOC,
 +					  _RET_IP_, ret,
 +					  size, PAGE_SIZE << order, gfp, node);
  	}
  
+ 	kmemleak_alloc(ret, size, 1, gfp);
  	return ret;
  }
  EXPORT_SYMBOL(__kmalloc_node);
@@@ -515,9 -495,10 +517,10 @@@ void kfree(const void *block
  
  	if (unlikely(ZERO_OR_NULL_PTR(block)))
  		return;
+ 	kmemleak_free(block);
  
 -	sp = (struct slob_page *)virt_to_page(block);
 -	if (slob_page(sp)) {
 +	sp = slob_page(block);
 +	if (is_slob_page(sp)) {
  		int align = max(ARCH_KMALLOC_MINALIGN, ARCH_SLAB_MINALIGN);
  		unsigned int *m = (unsigned int *)(block - align);
  		slob_free(m, *m + align);
