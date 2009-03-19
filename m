From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpus4096 tree with the x86 tree
Date: Thu, 19 Mar 2009 12:17:06 +1100
Message-ID: <20090319121706.008c1f06.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37526 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751383AbZCSBRM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Mar 2009 21:17:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Jan Beulich <jbeulich@novell.com>, Jaswinder Singh Rajput <jaswinder@kernel.org>

Hi all,

Today's linux-next merge of the cpus4096 tree got a conflict in
arch/x86/kernel/cpu/common.c between commits
9766cdbcb260389669e9679b2aa87c11832f479f ("x86: cpu/common.c cleanups")
and 02dde8b45c5460794b9052d7c12939fe3eb63c2c ("x86: move various CPU
initialization objects into .cpuinit.rodata") from the x86 tree and
commit 3f76a183de8ad3aeb7425f3d9685bb6003abd1a5 ("x86: unify
cpu_callin_mask/cpu_callout_mask/cpu_initialized_mask/cpu_sibling_setup_mask")
from the cpus4096 tree.

I fixed it up (see below - which looks like how tip/master fixed it) and
can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/common.c
index e2962cc,d7dd3c2..0000000
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@@ -39,14 -29,22 +39,12 @@@
  #include <asm/uv/uv.h>
  #endif
  
 -#include <asm/pgtable.h>
 -#include <asm/processor.h>
 -#include <asm/desc.h>
 -#include <asm/atomic.h>
 -#include <asm/proto.h>
 -#include <asm/sections.h>
 -#include <asm/setup.h>
 -#include <asm/hypervisor.h>
 -#include <asm/stackprotector.h>
 -
  #include "cpu.h"
  
- #ifdef CONFIG_X86_64
- 
  /* all of these masks are initialized in setup_cpu_local_masks() */
 -cpumask_var_t cpu_callin_mask;
 -cpumask_var_t cpu_callout_mask;
  cpumask_var_t cpu_initialized_mask;
 +cpumask_var_t cpu_callout_mask;
 +cpumask_var_t cpu_callin_mask;
  
  /* representing cpus for which sibling maps can be computed */
  cpumask_var_t cpu_sibling_setup_mask;
@@@ -60,17 -58,7 +58,7 @@@ void __init setup_cpu_local_masks(void
  	alloc_bootmem_cpumask_var(&cpu_sibling_setup_mask);
  }
  
- #else /* CONFIG_X86_32 */
- 
- cpumask_t cpu_sibling_setup_map;
- cpumask_t cpu_callout_map;
- cpumask_t cpu_initialized;
- cpumask_t cpu_callin_map;
- 
- #endif /* CONFIG_X86_32 */
- 
- 
 -static struct cpu_dev *this_cpu __cpuinitdata;
 +static const struct cpu_dev *this_cpu __cpuinitdata;
  
  DEFINE_PER_CPU_PAGE_ALIGNED(struct gdt_page, gdt_page) = { .gdt = {
  #ifdef CONFIG_X86_64
