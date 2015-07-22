From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvms390 tree with the s390 tree
Date: Wed, 22 Jul 2015 12:31:21 +1000
Message-ID: <20150722123121.665531b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39315 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751769AbbGVCbX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2015 22:31:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hendrik Brueckner <brueckner@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  arch/s390/kernel/entry.S

between commit:

  2a1a14484b97 ("s390/kernel: lazy restore fpu registers")
  3af40983a937 ("s390/kvm: fix interrupt race with HANDLE_SIE_INTERCEPT")
  0be8cda612d8 ("s390/kvm: integrate HANDLE_SIE_INTERCEPT into cleanup_critical")

from the s390 tree and commit:

  e983d24d6117 ("KVM: s390: use pid of cpu thread for sampling tagging")

from the kvms390 tree.

I fixed it up (maybe? see below) and can carry the fix as necessary
(no action is required - unless this fix is just wrong).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/s390/kernel/entry.S
index bde6275dd813,0dfa5f4ce755..000000000000
--- a/arch/s390/kernel/entry.S
+++ b/arch/s390/kernel/entry.S
@@@ -169,70 -193,6 +169,70 @@@ ENTRY(__switch_to
  	br	%r14
  
  .L__critical_start:
 +
 +#if IS_ENABLED(CONFIG_KVM)
 +/*
 + * sie64a calling convention:
 + * %r2 pointer to sie control block
 + * %r3 guest register save area
 + */
 +ENTRY(sie64a)
 +	stmg	%r6,%r14,__SF_GPRS(%r15)	# save kernel registers
 +	stg	%r2,__SF_EMPTY(%r15)		# save control block pointer
 +	stg	%r3,__SF_EMPTY+8(%r15)		# save guest register save area
 +	xc	__SF_EMPTY+16(16,%r15),__SF_EMPTY+16(%r15) # host id & reason
 +	tm	__LC_CPU_FLAGS+7,_CIF_FPU	# load guest fp/vx registers ?
 +	jno	.Lsie_load_guest_gprs
 +	lg	%r12,__LC_THREAD_INFO		# load fp/vx regs save area
 +	brasl	%r14,load_fpu_regs		# load guest fp/vx regs
 +.Lsie_load_guest_gprs:
 +	lmg	%r0,%r13,0(%r3)			# load guest gprs 0-13
 +	lg	%r14,__LC_GMAP			# get gmap pointer
 +	ltgr	%r14,%r14
 +	jz	.Lsie_gmap
 +	lctlg	%c1,%c1,__GMAP_ASCE(%r14)	# load primary asce
 +.Lsie_gmap:
 +	lg	%r14,__SF_EMPTY(%r15)		# get control block pointer
 +	oi	__SIE_PROG0C+3(%r14),1		# we are going into SIE now
 +	tm	__SIE_PROG20+3(%r14),3		# last exit...
 +	jnz	.Lsie_skip
 +	tm	__LC_CPU_FLAGS+7,_CIF_FPU
 +	jo	.Lsie_skip			# exit if fp/vx regs changed
 +	tm	__LC_MACHINE_FLAGS+6,0x20	# MACHINE_FLAG_LPP
 +	jz	.Lsie_enter
- 	.insn	s,0xb2800000,__SF_EMPTY(%r15)	# set guest id
++	.insn	s,0xb2800000,__LC_CURRENT_PID	# use cpu thread pid
 +.Lsie_enter:
 +	sie	0(%r14)
 +	tm	__LC_MACHINE_FLAGS+6,0x20	# MACHINE_FLAG_LPP
 +	jz	.Lsie_skip
 +	.insn	s,0xb2800000,__SF_EMPTY+16(%r15)# set host id
 +.Lsie_skip:
 +	ni	__SIE_PROG0C+3(%r14),0xfe	# no longer in SIE
 +	lctlg	%c1,%c1,__LC_USER_ASCE		# load primary asce
 +.Lsie_done:
 +# some program checks are suppressing. C code (e.g. do_protection_exception)
 +# will rewind the PSW by the ILC, which is 4 bytes in case of SIE. Other
 +# instructions between sie64a and .Lsie_done should not cause program
 +# interrupts. So lets use a nop (47 00 00 00) as a landing pad.
 +# See also .Lcleanup_sie
 +.Lrewind_pad:
 +	nop	0
 +	.globl sie_exit
 +sie_exit:
 +	lg	%r14,__SF_EMPTY+8(%r15)		# load guest register save area
 +	stmg	%r0,%r13,0(%r14)		# save guest gprs 0-13
 +	lmg	%r6,%r14,__SF_GPRS(%r15)	# restore kernel registers
 +	lg	%r2,__SF_EMPTY+24(%r15)		# return exit reason code
 +	br	%r14
 +.Lsie_fault:
 +	lghi	%r14,-EFAULT
 +	stg	%r14,__SF_EMPTY+24(%r15)	# set exit reason code
 +	j	sie_exit
 +
 +	EX_TABLE(.Lrewind_pad,.Lsie_fault)
 +	EX_TABLE(sie_exit,.Lsie_fault)
 +#endif
 +
  /*
   * SVC interrupt handler routine. System calls are synchronous events and
   * are executed with interrupts enabled.
