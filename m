From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rseq tree with Linus' tree
Date: Wed, 15 Nov 2017 15:35:36 +1100
Message-ID: <20171115153536.7fab87b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53927 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754488AbdKOEfi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 23:35:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@suse.de>

Hi Mathieu,

[I may regret adding the rseq tree ...]

Today's linux-next merge of the rseq tree got a conflict in:

  arch/x86/entry/entry_64.S

between commits:

  9da78ba6b47b ("x86/entry/64: Remove the restore_c_regs_and_iret label")
  26c4ef9c49d8 ("x86/entry/64: Split the IRET-to-user and IRET-to-kernel paths")
  e53178328c9b ("x86/entry/64: Shrink paranoid_exit_restore and make labels local")

from Linus' tree and commit:

  60a77bfd24d5 ("membarrier: x86: Provide core serializing command (v2)")

from the rseq tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/entry/entry_64.S
index a2b30ec69497,4859f04e1695..000000000000
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@@ -617,21 -612,8 +617,25 @@@ GLOBAL(retint_user
  	mov	%rsp,%rdi
  	call	prepare_exit_to_usermode
  	TRACE_IRQS_IRETQ
 +
 +GLOBAL(swapgs_restore_regs_and_return_to_usermode)
 +#ifdef CONFIG_DEBUG_ENTRY
 +	/* Assert that pt_regs indicates user mode. */
 +	testb	$3, CS(%rsp)
 +	jnz	1f
 +	ud2
 +1:
 +#endif
  	SWAPGS
 -	jmp	restore_regs_and_iret
 +	POP_EXTRA_REGS
 +	POP_C_REGS
 +	addq	$8, %rsp	/* skip regs->orig_ax */
++	/*
++	 * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on iret core serialization
++	 * when returning from IPI handler.
++	 */
 +	INTERRUPT_RETURN
 +
  
  /* Returning to kernel space */
  retint_kernel:
@@@ -651,17 -633,19 +655,21 @@@
  	 */
  	TRACE_IRQS_IRETQ
  
 -/*
 - * At this label, code paths which return to kernel and to user,
 - * which come from interrupts/exception and from syscalls, merge.
 - */
 -GLOBAL(restore_regs_and_iret)
 -	RESTORE_EXTRA_REGS
 -restore_c_regs_and_iret:
 -	RESTORE_C_REGS
 -	REMOVE_PT_GPREGS_FROM_STACK 8
 +GLOBAL(restore_regs_and_return_to_kernel)
 +#ifdef CONFIG_DEBUG_ENTRY
 +	/* Assert that pt_regs indicates kernel mode. */
 +	testb	$3, CS(%rsp)
 +	jz	1f
 +	ud2
 +1:
 +#endif
 +	POP_EXTRA_REGS
 +	POP_C_REGS
 +	addq	$8, %rsp	/* skip regs->orig_ax */
+ 	/*
+ 	 * ARCH_HAS_MEMBARRIER_SYNC_CORE rely on iret core serialization
+ 	 * when returning from IPI handler.
+ 	 */
  	INTERRUPT_RETURN
  
  ENTRY(native_iret)
