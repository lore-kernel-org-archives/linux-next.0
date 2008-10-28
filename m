From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemcheck tree
Date: Tue, 28 Oct 2008 16:14:24 +1100
Message-ID: <20081028161424.ce67a349.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55363 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752213AbYJ1FOe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 01:14:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next merge of the kmemcheck tree got a conflict in
arch/x86/mm/Makefile between commit
fd3fdf11d3c649769e02459c5f1b8081a15e9007 ("trace: add the MMIO-tracer to
the tracer menu, cleanup") from the ftrace tree and commit
385e31b9eae0528bada07d16a189f3f40df23961 ("kmemcheck: add the kmemcheck
core") from the kmemcheck tree.

Just context changes.  I fixed it (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/mm/Makefile
index 0a21b7a,f4edb6e..0000000
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@@ -8,8 -8,11 +8,10 @@@ obj-$(CONFIG_X86_PTDUMP)	+= dump_pageta
  
  obj-$(CONFIG_HIGHMEM)		+= highmem_32.o
  
+ obj-$(CONFIG_KMEMCHECK)		+= kmemcheck/
+ 
 -obj-$(CONFIG_MMIOTRACE_HOOKS)	+= kmmio.o
  obj-$(CONFIG_MMIOTRACE)		+= mmiotrace.o
 -mmiotrace-y			:= pf_in.o mmio-mod.o
 +mmiotrace-y			:= kmmio.o pf_in.o mmio-mod.o
  obj-$(CONFIG_MMIOTRACE_TEST)	+= testmmiotrace.o
  
  obj-$(CONFIG_NUMA)		+= numa_$(BITS).o
