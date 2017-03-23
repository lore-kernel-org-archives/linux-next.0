From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the livepatching tree with the s390
 tree
Date: Thu, 23 Mar 2017 14:27:34 +1100
Message-ID: <20170323142734.38b03846@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:42135 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932117AbdCWD1o (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 22 Mar 2017 23:27:44 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Miroslav Benes <mbenes@suse.cz>, Josh Poimboeuf <jpoimboe@redhat.com>

Hi all,

Today's linux-next merge of the livepatching tree got conflicts in:

  arch/s390/include/asm/thread_info.h
  arch/s390/kernel/entry.S

between commit:

  916cda1aa1b4 ("s390: add a system call for guarded storage")

from the s390 tree and commits:

  30d64f1904d4 ("livepatch/s390: reorganize TIF thread flag bits")
  2f09ca60a56d ("livepatch/s390: add TIF_PATCH_PENDING thread flag")

from the livepatching tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/s390/include/asm/thread_info.h
index f36e6e2b73f0,646845edf148..000000000000
--- a/arch/s390/include/asm/thread_info.h
+++ b/arch/s390/include/asm/thread_info.h
@@@ -55,11 -56,8 +56,9 @@@ int arch_dup_task_struct(struct task_st
  #define TIF_SIGPENDING		1	/* signal pending */
  #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
  #define TIF_UPROBE		3	/* breakpointed or single-stepping */
 -#define TIF_PATCH_PENDING	4	/* pending live patching update */
 +#define TIF_GUARDED_STORAGE	4	/* load guarded storage control block */
- #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
- #define TIF_SYSCALL_AUDIT	9	/* syscall auditing active */
- #define TIF_SECCOMP		10	/* secure computing */
- #define TIF_SYSCALL_TRACEPOINT	11	/* syscall tracepoint instrumentation */
++#define TIF_PATCH_PENDING	5	/* pending live patching update */
+ 
  #define TIF_31BIT		16	/* 32bit process */
  #define TIF_MEMDIE		17	/* is terminating due to OOM killer */
  #define TIF_RESTORE_SIGMASK	18	/* restore signal mask in do_signal() */
@@@ -70,6 -74,12 +75,13 @@@
  #define _TIF_NOTIFY_RESUME	_BITUL(TIF_NOTIFY_RESUME)
  #define _TIF_SIGPENDING		_BITUL(TIF_SIGPENDING)
  #define _TIF_NEED_RESCHED	_BITUL(TIF_NEED_RESCHED)
+ #define _TIF_UPROBE		_BITUL(TIF_UPROBE)
++#define _TIF_GUARDED_STORAGE	_BITUL(TIF_GUARDED_STORAGE)
+ #define _TIF_PATCH_PENDING	_BITUL(TIF_PATCH_PENDING)
+ 
+ #define _TIF_31BIT		_BITUL(TIF_31BIT)
+ #define _TIF_SINGLE_STEP	_BITUL(TIF_SINGLE_STEP)
+ 
  #define _TIF_SYSCALL_TRACE	_BITUL(TIF_SYSCALL_TRACE)
  #define _TIF_SYSCALL_AUDIT	_BITUL(TIF_SYSCALL_AUDIT)
  #define _TIF_SECCOMP		_BITUL(TIF_SECCOMP)
diff --cc arch/s390/kernel/entry.S
index fa8b8f28e08b,a08b5eea5567..000000000000
--- a/arch/s390/kernel/entry.S
+++ b/arch/s390/kernel/entry.S
@@@ -47,7 -47,7 +47,7 @@@ STACK_SIZE  = 1 << STACK_SHIF
  STACK_INIT = STACK_SIZE - STACK_FRAME_OVERHEAD - __PT_SIZE
  
  _TIF_WORK	= (_TIF_SIGPENDING | _TIF_NOTIFY_RESUME | _TIF_NEED_RESCHED | \
- 		   _TIF_UPROBE | _TIF_GUARDED_STORAGE)
 -		   _TIF_UPROBE | _TIF_PATCH_PENDING)
++		   _TIF_UPROBE | _TIF_GUARDED_STORAGE | _TIF_PATCH_PENDING)
  _TIF_TRACE	= (_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | _TIF_SECCOMP | \
  		   _TIF_SYSCALL_TRACEPOINT)
  _CIF_WORK	= (_CIF_MCCK_PENDING | _CIF_ASCE_PRIMARY | \
@@@ -332,10 -332,13 +332,15 @@@ ENTRY(system_call
  	TSTMSK	__TI_flags(%r12),_TIF_UPROBE
  	jo	.Lsysc_uprobe_notify
  #endif
 +	TSTMSK	__TI_flags(%r12),_TIF_GUARDED_STORAGE
 +	jo	.Lsysc_guarded_storage
  	TSTMSK	__PT_FLAGS(%r11),_PIF_PER_TRAP
  	jo	.Lsysc_singlestep
+ #ifdef CONFIG_LIVEPATCH
+ 	TSTMSK	__TI_flags(%r12),_TIF_PATCH_PENDING
+ 	jo	.Lsysc_patch_pending	# handle live patching just before
+ 					# signals and possible syscall restart
+ #endif
  	TSTMSK	__TI_flags(%r12),_TIF_SIGPENDING
  	jo	.Lsysc_sigpending
  	TSTMSK	__TI_flags(%r12),_TIF_NOTIFY_RESUME
@@@ -411,13 -414,15 +416,22 @@@
  #endif
  
  #
 +# _TIF_GUARDED_STORAGE is set, call guarded_storage_load
 +#
 +.Lsysc_guarded_storage:
 +	lgr	%r2,%r11		# pass pointer to pt_regs
 +	larl	%r14,.Lsysc_return
 +	jg	gs_load_bc_cb
 +
+ # _TIF_PATCH_PENDING is set, call klp_update_patch_state
+ #
+ #ifdef CONFIG_LIVEPATCH
+ .Lsysc_patch_pending:
+ 	lg	%r2,__LC_CURRENT	# pass pointer to task struct
+ 	larl	%r14,.Lsysc_return
+ 	jg	klp_update_patch_state
+ #endif
+ 
  #
  # _PIF_PER_TRAP is set, call do_per_trap
  #
