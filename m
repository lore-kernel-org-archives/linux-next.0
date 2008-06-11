From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: block merge conflicts
Date: Wed, 11 Jun 2008 21:56:06 +0200
Message-ID: <20080611195604.GE20851@kernel.dk>
References: <20080611184729.978d62d2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:27888 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751232AbYFKT4I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Jun 2008 15:56:08 -0400
Content-Disposition: inline
In-Reply-To: <20080611184729.978d62d2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, Jun 11 2008, Stephen Rothwell wrote:
> Hi Jens,
> 
> [You win the prize for most conflicts in one day!  :-)]

Don't know whether to laugh or cry ;-)

> Today's linux-next merge of the block tree got conflicts in the following
> files:
> 
> arch/powerpc/Kconfig	against the ftrace tree (trivial)
> arch/s390/kernel/time.c	against the s390 tree (function name change
> 			etr_sync_cpu_start -> clock_sync_cpu_start and
> 			etr_disable_sync_clock -> disable_sync_clock)
> arch/x86/kernel/apic_32.c	against the x86 tree (set_intr_gate ->
> 				alloc_intr_gate)
> arch/x86/kernel/cpu/perfctr-watchdog.c	against the x86 tree (trivial)
> arch/x86/kernel/i8259_64.c	against the x86 tree (set_intr_gate ->
> 				alloc_intr_gate and the part of the file was
> 				moved to irqinit_64.c)
> arch/x86/kernel/ldt.c	against the x86 tree (argument to smp_call_function
> 			changed)
> arch/x86/kernel/nmi_32.c	against the x86 tree (file was merged
> 				into nmi.c which merged correctly)
> arch/x86/kvm/vmx.c	against the kvm tree (trivial context and an
> 			on_each_cpu was removed)
> arch/x86/xen/smp.c	against the cpus4096 tree (for_each_cpu_mask ->
> 			for_each_cpu_mask_nr and context)
> include/asm-x86/hw_irq_32.h	against the x86 tree (merged into hw_irq.h)
> include/asm-x86/hw_irq_64.h	against the x86 tree (merged into hw_irq.h
> 				and irq_vectors.h)
> include/asm-x86/mach-default/irq_vectors.h	against the x86 tree (merged
> 						into asm-x86/irq_vectors.h)
> include/asm-x86/mach-voyager/irq_vectors.h	against the x86 tree (merged
> 						into asm-x86/irq_vectors.h)
> (There was a bug in the above file - QIC_CALL_FUNCTION_CPI is used twice
> instead of being QIC_CALL_FUNCTION_SINGLE_CPI the second time)
> kernel/Makefile		against the sched tree (trivial context)
> kernel/rcupdate.c	against the sched tree (changed parameter to
> 			on_each_cpu)
> net/iucv/iucv.c		against the net tree (trivial context)
> virt/kvm/kvm_main.c	against the kvm tree (trivial context)
> 
> 
> So you can see that there are some challenges there.  I tried to fix it
> all up as well as I could but no guarantees.
> 
> However the powerpc ppc64_defconfig build failed immediately like this:
> 
> In file included from include/linux/smp.h:29,
>                  from include/linux/topology.h:33,
>                  from include/linux/mmzone.h:683,
>                  from include/linux/gfp.h:4,
>                  from include/linux/slab.h:12,
>                  from include/linux/percpu.h:5,
>                  from include2/asm/time.h:18,
>                  from include2/asm/cputime.h:26,
>                  from include/linux/sched.h:66,
>                  from arch/powerpc/kernel/asm-offsets.c:17:
> include2/asm/smp.h: In function 'arch_send_call_function_single_ipi':
> include2/asm/smp.h:121: error: dereferencing pointer to incomplete type
> include2/asm/smp.h: In function 'arch_send_call_function_ipi':
> include2/asm/smp.h:129: error: dereferencing pointer to incomplete type
> 
> and it went downhill from there - smp_opts_t is defined in asm/machdep.h
> but including that in asm/smp.h only gets us more errors.
> 
> So I have reverted the block tree for today, sorry.

No worries, I'll make sure to compile test everything again and send you
a note. I had half-expected the move of the arch defines from
linux/smp.h to asm/smp.h to cause a problem or two, I'll double check
everything.

I'll send you a note tomorrow when things are going.

-- 
Jens Axboe

