From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Tue, 22 Aug 2017 16:57:19 +1000
Message-ID: <20170822165719.112d9186@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48581 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754565AbdHVG5V (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Aug 2017 02:57:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  init/main.c

between commit:

  caba4cbbd27d ("debugobjects: Make kmemleak ignore debug objects")

from the tip tree and commit:

  50a7dc046b58 ("mm, page_ext: move page_ext_init() after page_alloc_init_late()")

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

diff --cc init/main.c
index aea41cf8f9a3,c401e5a38af3..000000000000
--- a/init/main.c
+++ b/init/main.c
@@@ -658,9 -651,8 +659,8 @@@ asmlinkage __visible void __init start_
  		initrd_start = 0;
  	}
  #endif
- 	page_ext_init();
 -	debug_objects_mem_init();
  	kmemleak_init();
 +	debug_objects_mem_init();
  	setup_per_cpu_pageset();
  	numa_policy_init();
  	if (late_time_init)
