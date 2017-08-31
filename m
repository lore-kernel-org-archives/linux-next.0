From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 31 Aug 2017 11:16:56 +0200
Message-ID: <20170831091656.dmh7lgb7w4cfws6j@gmail.com>
References: <20170831142654.47f17cd7@canb.auug.org.au>
 <alpine.DEB.2.20.1708311009020.1874@nanos>
 <alpine.DEB.2.20.1708311057260.1874@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38083 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbdHaJRB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 31 Aug 2017 05:17:01 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1708311057260.1874@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

* Thomas Gleixner <tglx@linutronix.de> wrote:

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

Low prio nitpicking, could we please write such table based initializers in a 
vertically organized, tabular fashion:

> +	{ debug,			xen_xendebug,				true },
> +	{ int3,				xen_xenint3,				true },
> +	{ double_fault,			xen_double_fault,			true },
> +#ifdef CONFIG_X86_MCE
> +	{ machine_check,		xen_machine_check,			true },
> +#endif
> +	{ nmi,				xen_nmi,				true },
> +	{ overflow,			xen_overflow,				false },
> +#ifdef CONFIG_IA32_EMULATION
> +	{ entry_INT80_compat,		xen_entry_INT80_compat,			false },
> +#endif
> +	{ page_fault,			xen_page_fault,				false },
> +	{ divide_error,			xen_divide_error,			false },
> +	{ bounds,			xen_bounds,				false },
> +	{ invalid_op,			xen_invalid_op,				false },
> +	{ device_not_available,		xen_device_not_available,		false },
> +	{ coprocessor_segment_overrun,	xen_coprocessor_segment_overrun,	false },
> +	{ invalid_TSS,			xen_invalid_TSS,			false },
> +	{ segment_not_present,		xen_segment_not_present,		false },
> +	{ stack_segment,		xen_stack_segment,			false },
> +	{ general_protection,		xen_general_protection,			false },
> +	{ spurious_interrupt_bug,	xen_spurious_interrupt_bug,		false },
> +	{ coprocessor_error,		xen_coprocessor_error,			false },
> +	{ alignment_check,		xen_alignment_check,			false },
> +	{ simd_coprocessor_error,	xen_simd_coprocessor_error,		false },
> +#ifdef CONFIG_TRACING
> +	{ trace_page_fault,		xen_trace_page_fault,			false },
> +#endif

... as to me such a table is 100 times more readable - YMMV.

(If checkpatch whinges about col80 then ignore it.)

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

And here I think we could do a more readable variant:

  static bool get_trap_addr(void **addr, unsigned int ist)
  ...
		struct trap_array_entry *entry = trap_array + nr;

		if (*addr == entry->orig) {
			*addr = entry->xen;
			ist_okay = entry->ist_okay;
			break;
		}

I believe 'void **' is the natural type that avoids the type casts, and the 
'trap_array_entry' name has to be defined in the array definition further above.

Totally untested though.

Thanks,

	Ingo
