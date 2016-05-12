From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Thu, 12 May 2016 12:00:59 +1000
Message-ID: <20160512120059.61f526a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58057 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751605AbcELCBB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 May 2016 22:01:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Jon Hunter <jonathanh@nvidia.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/irqchip/irq-gic.c

between commit:

  25fc11aead38 ("irqchip/gic: Restore CPU interface checking")

from the arm64 tree and commit:

  dc9722cc57eb ("irqchip/gic: Return an error if GIC initialisation fails")
  f673b9b5cb54 ("irqchip/gic: Store GIC configuration parameters")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/irqchip/irq-gic.c
index 095bb5b5c3f2,113e2d02c812..000000000000
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@@ -489,8 -486,9 +486,10 @@@ static int gic_cpu_init(struct gic_chip
  		/*
  		 * Get what the GIC says our CPU mask is.
  		 */
- 		BUG_ON(cpu >= NR_GIC_CPU_IF);
+ 		if (WARN_ON(cpu >= NR_GIC_CPU_IF))
+ 			return -EINVAL;
+ 
 +		gic_check_cpu_features();
  		cpu_mask = gic_get_cpumask(gic);
  		gic_cpu_map[cpu] = cpu_mask;
  
@@@ -1012,24 -1029,28 +1030,26 @@@ static const struct irq_domain_ops gic_
  	.unmap = gic_irq_domain_unmap,
  };
  
- static void __init __gic_init_bases(unsigned int gic_nr, int irq_start,
- 			   void __iomem *dist_base, void __iomem *cpu_base,
- 			   u32 percpu_offset, struct fwnode_handle *handle)
+ static int __init __gic_init_bases(struct gic_chip_data *gic, int irq_start,
+ 				   struct fwnode_handle *handle)
  {
  	irq_hw_number_t hwirq_base;
- 	struct gic_chip_data *gic;
- 	int gic_irqs, irq_base, i;
- 
- 	BUG_ON(gic_nr >= CONFIG_ARM_GIC_MAX_NR);
+ 	int gic_irqs, irq_base, i, ret;
  
- 	gic = &gic_data[gic_nr];
+ 	if (WARN_ON(!gic || gic->domain))
+ 		return -EINVAL;
  
 -	gic_check_cpu_features();
 -
  	/* Initialize irq_chip */
- 	if (static_key_true(&supports_deactivate) && gic_nr == 0) {
- 		gic->chip = gic_eoimode1_chip;
+ 	gic->chip = gic_chip;
+ 
+ 	if (static_key_true(&supports_deactivate) && gic == &gic_data[0]) {
+ 		gic->chip.irq_mask = gic_eoimode1_mask_irq;
+ 		gic->chip.irq_eoi = gic_eoimode1_eoi_irq;
+ 		gic->chip.irq_set_vcpu_affinity = gic_irq_set_vcpu_affinity;
+ 		gic->chip.name = kasprintf(GFP_KERNEL, "GICv2");
  	} else {
- 		gic->chip = gic_chip;
- 		gic->chip.name = kasprintf(GFP_KERNEL, "GIC-%d", gic_nr);
+ 		gic->chip.name = kasprintf(GFP_KERNEL, "GIC-%d",
+ 					   (int)(gic - &gic_data[0]));
  	}
  
  #ifdef CONFIG_SMP
