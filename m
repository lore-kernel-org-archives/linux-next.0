From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 16:27:11 +1100
Message-ID: <20090115162711.f23f1080.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41335 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753820AbZAOF1O (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 00:27:14 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
include/linux/slab.h between commit
e6df1035b1b488cafde1e69f1a25f2706c3ac1f7 ("kmemcheck: add mm functions")
from the kmemcheck tree and commit
26e73e5a681dc8268bd3fbcb3c26f4ac9fdc8433 ("kmemleak: Add the slab memory
allocation/freeing hooks") from the kmemleak tree.

Overlapping additions.  I fixed it up (see below) and can carry the fix
as necessary.  On the assumption that these definitions should use unique
bits, I used the next bit for SLAB_NOLEAKTRACE.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/slab.h
index 2421246,05754ec..0000000
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@@ -62,13 -62,8 +62,15 @@@
  # define SLAB_DEBUG_OBJECTS	0x00000000UL
  #endif
  
 -#define SLAB_NOLEAKTRACE	0x00800000UL	/* Avoid kmemleak tracing */
 +/* Don't track use of uninitialized memory */
 +#ifdef CONFIG_KMEMCHECK
 +# define SLAB_NOTRACK		0x00800000UL
 +#else
 +# define SLAB_NOTRACK		0x00000000UL
 +#endif
 +
++#define SLAB_NOLEAKTRACE	0x01000000UL	/* Avoid kmemleak tracing */
+ 
  /* The following flags affect the page allocator grouping pages by mobility */
  #define SLAB_RECLAIM_ACCOUNT	0x00020000UL		/* Objects are reclaimable */
  #define SLAB_TEMPORARY		SLAB_RECLAIM_ACCOUNT	/* Objects are short-lived */
