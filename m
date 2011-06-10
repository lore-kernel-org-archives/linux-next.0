From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-lpae tree with the arm tree
Date: Fri, 10 Jun 2011 10:52:55 +1000
Message-ID: <20110610105255.3105eef2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47447 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756060Ab1FJAxC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jun 2011 20:53:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Catalin,

Today's linux-next merge of the arm-lpae tree got a conflict in
arch/arm/mm/context.c between commit 07989b7ad63a ("Revert "ARM: 6943/1:
mm: use TTBR1 instead of reserved context ID"") from the arm tree and
commit 21fa7e3ea279 ("ARM: LPAE: Add context switching support") from the
arm-lpae tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/arm/mm/context.c
index b0ee9ba,2dff1cf..0000000
--- a/arch/arm/mm/context.c
+++ b/arch/arm/mm/context.c
@@@ -22,11 -22,37 +22,34 @@@ unsigned int cpu_last_asid = ASID_FIRST
  DEFINE_PER_CPU(struct mm_struct *, current_mm);
  #endif
  
+ #ifdef CONFIG_ARM_LPAE
+ static void cpu_set_reserved_ttbr0(void)
+ {
+ 	unsigned long ttbl = __pa(swapper_pg_dir);
+ 	unsigned long ttbh = 0;
+ 
+ 	/*
+ 	 * Set TTBR0 to swapper_pg_dir. Note that swapper_pg_dir only contains
+ 	 * global entries so the ASID value is not relevant.
+ 	 */
+ 	asm(
+ 	"	mcrr	p15, 0, %0, %1, c2		@ set TTBR0\n"
+ 	:
+ 	: "r" (ttbl), "r" (ttbh));
+ }
+ #else
+ static void cpu_set_reserved_ttbr0(void)
+ {
 -	u32 ttb;
 -
 -	/* Copy TTBR1 into TTBR0 */
 -	asm volatile(
 -	"	mrc	p15, 0, %0, c2, c0, 1		@ read TTBR1\n"
 -	"	mcr	p15, 0, %0, c2, c0, 0		@ set TTBR0\n"
 -	: "=r" (ttb));
++	/* set the reserved ASID before flushing the TLB */
++	asm("mcr	p15, 0, %0, c13, c0, 1\n" : : "r" (0));
+ }
+ #endif
+ 
  /*
   * We fork()ed a process, and we need a new context for the child
 - * to run in.
 + * to run in.  We reserve version 0 for initial tasks so we will
 + * always allocate an ASID. The ASID 0 is reserved for the TTBR
 + * register changing sequence.
   */
  void __init_new_context(struct task_struct *tsk, struct mm_struct *mm)
  {
