From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 17 Aug 2017 14:03:42 +1000
Message-ID: <20170817140342.1956d940@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41553 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750731AbdHQEDo (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Aug 2017 00:03:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/entry/entry_64.S

between commit:

  UNWIND_HINT_IRET_REGS ("x86/entry/64: Add unwind hint annotations")

from the tip tree and commit:

  ad5b8c4ba323 ("xen: get rid of paravirt op adjust_exception_frame")

from the xen-tip tree.

I fixed it up (see below - though I don't know if a further adjustment
is required) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/entry/entry_64.S
index ca0b250eefc4,67fefaf21312..000000000000
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@@ -978,15 -891,17 +977,15 @@@ bad_gs
  ENTRY(do_softirq_own_stack)
  	pushq	%rbp
  	mov	%rsp, %rbp
 -	incl	PER_CPU_VAR(irq_count)
 -	cmove	PER_CPU_VAR(irq_stack_ptr), %rsp
 -	push	%rbp				/* frame pointer backlink */
 +	ENTER_IRQ_STACK regs=0 old_rsp=%r11
  	call	__do_softirq
 +	LEAVE_IRQ_STACK regs=0
  	leaveq
 -	decl	PER_CPU_VAR(irq_count)
  	ret
 -END(do_softirq_own_stack)
 +ENDPROC(do_softirq_own_stack)
  
  #ifdef CONFIG_XEN
- idtentry xen_hypervisor_callback xen_do_hypervisor_callback has_error_code=0
+ idtentry hypervisor_callback xen_do_hypervisor_callback has_error_code=0
  
  /*
   * A note on the "critical region" in our callback handler.
@@@ -1053,9 -967,6 +1052,7 @@@ ENTRY(xen_failsafe_callback
  	movq	8(%rsp), %r11
  	addq	$0x30, %rsp
  	pushq	$0				/* RIP */
- 	pushq	%r11
- 	pushq	%rcx
 +	UNWIND_HINT_IRET_REGS offset=8
  	jmp	general_protection
  1:	/* Segment mismatch => Category 1 (Bad segment). Retry the IRET. */
  	movq	(%rsp), %rcx
@@@ -1251,20 -1156,8 +1247,9 @@@ ENTRY(error_exit
  END(error_exit)
  
  /* Runs on exception stack */
+ /* XXX: broken on Xen PV */
  ENTRY(nmi)
 +	UNWIND_HINT_IRET_REGS
- 	/*
- 	 * Fix up the exception frame if we're on Xen.
- 	 * PARAVIRT_ADJUST_EXCEPTION_FRAME is guaranteed to push at most
- 	 * one value to the stack on native, so it may clobber the rdx
- 	 * scratch slot, but it won't clobber any of the important
- 	 * slots past it.
- 	 *
- 	 * Xen is a different story, because the Xen frame itself overlaps
- 	 * the "NMI executing" variable.
- 	 */
- 	PARAVIRT_ADJUST_EXCEPTION_FRAME
- 
  	/*
  	 * We allow breakpoints in NMIs. If a breakpoint occurs, then
  	 * the iretq it performs will take us out of NMI context.
