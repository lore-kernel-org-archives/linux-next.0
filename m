From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the perfmon3 tree
Date: Tue, 25 Nov 2008 21:03:19 +1100
Message-ID: <20081125210319.35b2d189.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41683 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752346AbYKYKDg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 05:03:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: stephane eranian <eranian@googlemail.com>
Cc: linux-next@vger.kernel.org, Alexander van Heukelum <heukelum@mailshack.com>, Ingo Molnar <mingo@elte.hu>

Hi Stephane,

Today's linux-next merge of the perfmon3 tree got a conflict in
arch/x86/kernel/entry_64.S between commit
322648d1ba75280d62f114d47048beb0b35f5047 ("x86: include ENTRY/END in
entry handlers in entry_64.S") from the x86 tree and commit
3511a04973eaac18ee386f0db8c109e589019511 ("perfmon: x86-64 hooks") from
the perfmon3 tree.

A new way of doing things.  I fixed it up (see below) and can carry the
fixup as necessary.  I am not sure about this fix, confirmation would be
nice.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/entry_64.S
index fc0ad87,b6f061e..0000000
--- a/arch/x86/kernel/entry_64.S
+++ b/arch/x86/kernel/entry_64.S
@@@ -929,190 -810,133 +929,195 @@@ ENTRY(\sym
  	INTR_FRAME
  	pushq $~(\num)
  	CFI_ADJUST_CFA_OFFSET 8
 -	interrupt \func
 +	interrupt \do_sym
  	jmp ret_from_intr
  	CFI_ENDPROC
 -	.endm
 -
 -ENTRY(thermal_interrupt)
 -	apicinterrupt THERMAL_APIC_VECTOR,smp_thermal_interrupt
 -END(thermal_interrupt)
 -
 -ENTRY(threshold_interrupt)
 -	apicinterrupt THRESHOLD_APIC_VECTOR,mce_threshold_interrupt
 -END(threshold_interrupt)
 -
 -#ifdef CONFIG_SMP	
 -ENTRY(reschedule_interrupt)
 -	apicinterrupt RESCHEDULE_VECTOR,smp_reschedule_interrupt
 -END(reschedule_interrupt)
 -
 -	.macro INVALIDATE_ENTRY num
 -ENTRY(invalidate_interrupt\num)
 -	apicinterrupt INVALIDATE_TLB_VECTOR_START+\num,smp_invalidate_interrupt	
 -END(invalidate_interrupt\num)
 -	.endm
 +END(\sym)
 +.endm
  
 -	INVALIDATE_ENTRY 0
 -	INVALIDATE_ENTRY 1
 -	INVALIDATE_ENTRY 2
 -	INVALIDATE_ENTRY 3
 -	INVALIDATE_ENTRY 4
 -	INVALIDATE_ENTRY 5
 -	INVALIDATE_ENTRY 6
 -	INVALIDATE_ENTRY 7
 -
 -ENTRY(call_function_interrupt)
 -	apicinterrupt CALL_FUNCTION_VECTOR,smp_call_function_interrupt
 -END(call_function_interrupt)
 -ENTRY(call_function_single_interrupt)
 -	apicinterrupt CALL_FUNCTION_SINGLE_VECTOR,smp_call_function_single_interrupt
 -END(call_function_single_interrupt)
 -ENTRY(irq_move_cleanup_interrupt)
 -	apicinterrupt IRQ_MOVE_CLEANUP_VECTOR,smp_irq_move_cleanup_interrupt
 -END(irq_move_cleanup_interrupt)
 +#ifdef CONFIG_SMP
 +apicinterrupt IRQ_MOVE_CLEANUP_VECTOR \
 +	irq_move_cleanup_interrupt smp_irq_move_cleanup_interrupt
  #endif
  
 -ENTRY(apic_timer_interrupt)
 -	apicinterrupt LOCAL_TIMER_VECTOR,smp_apic_timer_interrupt
 -END(apic_timer_interrupt)
 -
 -ENTRY(uv_bau_message_intr1)
 -	apicinterrupt 220,uv_bau_message_interrupt
 -END(uv_bau_message_intr1)
 +apicinterrupt 220 \
 +	uv_bau_message_intr1 uv_bau_message_interrupt
 +apicinterrupt LOCAL_TIMER_VECTOR \
 +	apic_timer_interrupt smp_apic_timer_interrupt
 +
 +#ifdef CONFIG_SMP
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+0 \
 +	invalidate_interrupt0 smp_invalidate_interrupt
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+1 \
 +	invalidate_interrupt1 smp_invalidate_interrupt
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+2 \
 +	invalidate_interrupt2 smp_invalidate_interrupt
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+3 \
 +	invalidate_interrupt3 smp_invalidate_interrupt
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+4 \
 +	invalidate_interrupt4 smp_invalidate_interrupt
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+5 \
 +	invalidate_interrupt5 smp_invalidate_interrupt
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+6 \
 +	invalidate_interrupt6 smp_invalidate_interrupt
 +apicinterrupt INVALIDATE_TLB_VECTOR_START+7 \
 +	invalidate_interrupt7 smp_invalidate_interrupt
 +#endif
  
 -ENTRY(error_interrupt)
 -	apicinterrupt ERROR_APIC_VECTOR,smp_error_interrupt
 -END(error_interrupt)
 +apicinterrupt THRESHOLD_APIC_VECTOR \
 +	threshold_interrupt mce_threshold_interrupt
 +apicinterrupt THERMAL_APIC_VECTOR \
 +	thermal_interrupt smp_thermal_interrupt
 +
 +#ifdef CONFIG_SMP
 +apicinterrupt CALL_FUNCTION_SINGLE_VECTOR \
 +	call_function_single_interrupt smp_call_function_single_interrupt
 +apicinterrupt CALL_FUNCTION_VECTOR \
 +	call_function_interrupt smp_call_function_interrupt
 +apicinterrupt RESCHEDULE_VECTOR \
 +	reschedule_interrupt smp_reschedule_interrupt
 +#endif
  
 -ENTRY(spurious_interrupt)
 -	apicinterrupt SPURIOUS_APIC_VECTOR,smp_spurious_interrupt
 -END(spurious_interrupt)
 +apicinterrupt ERROR_APIC_VECTOR \
 +	error_interrupt smp_error_interrupt
 +apicinterrupt SPURIOUS_APIC_VECTOR \
 +	spurious_interrupt smp_spurious_interrupt
  
+ #ifdef CONFIG_PERFMON
 -ENTRY(pmu_interrupt)
 -	apicinterrupt LOCAL_PERFMON_VECTOR,smp_pmu_interrupt
 -END(pmu_interrupt)
++apicinterrupt LOCAL_PERFMON_VECTOR \
++	pmu_interrupt smp_pmu_interrupt
+ #endif
+ 
  /*
   * Exception entry points.
 - */ 		
 -	.macro zeroentry sym
 + */
 +.macro zeroentry sym do_sym
 +ENTRY(\sym)
  	INTR_FRAME
  	PARAVIRT_ADJUST_EXCEPTION_FRAME
 -	pushq $0	/* push error code/oldrax */ 
 +	pushq_cfi $-1		/* ORIG_RAX: no syscall to restart */
 +	subq $15*8,%rsp
 +	CFI_ADJUST_CFA_OFFSET 15*8
 +	call error_entry
 +	DEFAULT_FRAME 0
 +	movq %rsp,%rdi		/* pt_regs pointer */
 +	xorl %esi,%esi		/* no error code */
 +	call \do_sym
 +	jmp error_exit		/* %ebx: no swapgs flag */
 +	CFI_ENDPROC
 +END(\sym)
 +.endm
 +
 +.macro paranoidzeroentry sym do_sym
 +KPROBE_ENTRY(\sym)
 +	INTR_FRAME
 +	PARAVIRT_ADJUST_EXCEPTION_FRAME
 +	pushq $-1		/* ORIG_RAX: no syscall to restart */
  	CFI_ADJUST_CFA_OFFSET 8
 -	pushq %rax	/* push real oldrax to the rdi slot */ 
 +	subq $15*8, %rsp
 +	call save_paranoid
 +	TRACE_IRQS_OFF
 +	movq %rsp,%rdi		/* pt_regs pointer */
 +	xorl %esi,%esi		/* no error code */
 +	call \do_sym
 +	jmp paranoid_exit	/* %ebx: no swapgs flag */
 +	CFI_ENDPROC
 +KPROBE_END(\sym)
 +.endm
 +
 +.macro paranoidzeroentry_ist sym do_sym ist
 +KPROBE_ENTRY(\sym)
 + 	INTR_FRAME
 +	PARAVIRT_ADJUST_EXCEPTION_FRAME
 +	pushq $-1		/* ORIG_RAX: no syscall to restart */
  	CFI_ADJUST_CFA_OFFSET 8
 -	CFI_REL_OFFSET rax,0
 -	leaq  \sym(%rip),%rax
 -	jmp error_entry
 +	subq $15*8, %rsp
 +	call save_paranoid
 +	TRACE_IRQS_OFF
 +	movq %rsp,%rdi		/* pt_regs pointer */
 +	xorl %esi,%esi		/* no error code */
 +	movq %gs:pda_data_offset, %rbp
 +	subq $EXCEPTION_STKSZ, per_cpu__init_tss + TSS_ist + (\ist - 1) * 8(%rbp)
 +	call \do_sym
 +	addq $EXCEPTION_STKSZ, per_cpu__init_tss + TSS_ist + (\ist - 1) * 8(%rbp)
 +	jmp paranoid_exit	/* %ebx: no swapgs flag */
  	CFI_ENDPROC
 -	.endm	
 +KPROBE_END(\sym)
 +.endm
  
 -	.macro errorentry sym
 +.macro errorentry sym do_sym entry=0
 +.if \entry
 +KPROBE_ENTRY(\sym)
 +.else
 +ENTRY(\sym)
 +.endif
  	XCPT_FRAME
  	PARAVIRT_ADJUST_EXCEPTION_FRAME
 -	pushq %rax
 -	CFI_ADJUST_CFA_OFFSET 8
 -	CFI_REL_OFFSET rax,0
 -	leaq  \sym(%rip),%rax
 -	jmp error_entry
 +	subq $15*8,%rsp
 +	CFI_ADJUST_CFA_OFFSET 15*8
 +	call error_entry
 +	DEFAULT_FRAME 0
 +	movq %rsp,%rdi			/* pt_regs pointer */
 +	movq ORIG_RAX(%rsp),%rsi	/* get error code */
 +	movq $-1,ORIG_RAX(%rsp)		/* no syscall to restart */
 +	call \do_sym
 +	jmp error_exit			/* %ebx: no swapgs flag */
  	CFI_ENDPROC
 -	.endm
 +.if \entry
 +KPROBE_END(\sym)
 +.else
 +END(\sym)
 +.endif
 +.endm
  
  	/* error code is on the stack already */
 -	/* handle NMI like exceptions that can happen everywhere */
 -	.macro paranoidentry sym, ist=0, irqtrace=1
 -	SAVE_ALL
 -	cld
 -	movl $1,%ebx
 -	movl  $MSR_GS_BASE,%ecx
 -	rdmsr
 -	testl %edx,%edx
 -	js    1f
 -	SWAPGS
 -	xorl  %ebx,%ebx
 -1:
 -	.if \ist
 -	movq	%gs:pda_data_offset, %rbp
 -	.endif
 -	.if \irqtrace
 -	TRACE_IRQS_OFF
 -	.endif
 -	movq %rsp,%rdi
 -	movq ORIG_RAX(%rsp),%rsi
 -	movq $-1,ORIG_RAX(%rsp)
 -	.if \ist
 -	subq	$EXCEPTION_STKSZ, per_cpu__init_tss + TSS_ist + (\ist - 1) * 8(%rbp)
 -	.endif
 -	call \sym
 -	.if \ist
 -	addq	$EXCEPTION_STKSZ, per_cpu__init_tss + TSS_ist + (\ist - 1) * 8(%rbp)
 -	.endif
 -	DISABLE_INTERRUPTS(CLBR_NONE)
 -	.if \irqtrace
 +.macro paranoiderrorentry sym do_sym entry=1
 +.if \entry
 +KPROBE_ENTRY(\sym)
 +.else
 +ENTRY(\sym)
 +.endif
 +	XCPT_FRAME
 +	PARAVIRT_ADJUST_EXCEPTION_FRAME
 +	subq $15*8,%rsp
 +	CFI_ADJUST_CFA_OFFSET 15*8
 +	call save_paranoid
 +	DEFAULT_FRAME 0
  	TRACE_IRQS_OFF
 -	.endif
 -	.endm
 +	movq %rsp,%rdi			/* pt_regs pointer */
 +	movq ORIG_RAX(%rsp),%rsi	/* get error code */
 +	movq $-1,ORIG_RAX(%rsp)		/* no syscall to restart */
 +	call \do_sym
 +	jmp paranoid_exit		/* %ebx: no swapgs flag */
 +	CFI_ENDPROC
 +.if \entry
 +KPROBE_END(\sym)
 +.else
 +END(\sym)
 +.endif
 +.endm
 +
 +zeroentry divide_error do_divide_error
 +paranoidzeroentry_ist debug do_debug DEBUG_STACK
 +paranoidzeroentry_ist int3 do_int3 DEBUG_STACK
 +zeroentry overflow do_overflow
 +zeroentry bounds do_bounds
 +zeroentry invalid_op do_invalid_op
 +zeroentry device_not_available do_device_not_available
 +paranoiderrorentry double_fault do_double_fault 0
 +zeroentry coprocessor_segment_overrun do_coprocessor_segment_overrun
 +errorentry invalid_TSS do_invalid_TSS
 +errorentry segment_not_present do_segment_not_present
 +paranoiderrorentry stack_segment do_stack_segment
 +errorentry general_protection do_general_protection 1
 +errorentry page_fault do_page_fault 1
 +zeroentry spurious_interrupt_bug do_spurious_interrupt_bug
 +zeroentry coprocessor_error do_coprocessor_error
 +errorentry alignment_check do_alignment_check
 +#ifdef CONFIG_X86_MCE
 +paranoidzeroentry machine_check do_machine_check
 +#endif
 +zeroentry simd_coprocessor_error do_simd_coprocessor_error
  
  	/*
   	 * "Paranoid" exit path from exception stack.
