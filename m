From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with the security tree
Date: Tue, 28 Jun 2016 13:24:34 +1000
Message-ID: <20160628132434.51299416@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59318 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751740AbcF1DYh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jun 2016 23:24:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>

Hi Paul,

Today's linux-next merge of the audit tree got conflicts in:

  arch/s390/kernel/ptrace.c

between commit:

  0208b9445bc0 ("s390/ptrace: run seccomp after ptrace")

from the security tree and commit:

  da7f750c1ef5 ("s390: ensure that syscall arguments are properly masked on s390")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/s390/kernel/ptrace.c
index cea17010448f,defc0dca4510..000000000000
--- a/arch/s390/kernel/ptrace.c
+++ b/arch/s390/kernel/ptrace.c
@@@ -821,6 -821,16 +821,8 @@@ long compat_arch_ptrace(struct task_str
  
  asmlinkage long do_syscall_trace_enter(struct pt_regs *regs)
  {
 -	long ret = 0;
+ 	unsigned long mask = -1UL;
+ 
 -	/* Do the secure computing check first. */
 -	if (secure_computing()) {
 -		/* seccomp failures shouldn't expose any additional code. */
 -		ret = -1;
 -		goto out;
 -	}
 -
  	/*
  	 * The sysc_tracesys code in entry.S stored the system
  	 * call number to gprs[2].
@@@ -846,11 -850,14 +848,14 @@@
  	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
  		trace_sys_enter(regs, regs->gprs[2]);
  
- 	audit_syscall_entry(regs->gprs[2], regs->orig_gpr2,
- 			    regs->gprs[3], regs->gprs[4],
- 			    regs->gprs[5]);
+ 	if (is_compat_task())
+ 		mask = 0xffffffff;
+ 
+ 	audit_syscall_entry(regs->gprs[2], regs->orig_gpr2 & mask,
+ 			    regs->gprs[3] & mask, regs->gprs[4] & mask,
+ 			    regs->gprs[5] & mask);
 -out:
 -	return ret ?: regs->gprs[2];
 +
 +	return regs->gprs[2];
  }
  
  asmlinkage void do_syscall_trace_exit(struct pt_regs *regs)
