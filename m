From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kmemleak tree with the slab tree
Date: Mon, 2 Feb 2009 18:53:57 +1100
Message-ID: <20090202185357.fcef7681.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37713 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751198AbZBBHyE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 02:54:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

Hi Catalin,

Today's linux-next merge of the kmemleak tree got a conflict in
lib/Kconfig.debug between commit 32efb35b328d0e87fa5358239c54c889226cc6e7
("SLQB slab allocator (try 2)") from the slab tree and commits
de190b3e003e07f501a3e6fc67a997b66c144bcb ("kmemleak: Enable the building
of the memory leak detector") and
6b9fe2865daff5d4e6d272addc03768b4ffcec36 ("kmemleak: Simple testing
module for kmemleak") from the kmemleak tree.

Just overlapping additions. I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc lib/Kconfig.debug
index da4d89a,612ed9c..0000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -336,26 -298,39 +336,59 @@@ config SLUB_STAT
  	  out which slabs are relevant to a particular load.
  	  Try running: slabinfo -DA
  
 +config SLQB_DEBUG
 +	default y
 +	bool "Enable SLQB debugging support"
 +	depends on SLQB
 +
 +config SLQB_DEBUG_ON
 +	default n
 +	bool "SLQB debugging on by default"
 +	depends on SLQB_DEBUG
 +
 +config SLQB_SYSFS
 +	bool "Create SYSFS entries for slab caches"
 +	default n
 +	depends on SLQB
 +
 +config SLQB_STATS
 +	bool "Enable SLQB performance statistics"
 +	default n
 +	depends on SLQB_SYSFS
 +
+ config DEBUG_KMEMLEAK
+ 	bool "Kernel memory leak detector"
+ 	default n
+ 	depends on EXPERIMENTAL && (X86 || ARM)
+ 	select DEBUG_SLAB if SLAB
+ 	select SLUB_DEBUG if SLUB
+ 	select DEBUG_FS if SYSFS
+ 	select STACKTRACE if STACKTRACE_SUPPORT
+ 	select KALLSYMS
+ 	help
+ 	  Say Y here if you want to enable the memory leak
+ 	  detector. The memory allocation/freeing is traced in a way
+ 	  similar to the Boehm's conservative garbage collector, the
+ 	  difference being that the orphan objects are not freed but
+ 	  only shown in /sys/kernel/debug/kmemleak. Enabling this
+ 	  feature will introduce an overhead to memory
+ 	  allocations. See Documentation/kmemleak.txt for more
+ 	  details.
+ 
+ 	  In order to access the kmemleak file, debugfs needs to be
+ 	  mounted (usually at /sys/kernel/debug).
+ 
+ config DEBUG_KMEMLEAK_TEST
+ 	tristate "Simple test for the kernel memory leak detector"
+ 	default n
+ 	depends on DEBUG_KMEMLEAK
+ 	help
+ 	  Say Y or M here to build a test for the kernel memory leak
+ 	  detector. This option enables a module that explicitly leaks
+ 	  memory.
+ 
+ 	  If unsure, say N.
+ 
  config DEBUG_PREEMPT
  	bool "Debug preemptible kernel"
  	depends on DEBUG_KERNEL && PREEMPT && (TRACE_IRQFLAGS_SUPPORT || PPC64)
