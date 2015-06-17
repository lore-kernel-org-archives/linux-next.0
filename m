From: Joerg Roedel <joro@8bytes.org>
Subject: Re: linux-next: manual merge of the tip tree with the iommu tree
Date: Wed, 17 Jun 2015 11:57:52 +0200
Message-ID: <20150617095751.GB27750@8bytes.org>
References: <1434511374.24642.7.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 8bytes.org ([81.169.241.247]:46732 "EHLO theia.8bytes.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753116AbbFQJ5y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Jun 2015 05:57:54 -0400
Content-Disposition: inline
In-Reply-To: <1434511374.24642.7.camel@ellerman.id.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org Jiang Liu" <jiang.liu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>, Feng Wu <feng.wu@intel.com>

Hi Michael,

On Wed, Jun 17, 2015 at 01:22:54PM +1000, Michael Ellerman wrote:
> Today's linux-next merge of the tip tree got conflicts in:
> 
>   drivers/iommu/intel_irq_remapping.c
>   drivers/iommu/dmar.c
> 
> between commits:
> 
>   af3b358e4811 "iommu/vt-d: Copy IR table from old kernel when in kdump mode"
>   23256d0b3500 "iommu/vt-d: Move EIM detection to intel_prepare_irq_remapping"
>   9f10e5bf62f7 "iommu/vt-d: Cleanup log messages"
> 
> from the iommu tree and commits:
> 
>   8dedf4cf5a52 "irq_remapping/vt-d: Change prototypes to prepare for hierarchical irqdomain"
>   b106ee63abcc "irq_remapping/vt-d: Enhance Intel IR driver to support hierarchical irqdomains"
>   3d9b98f4ec17 "iommu, x86: Setup Posted-Interrupts capability for Intel iommu"
>   3c6e567509ed "irq_remapping/vt-d: Clean up unsued code"
>   34742db8eaf9 "iommu/vt-d: Refine the interfaces to create IRQ for DMAR unit"
> 
> from the tip tree.
> 
> Or something like that, it was a bit of a mess. Given the size of the conflict
> I doubt I got it right, but it does seem to build.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Sorry for the hassle, but your conflict resolution looks good. I tried a
merge between tip/x86/apic and iommu/next myself and solved the
conflicts. The results look quite similar to yours (not sure why I got
conflicts in unrelated files):

diff --cc arch/x86/kernel/head_32.S
index 02d2572,53eeb22..544dec4
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@@ -600,10 -603,10 +603,10 @@@ ex_entry
  	pop %ecx
  	pop %eax
  	decl %ss:early_recursion_flag
 -is_nmi:
 +.Lis_nmi:
  	addl $8,%esp		/* drop vector number and error code */
  	iret
- ENDPROC(early_idt_handler)
+ ENDPROC(early_idt_handler_common)
  
  /* This is the default interrupt "handler" :-) */
  	ALIGN
diff --cc arch/x86/kernel/head_64.S
index 43eafc8,df7e780..e5c27f7
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@@ -409,10 -411,10 +411,10 @@@ early_idt_handler_common
  	popq %rcx
  	popq %rax
  	decl early_recursion_flag(%rip)
 -is_nmi:
 +.Lis_nmi:
  	addq $16,%rsp		# drop vector number and error code
  	INTERRUPT_RETURN
- ENDPROC(early_idt_handler)
+ ENDPROC(early_idt_handler_common)
  
  	__INITDATA
  
diff --cc drivers/iommu/dmar.c
index 536f2d8,c588658..c9db04d
--- a/drivers/iommu/dmar.c
+++ b/drivers/iommu/dmar.c
@@@ -1642,17 -1642,26 +1642,17 @@@ int dmar_set_interrupt(struct intel_iom
  	if (iommu->irq)
  		return 0;
  
 -	irq = dmar_alloc_hwirq();
 -	if (irq <= 0) {
 +	irq = dmar_alloc_hwirq(iommu->seq_id, iommu->node, iommu);
 +	if (irq > 0) {
 +		iommu->irq = irq;
 +	} else {
- 		pr_err("IOMMU: no free vectors\n");
+ 		pr_err("No free IRQ vectors\n");
  		return -EINVAL;
  	}
  
 -	irq_set_handler_data(irq, iommu);
 -	iommu->irq = irq;
 -
 -	ret = arch_setup_dmar_msi(irq);
 -	if (ret) {
 -		irq_set_handler_data(irq, NULL);
 -		iommu->irq = 0;
 -		dmar_free_hwirq(irq);
 -		return ret;
 -	}
 -
  	ret = request_irq(irq, dmar_fault, IRQF_NO_THREAD, iommu->name, iommu);
  	if (ret)
- 		pr_err("IOMMU: can't request irq\n");
+ 		pr_err("Can't request irq\n");
  	return ret;
  }
  
diff --cc drivers/iommu/intel_irq_remapping.c
index 80f1d14,47fcebf..05375af
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@@ -8,7 -11,7 +11,8 @@@
  #include <linux/irq.h>
  #include <linux/intel-iommu.h>
  #include <linux/acpi.h>
+ #include <linux/crash_dump.h>
 +#include <linux/irqdomain.h>
  #include <asm/io_apic.h>
  #include <asm/smp.h>
  #include <asm/cpu.h>
@@@ -72,14 -54,63 +76,34 @@@ static struct hpet_scope ir_hpet[MAX_HP
   * the dmar_global_lock.
   */
  static DEFINE_RAW_SPINLOCK(irq_2_ir_lock);
 +static struct irq_domain_ops intel_ir_domain_ops;
  
+ static void iommu_disable_irq_remapping(struct intel_iommu *iommu);
  static int __init parse_ioapics_under_ir(void);
  
+ static bool ir_pre_enabled(struct intel_iommu *iommu)
+ {
+ 	return (iommu->flags & VTD_FLAG_IRQ_REMAP_PRE_ENABLED);
+ }
+ 
+ static void clear_ir_pre_enabled(struct intel_iommu *iommu)
+ {
+ 	iommu->flags &= ~VTD_FLAG_IRQ_REMAP_PRE_ENABLED;
+ }
+ 
+ static void init_ir_status(struct intel_iommu *iommu)
+ {
+ 	u32 gsts;
+ 
+ 	gsts = readl(iommu->reg + DMAR_GSTS_REG);
+ 	if (gsts & DMA_GSTS_IRES)
+ 		iommu->flags |= VTD_FLAG_IRQ_REMAP_PRE_ENABLED;
+ }
+ 
 -static struct irq_2_iommu *irq_2_iommu(unsigned int irq)
 -{
 -	struct irq_cfg *cfg = irq_cfg(irq);
 -	return cfg ? &cfg->irq_2_iommu : NULL;
 -}
 -
 -static int get_irte(int irq, struct irte *entry)
 -{
 -	struct irq_2_iommu *irq_iommu = irq_2_iommu(irq);
 -	unsigned long flags;
 -	int index;
 -
 -	if (!entry || !irq_iommu)
 -		return -1;
 -
 -	raw_spin_lock_irqsave(&irq_2_ir_lock, flags);
 -
 -	if (unlikely(!irq_iommu->iommu)) {
 -		raw_spin_unlock_irqrestore(&irq_2_ir_lock, flags);
 -		return -1;
 -	}
 -
 -	index = irq_iommu->irte_index + irq_iommu->sub_handle;
 -	*entry = *(irq_iommu->iommu->ir_table->base + index);
 -
 -	raw_spin_unlock_irqrestore(&irq_2_ir_lock, flags);
 -	return 0;
 -}
 -
 -static int alloc_irte(struct intel_iommu *iommu, int irq, u16 count)
 +static int alloc_irte(struct intel_iommu *iommu, int irq,
 +		      struct irq_2_iommu *irq_iommu, u16 count)
  {
  	struct ir_table *table = iommu->ir_table;
 -	struct irq_2_iommu *irq_iommu = irq_2_iommu(irq);
 -	struct irq_cfg *cfg = irq_cfg(irq);
  	unsigned int mask = 0;
  	unsigned long flags;
  	int index;
@@@ -534,9 -693,9 +645,29 @@@ static void __init intel_cleanup_irq_re
  	}
  
  	if (x2apic_supported())
- 		pr_warn("Failed to enable irq remapping.  You are vulnerable to irq-injection attacks.\n");
+ 		pr_warn("Failed to enable irq remapping. You are vulnerable to irq-injection attacks.\n");
+ }
+ 
++/*
++ * Set Posted-Interrupts capability.
++ */
++static inline void set_irq_posting_cap(void)
++{
++	struct dmar_drhd_unit *drhd;
++	struct intel_iommu *iommu;
++
++	if (!disable_irq_post) {
++		intel_irq_remap_ops.capability |= 1 << IRQ_POSTING_CAP;
++
++		for_each_iommu(iommu, drhd)
++			if (!cap_pi_support(iommu->cap)) {
++				intel_irq_remap_ops.capability &=
++						~(1 << IRQ_POSTING_CAP);
++				break;
++			}
++	}
 +}
 +
  static int __init intel_prepare_irq_remapping(void)
  {
  	struct dmar_drhd_unit *drhd;
@@@ -676,11 -784,16 +756,11 @@@ static int __init intel_enable_irq_rema
  
  	irq_remapping_enabled = 1;
  
 -	/*
 -	 * VT-d has a different layout for IO-APIC entries when
 -	 * interrupt remapping is enabled. So it needs a special routine
 -	 * to print IO-APIC entries for debugging purposes too.
 -	 */
 -	x86_io_apic_ops.print_entries = intel_ir_io_apic_print_entries;
 +	set_irq_posting_cap();
  
- 	pr_info("Enabled IRQ remapping in %s mode\n", eim ? "x2apic" : "xapic");
+ 	pr_info("Enabled IRQ remapping in %s mode\n", eim_mode ? "x2apic" : "xapic");
  
- 	return eim ? IRQ_REMAP_X2APIC_MODE : IRQ_REMAP_XAPIC_MODE;
+ 	return eim_mode ? IRQ_REMAP_X2APIC_MODE : IRQ_REMAP_XAPIC_MODE;
  
  error:
  	intel_cleanup_irq_remapping();
diff --cc tools/testing/selftests/x86/Makefile
index 59d364a,9b0d8ba..caa60d5
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@@ -4,9 -4,11 +4,11 @@@ include ../lib.m
  
  .PHONY: all all_32 all_64 warn_32bit_failure clean
  
 -TARGETS_C_BOTHBITS := sigreturn single_step_syscall
 +TARGETS_C_BOTHBITS := sigreturn single_step_syscall sysret_ss_attrs
+ TARGETS_C_32BIT_ONLY := entry_from_vm86
  
- BINARIES_32 := $(TARGETS_C_BOTHBITS:%=%_32)
+ TARGETS_C_32BIT_ALL := $(TARGETS_C_BOTHBITS) $(TARGETS_C_32BIT_ONLY)
+ BINARIES_32 := $(TARGETS_C_32BIT_ALL:%=%_32)
  BINARIES_64 := $(TARGETS_C_BOTHBITS:%=%_64)
  
  CFLAGS := -O2 -g -std=gnu99 -pthread -Wall
