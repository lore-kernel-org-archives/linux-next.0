From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tile
 tree
Date: Fri, 29 Apr 2016 16:08:15 +1000
Message-ID: <20160429160815.2ab2ec87@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49943 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752656AbcD2GIR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 29 Apr 2016 02:08:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Metcalf <cmetcalf@ezchip.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/tile/Kconfig

between commit:

  4ef00aa30a3f ("tile: sort the "select" lines in the TILE/TILEGX configs")

from the tile tree and commits:

  628b7a1e7049 ("exit_thread: remove empty bodies")
  803ae84888bb ("printk/nmi: generic solution for safe printk in NMI")

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

diff --cc arch/tile/Kconfig
index c3bbb295bc4a,76989b878f3c..000000000000
--- a/arch/tile/Kconfig
+++ b/arch/tile/Kconfig
@@@ -18,21 -35,17 +18,23 @@@ config TIL
  	select GENERIC_STRNCPY_FROM_USER
  	select GENERIC_STRNLEN_USER
  	select HAVE_ARCH_SECCOMP_FILTER
 -
 -# FIXME: investigate whether we need/want these options.
 -#	select HAVE_IOREMAP_PROT
 -#	select HAVE_OPTPROBES
 -#	select HAVE_REGS_AND_STACK_ACCESS_API
 -#	select HAVE_HW_BREAKPOINT
 -#	select PERF_EVENTS
 -#	select HAVE_USER_RETURN_NOTIFIER
 -#	config NO_BOOTMEM
 -#	config ARCH_SUPPORTS_DEBUG_PAGEALLOC
 -#	config HUGETLB_PAGE_SIZE_VARIABLE
 +	select HAVE_ARCH_TRACEHOOK
 +	select HAVE_CONTEXT_TRACKING
 +	select HAVE_DEBUG_BUGVERBOSE
 +	select HAVE_DEBUG_KMEMLEAK
 +	select HAVE_DEBUG_STACKOVERFLOW
 +	select HAVE_DMA_API_DEBUG
++	select HAVE_EXIT_THREAD
 +	select HAVE_KVM if !TILEGX
++	select HAVE_NMI if USE_PMC
 +	select HAVE_PERF_EVENTS
 +	select HAVE_SYSCALL_TRACEPOINTS
 +	select MODULES_USE_ELF_RELA
 +	select SYSCTL_EXCEPTION_TRACE
 +	select SYS_HYPERVISOR
 +	select USER_STACKTRACE_SUPPORT
 +	select USE_PMC if PERF_EVENTS
 +	select VIRT_TO_BUS
  
  config MMU
  	def_bool y
