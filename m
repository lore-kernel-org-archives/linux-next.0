From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 31 Aug 2017 05:36:57 -0700
Message-ID: <1504183017.2786.36.camel@perches.com>
References: <20170831142654.47f17cd7@canb.auug.org.au>
         <alpine.DEB.2.20.1708311009020.1874@nanos>
         <alpine.DEB.2.20.1708311057260.1874@nanos>
         <20170831091656.dmh7lgb7w4cfws6j@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170831091656.dmh7lgb7w4cfws6j@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 2017-08-31 at 11:16 +0200, Ingo Molnar wrote:
> * Thomas Gleixner <tglx@linutronix.de> wrote:
> Low prio nitpicking, could we please write such table based initializers in a 
> vertically organized, tabular fashion:
> 
> > +	{ debug,			xen_xendebug,				true },
> > +	{ int3,				xen_xenint3,				true },
> > +	{ double_fault,			xen_double_fault,			true },
> > +#ifdef CONFIG_X86_MCE
> > +	{ machine_check,		xen_machine_check,			true },
> > +#endif
> > +	{ nmi,				xen_nmi,				true },
> > +	{ overflow,			xen_overflow,				false },
> > +#ifdef CONFIG_IA32_EMULATION
> > +	{ entry_INT80_compat,		xen_entry_INT80_compat,			false },
> > +#endif
> > +	{ page_fault,			xen_page_fault,				false },
> > +	{ divide_error,			xen_divide_error,			false },
> > +	{ bounds,			xen_bounds,				false },
> > +	{ invalid_op,			xen_invalid_op,				false },
> > +	{ device_not_available,		xen_device_not_available,		false },
> > +	{ coprocessor_segment_overrun,	xen_coprocessor_segment_overrun,	false },
> > +	{ invalid_TSS,			xen_invalid_TSS,			false },
> > +	{ segment_not_present,		xen_segment_not_present,		false },
> > +	{ stack_segment,		xen_stack_segment,			false },
> > +	{ general_protection,		xen_general_protection,			false },
> > +	{ spurious_interrupt_bug,	xen_spurious_interrupt_bug,		false },
> > +	{ coprocessor_error,		xen_coprocessor_error,			false },
> > +	{ alignment_check,		xen_alignment_check,			false },
> > +	{ simd_coprocessor_error,	xen_simd_coprocessor_error,		false },
> > +#ifdef CONFIG_TRACING
> > +	{ trace_page_fault,		xen_trace_page_fault,			false },
> > +#endif
> ,,
> ... as to me such a table is 100 times more readable - YMMV.

Yeah, kinda.

It's a lot of whitespace and eyeball left/right scanning.
And these tables require whitespace updating if a longer
name is ever used.

Given the near 1:1 mapping of <trap> to xen_<trap>
perhaps adding a macro would be nice.

#define xen_trap(trap, ist_ok) \
	{ trap, xen_##trap, ist_ok }

	{ debug,	xen_xendebug,	true },
	{ int3,		xen_xenint3,	true },
#ifdef CONFIG_X86_MCE
	xen_trap(machine_check, true),
#endif
	xen_trap(double_fault, true),
	xen_trap(nmi, true),
	xen_trap(overflow, false),
	...

ymmv. </bikeshedding>
