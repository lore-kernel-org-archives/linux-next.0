From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with the x86 tree
Date: Fri, 23 Jan 2009 11:54:50 +1100
Message-ID: <20090123115450.49885458.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42086 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753422AbZAWAyy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 22 Jan 2009 19:54:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Leonardo Potenza <lpotenza@inwind.it>, Tejun Heo <tj@kernel.org>

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
arch/x86/kernel/setup_percpu.c between commit
c7f8562a51c2e5dcc1a00a2bdd232b9965ff960d ("x86: fix section mismatch
warnings in kernel/setup_percpu.c") from the x86 tree and commit
1a51e3a0aed18767cf2762e95456ecfeb0bca5e6 ("x86: fold pda into percpu area
on SMP") from the tip-core tree.

The latter just moves code that the former modifies.  I fixed it up (see
below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/setup_percpu.c
index e4c32e1,90b8e15..0000000
--- a/arch/x86/kernel/setup_percpu.c
+++ b/arch/x86/kernel/setup_percpu.c
@@@ -51,7 -77,26 +77,26 @@@ static void __init setup_node_to_cpumas
  static inline void setup_node_to_cpumask_map(void) { }
  #endif
  
- #if defined(CONFIG_HAVE_SETUP_PER_CPU_AREA) && defined(CONFIG_X86_SMP)
+ #ifdef CONFIG_X86_64
+ 
+ /* correctly size the local cpu masks */
 -static void setup_cpu_local_masks(void)
++static void __init setup_cpu_local_masks(void)
+ {
+ 	alloc_bootmem_cpumask_var(&cpu_initialized_mask);
+ 	alloc_bootmem_cpumask_var(&cpu_callin_mask);
+ 	alloc_bootmem_cpumask_var(&cpu_callout_mask);
+ 	alloc_bootmem_cpumask_var(&cpu_sibling_setup_mask);
+ }
+ 
+ #else /* CONFIG_X86_32 */
+ 
+ static inline void setup_cpu_local_masks(void)
+ {
+ }
+ 
+ #endif /* CONFIG_X86_32 */
+ 
+ #ifdef CONFIG_HAVE_SETUP_PER_CPU_AREA
  /*
   * Copy data used in early init routines from the initial arrays to the
   * per cpu data areas.  These arrays then become expendable and the
