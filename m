From: Michael Ellerman <mpe@ellerman.id.au>
Subject: linux-next: manual merge of the tip tree with the iommu tree
Date: Wed, 17 Jun 2015 13:22:54 +1000
Message-ID: <1434511374.24642.7.camel@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33659 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752554AbbFQDW4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Jun 2015 23:22:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org Jiang Liu" <jiang.liu@linux.intel.com>, Joerg Roedel <jroedel@suse.de>, Feng Wu <feng.wu@intel.com>

Hi all,

Today's linux-next merge of the tip tree got conflicts in:

  drivers/iommu/intel_irq_remapping.c
  drivers/iommu/dmar.c

between commits:

  af3b358e4811 "iommu/vt-d: Copy IR table from old kernel when in kdump mode"
  23256d0b3500 "iommu/vt-d: Move EIM detection to intel_prepare_irq_remapping"
  9f10e5bf62f7 "iommu/vt-d: Cleanup log messages"

from the iommu tree and commits:

  8dedf4cf5a52 "irq_remapping/vt-d: Change prototypes to prepare for hierarchical irqdomain"
  b106ee63abcc "irq_remapping/vt-d: Enhance Intel IR driver to support hierarchical irqdomains"
  3d9b98f4ec17 "iommu, x86: Setup Posted-Interrupts capability for Intel iommu"
  3c6e567509ed "irq_remapping/vt-d: Clean up unsued code"
  34742db8eaf9 "iommu/vt-d: Refine the interfaces to create IRQ for DMAR unit"

from the tip tree.

Or something like that, it was a bit of a mess. Given the size of the conflict
I doubt I got it right, but it does seem to build.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

cheers


