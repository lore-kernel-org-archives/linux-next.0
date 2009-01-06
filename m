From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Tue, 6 Jan 2009 14:11:41 +1100
Message-ID: <20090106141141.d102cc2f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55484 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750980AbZAFDLx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 5 Jan 2009 22:11:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Eduard - Gabriel Munteanu <eduard.munteanu@linux360.ro>, Pekka Enberg <penberg@cs.helsinki.fi>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in init/main.c
between commit b9ce08c01020eb28bfbfa6faf1c740281c5f418e ("kmemtrace: Core
implementation") from the ftrace tree and commit
4289941b45ac95092f80c23d08ee88ccbd7635a3
("cpualloc:expose-module-percpu-allocator") from the rr tree.

Juts trivial overlapping additions.  I fixed it up (see below) and can
carry the fix as necessary.  I wasn't actually sure if the order
matters ...
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc init/main.c
index 240e1ef,8a2d82c..0000000
--- a/init/main.c
+++ b/init/main.c
@@@ -650,7 -650,7 +658,8 @@@ asmlinkage void __init start_kernel(voi
  	enable_debug_pagealloc();
  	cpu_hotplug_init();
  	kmem_cache_init();
+ 	percpu_alloc_init();
 +	kmemtrace_init();
  	debug_objects_mem_init();
  	idr_init_cache();
  	setup_per_cpu_pageset();
