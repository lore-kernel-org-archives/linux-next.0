From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree
Date: Thu, 15 Jan 2009 16:27:02 +1100
Message-ID: <20090115162702.c395bcd2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41319 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750768AbZAOF1G (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 15 Jan 2009 00:27:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Pekka Enberg <penberg@cs.helsinki.fi>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
init/main.c between commit b9ce08c01020eb28bfbfa6faf1c740281c5f418e
("kmemtrace: Core implementation") from the ftrace tree and commit
faff141a1eb4e690c0c54ab8684f8b267bc116c5 ("kmemleak: Add the base
support") from the kmemleak tree.

Trivial overlapping additions.  I fixed it up (see below) and can carry
the fix as necessary.  The only doubt in my mind was the ordering of
these calls.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc init/main.c
index ff3d580,c7f81aa..0000000
--- a/init/main.c
+++ b/init/main.c
@@@ -650,7 -643,7 +652,8 @@@ asmlinkage void __init start_kernel(voi
  	enable_debug_pagealloc();
  	cpu_hotplug_init();
  	kmem_cache_init();
 +	kmemtrace_init();
+ 	kmemleak_init();
  	debug_objects_mem_init();
  	idr_init_cache();
  	setup_per_cpu_pageset();
