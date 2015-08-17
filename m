From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with Linus' tree
Date: Mon, 17 Aug 2015 15:57:50 +1000
Message-ID: <20150817155750.007437e7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35764 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750710AbbHQF5x (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 01:57:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Denys Vlasenko <dvlasenk@redhat.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/entry/entry_64_compat.S

between commit:

  cd88ec231701 ("x86: fix error handling for 32-bit compat out-of-range system call numbers")

from Linus' tree and commit:

  c73e36b775a7 ("x86/asm/entry/32: Replace RESTORE_RSI_RDI with open-coded 32-bit reads")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/entry/entry_64_compat.S
index a7e257d9cb90,8997383ba170..000000000000
--- a/arch/x86/entry/entry_64_compat.S
+++ b/arch/x86/entry/entry_64_compat.S
@@@ -140,8 -140,8 +140,9 @@@ sysexit_from_sys_call
  	 */
  	andl	$~TS_COMPAT, ASM_THREAD_INFO(TI_status, %rsp, SIZEOF_PTREGS)
  	movl	RIP(%rsp), %ecx		/* User %eip */
 +	movq    RAX(%rsp), %rax
- 	RESTORE_RSI_RDI
+ 	movl	RSI(%rsp), %esi
+ 	movl	RDI(%rsp), %edi
  	xorl	%edx, %edx		/* Do not leak kernel information */
  	xorq	%r8, %r8
  	xorq	%r9, %r9
@@@ -365,10 -366,11 +366,12 @@@ cstar_dispatch
  
  sysretl_from_sys_call:
  	andl	$~TS_COMPAT, ASM_THREAD_INFO(TI_status, %rsp, SIZEOF_PTREGS)
- 	RESTORE_RSI_RDI_RDX
+ 	movl	RDX(%rsp), %edx
+ 	movl	RSI(%rsp), %esi
+ 	movl	RDI(%rsp), %edi
  	movl	RIP(%rsp), %ecx
  	movl	EFLAGS(%rsp), %r11d
 +	movq    RAX(%rsp), %rax
  	xorq	%r10, %r10
  	xorq	%r9, %r9
  	xorq	%r8, %r8
