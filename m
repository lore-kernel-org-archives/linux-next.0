From: Juergen Gross <jgross@suse.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 31 Aug 2017 12:11:49 +0200
Message-ID: <b8a39692-160e-a15a-158f-74fd5255348b@suse.com>
References: <20170831142654.47f17cd7@canb.auug.org.au>
 <alpine.DEB.2.20.1708311009020.1874@nanos>
 <alpine.DEB.2.20.1708311057260.1874@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38158 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750968AbdHaKLz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 31 Aug 2017 06:11:55 -0400
In-Reply-To: <alpine.DEB.2.20.1708311057260.1874@nanos>
Content-Language: de-DE
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 31/08/17 11:00, Thomas Gleixner wrote:
> On Thu, 31 Aug 2017, Thomas Gleixner wrote:
>> Hrm. For some reason I missed to remove these defines after getting rid of
>> the tracing idt.
>>
>> I'll remove that now in tip and pull in the XEN stuff to see what needs to
>> be done.
> 
> I pushed out the removal of the trace leftovers. Talked to Juergen on IRC
> and he suggested to revert the XEN patch in the xen tree and merge it
> through tip.
> 
> I've applied it on top of tip:x86/apic and fixed up the merge conflicts
> mindlessly. Patch below.
> 
> Juergen, can you please check the result?
> 
> Thanks,
> 
> 	tglx
> 
> 8<-------------
> Subject: xen: Get rid of paravirt op adjust_exception_frame
> From: Juergen Gross <jgross@suse.com>
> Date: Fri, 11 Aug 2017 16:54:48 +0200
> 
> When running as Xen pv-guest the exception frame on the stack contains
> %r11 and %rcx additional to the other data pushed by the processor.
> 
> Instead of having a paravirt op being called for each exception type
> prepend the Xen specific code to each exception entry. When running as
> Xen pv-guest just use the exception entry with prepended instructions,
> otherwise use the entry without the Xen specific code.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Cc: xen-devel@lists.xenproject.org
> Cc: boris.ostrovsky@oracle.com
> Cc: luto@amacapital.net
> Link: http://lkml.kernel.org/r/20170811145448.5679-1-jgross@suse.com
> 
> ---
>  arch/x86/entry/entry_64.S             |   11 +--
>  arch/x86/entry/entry_64_compat.S      |    1 
>  arch/x86/include/asm/paravirt.h       |    5 -
>  arch/x86/include/asm/paravirt_types.h |    4 -
>  arch/x86/include/asm/proto.h          |    3 +
>  arch/x86/include/asm/traps.h          |    3 -
>  arch/x86/kernel/asm-offsets_64.c      |    1 
>  arch/x86/kernel/paravirt.c            |    3 -
>  arch/x86/xen/enlighten_pv.c           |   96 ++++++++++++++++++++++------------
>  arch/x86/xen/irq.c                    |    3 -
>  arch/x86/xen/xen-ops.h                |    1 
>  11 files changed, 70 insertions(+), 61 deletions(-)
> 
> --- a/arch/x86/entry/entry_64.S
> +++ b/arch/x86/entry/entry_64.S
> @@ -816,7 +816,6 @@ ENTRY(\sym)
>  	.endif
>  
>  	ASM_CLAC
> -	PARAVIRT_ADJUST_EXCEPTION_FRAME
>  
>  	.ifeq \has_error_code
>  	pushq	$-1				/* ORIG_RAX: no syscall to restart */
> @@ -962,7 +961,7 @@ ENTRY(do_softirq_own_stack)
>  ENDPROC(do_softirq_own_stack)
>  
>  #ifdef CONFIG_XEN
> -idtentry xen_hypervisor_callback xen_do_hypervisor_callback has_error_code=0
> +idtentry hypervisor_callback xen_do_hypervisor_callback has_error_code=0
>  
>  /*
>   * A note on the "critical region" in our callback handler.
> @@ -1029,8 +1028,6 @@ ENTRY(xen_failsafe_callback)
>  	movq	8(%rsp), %r11
>  	addq	$0x30, %rsp
>  	pushq	$0				/* RIP */
> -	pushq	%r11
> -	pushq	%rcx
>  	UNWIND_HINT_IRET_REGS offset=8
>  	jmp	general_protection
>  1:	/* Segment mismatch => Category 1 (Bad segment). Retry the IRET. */
> @@ -1061,9 +1058,8 @@ idtentry int3			do_int3			has_error_code
>  idtentry stack_segment		do_stack_segment	has_error_code=1
>  
>  #ifdef CONFIG_XEN
> -idtentry xen_debug		do_debug		has_error_code=0
> -idtentry xen_int3		do_int3			has_error_code=0
> -idtentry xen_stack_segment	do_stack_segment	has_error_code=1
> +idtentry xendebug		do_debug		has_error_code=0
> +idtentry xenint3		do_int3			has_error_code=0
>  #endif
>  
>  idtentry general_protection	do_general_protection	has_error_code=1
> @@ -1227,6 +1223,7 @@ ENTRY(error_exit)
>  END(error_exit)
>  
>  /* Runs on exception stack */
> +/* XXX: broken on Xen PV */
>  ENTRY(nmi)
>  	UNWIND_HINT_IRET_REGS
>  	/*
> --- a/arch/x86/entry/entry_64_compat.S
> +++ b/arch/x86/entry/entry_64_compat.S
> @@ -293,7 +293,6 @@ ENTRY(entry_INT80_compat)
>  	/*
>  	 * Interrupts are off on entry.
>  	 */
> -	PARAVIRT_ADJUST_EXCEPTION_FRAME
>  	ASM_CLAC			/* Do this early to minimize exposure */
>  	SWAPGS
>  
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -960,11 +960,6 @@ extern void default_banner(void);
>  #define GET_CR2_INTO_RAX				\
>  	call PARA_INDIRECT(pv_mmu_ops+PV_MMU_read_cr2)
>  
> -#define PARAVIRT_ADJUST_EXCEPTION_FRAME					\
> -	PARA_SITE(PARA_PATCH(pv_irq_ops, PV_IRQ_adjust_exception_frame), \
> -		  CLBR_NONE,						\
> -		  call PARA_INDIRECT(pv_irq_ops+PV_IRQ_adjust_exception_frame))
> -
>  #define USERGS_SYSRET64							\
>  	PARA_SITE(PARA_PATCH(pv_cpu_ops, PV_CPU_usergs_sysret64),	\
>  		  CLBR_NONE,						\
> --- a/arch/x86/include/asm/paravirt_types.h
> +++ b/arch/x86/include/asm/paravirt_types.h
> @@ -195,10 +195,6 @@ struct pv_irq_ops {
>  
>  	void (*safe_halt)(void);
>  	void (*halt)(void);
> -
> -#ifdef CONFIG_X86_64
> -	void (*adjust_exception_frame)(void);
> -#endif
>  } __no_randomize_layout;
>  
>  struct pv_mmu_ops {
> --- a/arch/x86/include/asm/proto.h
> +++ b/arch/x86/include/asm/proto.h
> @@ -24,6 +24,9 @@ void entry_SYSENTER_compat(void);
>  void __end_entry_SYSENTER_compat(void);
>  void entry_SYSCALL_compat(void);
>  void entry_INT80_compat(void);
> +#if defined(CONFIG_X86_64) && defined(CONFIG_XEN_PV)
> +void xen_entry_INT80_compat(void);
> +#endif
>  #endif
>  
>  void x86_configure_nx(void);
> --- a/arch/x86/include/asm/traps.h
> +++ b/arch/x86/include/asm/traps.h
> @@ -13,9 +13,6 @@ asmlinkage void divide_error(void);
>  asmlinkage void debug(void);
>  asmlinkage void nmi(void);
>  asmlinkage void int3(void);
> -asmlinkage void xen_debug(void);
> -asmlinkage void xen_int3(void);
> -asmlinkage void xen_stack_segment(void);
>  asmlinkage void overflow(void);
>  asmlinkage void bounds(void);
>  asmlinkage void invalid_op(void);
> --- a/arch/x86/kernel/asm-offsets_64.c
> +++ b/arch/x86/kernel/asm-offsets_64.c
> @@ -20,7 +20,6 @@ static char syscalls_ia32[] = {
>  int main(void)
>  {
>  #ifdef CONFIG_PARAVIRT
> -	OFFSET(PV_IRQ_adjust_exception_frame, pv_irq_ops, adjust_exception_frame);
>  	OFFSET(PV_CPU_usergs_sysret64, pv_cpu_ops, usergs_sysret64);
>  	OFFSET(PV_CPU_swapgs, pv_cpu_ops, swapgs);
>  	BLANK();
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -319,9 +319,6 @@ struct pv_time_ops pv_time_ops = {
>  	.irq_enable = __PV_IS_CALLEE_SAVE(native_irq_enable),
>  	.safe_halt = native_safe_halt,
>  	.halt = native_halt,
> -#ifdef CONFIG_X86_64
> -	.adjust_exception_frame = paravirt_nop,
> -#endif
>  };
>  
>  __visible struct pv_cpu_ops pv_cpu_ops = {
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -586,6 +586,68 @@ static void xen_write_ldt_entry(struct d
>  	preempt_enable();
>  }
>  
> +#ifdef CONFIG_X86_64
> +static struct {
> +	void (*orig)(void);
> +	void (*xen)(void);
> +	bool ist_okay;
> +} trap_array[] = {
> +	{ debug, xen_xendebug, true },
> +	{ int3, xen_xenint3, true },
> +	{ double_fault, xen_double_fault, true },
> +#ifdef CONFIG_X86_MCE
> +	{ machine_check, xen_machine_check, true },
> +#endif
> +	{ nmi, xen_nmi, true },
> +	{ overflow, xen_overflow, false },
> +#ifdef CONFIG_IA32_EMULATION
> +	{ entry_INT80_compat, xen_entry_INT80_compat, false },
> +#endif
> +	{ page_fault, xen_page_fault, false },
> +	{ divide_error, xen_divide_error, false },
> +	{ bounds, xen_bounds, false },
> +	{ invalid_op, xen_invalid_op, false },
> +	{ device_not_available, xen_device_not_available, false },
> +	{ coprocessor_segment_overrun, xen_coprocessor_segment_overrun, false },
> +	{ invalid_TSS, xen_invalid_TSS, false },
> +	{ segment_not_present, xen_segment_not_present, false },
> +	{ stack_segment, xen_stack_segment, false },
> +	{ general_protection, xen_general_protection, false },
> +	{ spurious_interrupt_bug, xen_spurious_interrupt_bug, false },
> +	{ coprocessor_error, xen_coprocessor_error, false },
> +	{ alignment_check, xen_alignment_check, false },
> +	{ simd_coprocessor_error, xen_simd_coprocessor_error, false },
> +#ifdef CONFIG_TRACING
> +	{ trace_page_fault, xen_trace_page_fault, false },
> +#endif
> +};
> +
> +static bool get_trap_addr(unsigned long *addr, unsigned int ist)
> +{
> +	unsigned int nr;
> +	bool ist_okay = false;
> +
> +	/*
> +	 * Replace trap handler addresses by Xen specific ones.
> +	 * Check for known traps using IST and whitelist them.
> +	 * The debugger ones are the only ones we care about.
> +	 * Xen will handle faults like double_fault, * so we should never see
> +	 * them.  Warn if there's an unexpected IST-using fault handler.
> +	 */
> +	for (nr = 0; nr < ARRAY_SIZE(trap_array); nr++)
> +		if (*addr == (unsigned long)trap_array[nr].orig) {
> +			*addr = (unsigned long)trap_array[nr].xen;
> +			ist_okay = trap_array[nr].ist_okay;
> +			break;
> +		}
> +
> +	if (WARN_ON(ist != 0 && !ist_okay))
> +		return false;
> +
> +	return true;
> +}
> +#endif
> +
>  static int cvt_gate_to_trap(int vector, const gate_desc *val,
>  			    struct trap_info *info)
>  {
> @@ -598,40 +660,8 @@ static int cvt_gate_to_trap(int vector,
>  
>  	addr = gate_offset(val);
>  #ifdef CONFIG_X86_64
> -	/*
> -	 * Look for known traps using IST, and substitute them
> -	 * appropriately.  The debugger ones are the only ones we care
> -	 * about.  Xen will handle faults like double_fault,
> -	 * so we should never see them.  Warn if
> -	 * there's an unexpected IST-using fault handler.
> -	 */
> -	if (addr == (unsigned long)debug)
> -		addr = (unsigned long)xen_debug;
> -	else if (addr == (unsigned long)int3)
> -		addr = (unsigned long)xen_int3;
> -	else if (addr == (unsigned long)stack_segment)
> -		addr = (unsigned long)xen_stack_segment;
> -	else if (addr == (unsigned long)double_fault) {
> -		/* Don't need to handle these */
> +	if (!get_trap_addr(&addr, val->bits.ist))
>  		return 0;
> -#ifdef CONFIG_X86_MCE
> -	} else if (addr == (unsigned long)machine_check) {
> -		/*
> -		 * when xen hypervisor inject vMCE to guest,
> -		 * use native mce handler to handle it
> -		 */
> -		;
> -#endif
> -	} else if (addr == (unsigned long)nmi)
> -		/*
> -		 * Use the native version as well.
> -		 */
> -		;
> -	else {
> -		/* Some other trap using IST? */
> -		if (WARN_ON(val->bits.ist != 0))
> -			return 0;
> -	}
>  #endif	/* CONFIG_X86_64 */
>  	info->address = addr;
>  
> --- a/arch/x86/xen/irq.c
> +++ b/arch/x86/xen/irq.c
> @@ -123,9 +123,6 @@ static const struct pv_irq_ops xen_irq_o
>  
>  	.safe_halt = xen_safe_halt,
>  	.halt = xen_halt,
> -#ifdef CONFIG_X86_64
> -	.adjust_exception_frame = xen_adjust_exception_frame,
> -#endif
>  };
>  
>  void __init xen_init_irq_ops(void)
> --- a/arch/x86/xen/xen-ops.h
> +++ b/arch/x86/xen/xen-ops.h
> @@ -138,7 +138,6 @@ static inline void __init xen_efi_init(v
>  __visible void xen_iret(void);
>  __visible void xen_sysret32(void);
>  __visible void xen_sysret64(void);
> -__visible void xen_adjust_exception_frame(void);
>  
>  extern int xen_panic_handler_init(void);
>  
> 

You missed the updates to arch/x86/xen/xen-asm_64.S and the declarations
of the xen specific trap entries in arch/x86/include/asm/traps.h


Juergen
