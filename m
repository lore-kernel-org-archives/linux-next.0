From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Thu, 31 Aug 2017 10:10:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708311009020.1874@nanos>
References: <20170831142654.47f17cd7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170831142654.47f17cd7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen Devel <Xen-devel@lists.xensource.com>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 31 Aug 2017, Stephen Rothwell wrote:
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/x86/include/asm/traps.h
> index b4f322d6c95f,935709829a4e..000000000000
> --- a/arch/x86/include/asm/traps.h
> +++ b/arch/x86/include/asm/traps.h
> @@@ -38,7 -35,34 +35,33 @@@ asmlinkage void machine_check(void)
>   #endif /* CONFIG_X86_MCE */
>   asmlinkage void simd_coprocessor_error(void);
>   
> + #if defined(CONFIG_X86_64) && defined(CONFIG_XEN_PV)
> + asmlinkage void xen_divide_error(void);
> + asmlinkage void xen_xendebug(void);
> + asmlinkage void xen_xenint3(void);
> + asmlinkage void xen_nmi(void);
> + asmlinkage void xen_overflow(void);
> + asmlinkage void xen_bounds(void);
> + asmlinkage void xen_invalid_op(void);
> + asmlinkage void xen_device_not_available(void);
> + asmlinkage void xen_double_fault(void);
> + asmlinkage void xen_coprocessor_segment_overrun(void);
> + asmlinkage void xen_invalid_TSS(void);
> + asmlinkage void xen_segment_not_present(void);
> + asmlinkage void xen_stack_segment(void);
> + asmlinkage void xen_general_protection(void);
> + asmlinkage void xen_page_fault(void);
> + asmlinkage void xen_async_page_fault(void);
> + asmlinkage void xen_spurious_interrupt_bug(void);
> + asmlinkage void xen_coprocessor_error(void);
> + asmlinkage void xen_alignment_check(void);
> + #ifdef CONFIG_X86_MCE
> + asmlinkage void xen_machine_check(void);
> + #endif /* CONFIG_X86_MCE */
> + asmlinkage void xen_simd_coprocessor_error(void);
> + #endif
> + 
>   #ifdef CONFIG_TRACING
>  -asmlinkage void trace_page_fault(void);
>   #define trace_stack_segment stack_segment
>   #define trace_divide_error divide_error
>   #define trace_bounds bounds
> @@@ -53,7 -77,10 +76,11 @@@
>   #define trace_alignment_check alignment_check
>   #define trace_simd_coprocessor_error simd_coprocessor_error
>   #define trace_async_page_fault async_page_fault
>  +#define trace_page_fault page_fault

Hrm. For some reason I missed to remove these defines after getting rid of
the tracing idt.

I'll remove that now in tip and pull in the XEN stuff to see what needs to
be done.

Thanks,

	tglx
