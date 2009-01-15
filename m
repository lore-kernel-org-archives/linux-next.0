From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 16:27:17 +1100
Message-ID: <20090115162717.de2b3a3c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41341 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753430AbZAOF1W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 00:27:22 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Pekka Enberg <penberg@cs.helsinki.fi>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in mm/slob.c
between commit 3eae2cb24a96509e0a38cc48dc1538a2826f4e33 ("kmemtrace: SLOB
hooks") from the ftrace tree and commit
19f8f253a808d317d34ccbbad3b15a1a8d2ac444 ("kmemleak: Add the slob memory
allocation/freeing hooks") from the kmemleak tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc mm/slob.c
index 4d1c0fc,30b870f..0000000
--- a/mm/slob.c
+++ b/mm/slob.c
@@@ -489,12 -482,9 +490,13 @@@ void *__kmalloc_node(size_t size, gfp_
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