diff --cc drivers/iommu/dmar.c
index c5886582b64f,536f2d8ea41a..000000000000
--- a/drivers/iommu/dmar.c
+++ b/drivers/iommu/dmar.c
@@@ -1642,26 -1642,17 +1642,17 @@@ int dmar_set_interrupt(struct intel_iom
  	if (iommu->irq)
  		return 0;
  
- 	irq = dmar_alloc_hwirq();
- 	if (irq <= 0) {
+ 	irq = dmar_alloc_hwirq(iommu->seq_id, iommu->node, iommu);
+ 	if (irq > 0) {
+ 		iommu->irq = irq;
+ 	} else {
 -		pr_err("IOMMU: no free vectors\n");
 +		pr_err("No free IRQ vectors\n");
  		return -EINVAL;
  	}
  
- 	irq_set_handler_data(irq, iommu);
- 	iommu->irq = irq;
- 
- 	ret = arch_setup_dmar_msi(irq);
- 	if (ret) {
- 		irq_set_handler_data(irq, NULL);
- 		iommu->irq = 0;
- 		dmar_free_hwirq(irq);
- 		return ret;
- 	}
- 
  	ret = request_irq(irq, dmar_fault, IRQF_NO_THREAD, iommu->name, iommu);
  	if (ret)
 -		pr_err("IOMMU: can't request irq\n");
 +		pr_err("Can't request irq\n");
  	return ret;
  }
  
diff --cc drivers/iommu/intel_irq_remapping.c
index 47fcebf39e9e,80f1d1486247..000000000000
--- a/drivers/iommu/intel_irq_remapping.c
+++ b/drivers/iommu/intel_irq_remapping.c
@@@ -11,7 -8,7 +11,8 @@@
  #include <linux/irq.h>
  #include <linux/intel-iommu.h>
  #include <linux/acpi.h>
 +#include <linux/crash_dump.h>
+ #include <linux/irqdomain.h>
  #include <asm/io_apic.h>
  #include <asm/smp.h>
  #include <asm/cpu.h>
@@@ -54,63 -72,14 +76,34 @@@ static struct hpet_scope ir_hpet[MAX_HP
   * the dmar_global_lock.
   */
  static DEFINE_RAW_SPINLOCK(irq_2_ir_lock);
+ static struct irq_domain_ops intel_ir_domain_ops;
  
 +static void iommu_disable_irq_remapping(struct intel_iommu *iommu);
  static int __init parse_ioapics_under_ir(void);
  
 +static bool ir_pre_enabled(struct intel_iommu *iommu)
 +{
 +	return (iommu->flags & VTD_FLAG_IRQ_REMAP_PRE_ENABLED);
 +}
 +
 +static void clear_ir_pre_enabled(struct intel_iommu *iommu)
 +{
 +	iommu->flags &= ~VTD_FLAG_IRQ_REMAP_PRE_ENABLED;
 +}
 +
 +static void init_ir_status(struct intel_iommu *iommu)
 +{
 +	u32 gsts;
 +
 +	gsts = readl(iommu->reg + DMAR_GSTS_REG);
 +	if (gsts & DMA_GSTS_IRES)
 +		iommu->flags |= VTD_FLAG_IRQ_REMAP_PRE_ENABLED;
 +}
 +
- static struct irq_2_iommu *irq_2_iommu(unsigned int irq)
- {
- 	struct irq_cfg *cfg = irq_cfg(irq);
- 	return cfg ? &cfg->irq_2_iommu : NULL;
- }
- 
- static int get_irte(int irq, struct irte *entry)
- {
- 	struct irq_2_iommu *irq_iommu = irq_2_iommu(irq);
- 	unsigned long flags;
- 	int index;
- 
- 	if (!entry || !irq_iommu)
- 		return -1;
- 
- 	raw_spin_lock_irqsave(&irq_2_ir_lock, flags);
- 
- 	if (unlikely(!irq_iommu->iommu)) {
- 		raw_spin_unlock_irqrestore(&irq_2_ir_lock, flags);
- 		return -1;
- 	}
- 
- 	index = irq_iommu->irte_index + irq_iommu->sub_handle;
- 	*entry = *(irq_iommu->iommu->ir_table->base + index);
- 
- 	raw_spin_unlock_irqrestore(&irq_2_ir_lock, flags);
- 	return 0;
- }
- 
- static int alloc_irte(struct intel_iommu *iommu, int irq, u16 count)
+ static int alloc_irte(struct intel_iommu *iommu, int irq,
+ 		      struct irq_2_iommu *irq_iommu, u16 count)
  {
  	struct ir_table *table = iommu->ir_table;
- 	struct irq_2_iommu *irq_iommu = irq_2_iommu(irq);
- 	struct irq_cfg *cfg = irq_cfg(irq);
  	unsigned int mask = 0;
  	unsigned long flags;
  	int index;
@@@ -728,34 -569,10 +680,30 @@@ static int __init intel_prepare_irq_rem
  		if (!ecap_ir_support(iommu->ecap))
  			goto error;
  
 +	/* Detect remapping mode: lapic or x2apic */
 +	if (x2apic_supported()) {
 +		eim = !dmar_x2apic_optout();
 +		if (!eim) {
 +			pr_info("x2apic is disabled because BIOS sets x2apic opt out bit.");
 +			pr_info("Use 'intremap=no_x2apic_optout' to override the BIOS setting.\n");
 +		}
 +	}
 +
 +	for_each_iommu(iommu, drhd) {
 +		if (eim && !ecap_eim_support(iommu->ecap)) {
 +			pr_info("%s does not support EIM\n", iommu->name);
 +			eim = 0;
 +		}
 +	}
 +
 +	eim_mode = eim;
 +	if (eim)
 +		pr_info("Queued invalidation will be enabled to support x2apic and Intr-remapping.\n");
 +
- 	/* Do the initializations early */
- 	for_each_iommu(iommu, drhd) {
- 		if (intel_setup_irq_remapping(iommu)) {
- 			pr_err("Failed to setup irq remapping for %s\n",
- 			       iommu->name);
+ 	/* Do the allocations early */
+ 	for_each_iommu(iommu, drhd)
+ 		if (intel_setup_irq_remapping(iommu))
  			goto error;
- 		}
- 	}
  
  	return 0;
  
@@@ -784,16 -676,11 +752,11 @@@ static int __init intel_enable_irq_rema
  
  	irq_remapping_enabled = 1;
  
- 	/*
- 	 * VT-d has a different layout for IO-APIC entries when
- 	 * interrupt remapping is enabled. So it needs a special routine
- 	 * to print IO-APIC entries for debugging purposes too.
- 	 */
- 	x86_io_apic_ops.print_entries = intel_ir_io_apic_print_entries;
+ 	set_irq_posting_cap();
  
 -	pr_info("Enabled IRQ remapping in %s mode\n", eim ? "x2apic" : "xapic");
 +	pr_info("Enabled IRQ remapping in %s mode\n", eim_mode ? "x2apic" : "xapic");
  
 -	return eim ? IRQ_REMAP_X2APIC_MODE : IRQ_REMAP_XAPIC_MODE;
 +	return eim_mode ? IRQ_REMAP_X2APIC_MODE : IRQ_REMAP_XAPIC_MODE;
  
  error:
  	intel_cleanup_irq_remapping();
