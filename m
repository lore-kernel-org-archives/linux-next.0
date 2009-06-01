From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree with the kmemleak
 tree
Date: Mon, 1 Jun 2009 17:55:38 +1000
Message-ID: <20090601175538.947ebc96.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43748 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752307AbZFAILF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Jun 2009 04:11:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
include/linux/slab.h between commit
5b1173b0ea49874431e1d5f07c57a373a26f75f1 ("kmemleak: Add the slab memory
allocation/freeing hooks") from the kmemleak tree and commit e6df1035b1b488cafde1e69f1a25f2706c3ac1f7 ("kmemcheck: add mm functions") from
the kmemcheck tree.

Overlapping additions.  One of you is going to have to choose a different
value for your defines.  I fixed it up by making the kmemcheck one bigger
(see below) and can carry the for as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/slab.h
index 76f21a6,1b969fa..0000000
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@@ -62,8 -62,13 +62,15 @@@
  # define SLAB_DEBUG_OBJECTS	0x00000000UL
  #endif
  
 +#define SLAB_NOLEAKTRACE	0x00800000UL	/* Avoid kmemleak tracing */
 +
+ /* Don't track use of uninitialized memory */
+ #ifdef CONFIG_KMEMCHECK
 -# define SLAB_NOTRACK		0x00800000UL
++# define SLAB_NOTRACK		0x01000000UL
+ #else
+ # define SLAB_NOTRACK		0x00000000UL
+ #endif
+ 
  /* The following flags affect the page allocator grouping pages by mobility */
  #define SLAB_RECLAIM_ACCOUNT	0x00020000UL		/* Objects are reclaimable */
  #define SLAB_TEMPORARY		SLAB_RECLAIM_ACCOUNT	/* Objects are short-lived */
