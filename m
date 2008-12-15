From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr_cpumask tree
Date: Mon, 15 Dec 2008 17:09:45 +1100
Message-ID: <20081215170945.b91f3b9c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60429 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751020AbYLOGJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 01:09:53 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr_cpumask tree got a conflict in
arch/x86/kernel/io_apic.c between commit
3145e941fcfe2548fa2270afb1a05bab3a6bc418 ("x86, MSI: pass irq_cfg and
irq_desc") from the sparseirq tree and commit
0de26520c7cabf36e1de090ea8092f011a6106ce ("cpumask: make irq_set_affinity
() take a const struct cpumask") from the rr_cpumask tree.

There are lots of overlapping changes.  I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/io_apic.c
index 23f3141,1184210..0000000
--- a/arch/x86/kernel/io_apic.c
+++ b/arch/x86/kernel/io_apic.c
@@@ -396,48 -359,37 +396,49 @@@ static void __target_IO_APIC_irq(unsign
  	}
  }
  
 -static int assign_irq_vector(int irq, cpumask_t mask);
 +static int assign_irq_vector(int irq, struct irq_cfg *cfg, cpumask_t mask);
  
- static void set_ioapic_affinity_irq_desc(struct irq_desc *desc, cpumask_t mask)
 -static void set_ioapic_affinity_irq(unsigned int irq,
++static void set_ioapic_affinity_irq_desc(struct irq_desc *desc,
+ 				    const struct cpumask *mask)
  {
  	struct irq_cfg *cfg;
  	unsigned long flags;
  	unsigned int dest;
  	cpumask_t tmp;
 -	struct irq_desc *desc;
 +	unsigned int irq;
  
- 	cpus_and(tmp, mask, cpu_online_map);
- 	if (cpus_empty(tmp))
+ 	if (!cpumask_intersects(mask, cpu_online_mask))
  		return;
  
 -	cfg = irq_cfg(irq);
 -	if (assign_irq_vector(irq, *mask))
 +	irq = desc->irq;
 +	cfg = desc->chip_data;
- 	if (assign_irq_vector(irq, cfg, mask))
++	if (assign_irq_vector(irq, cfg, *mask))
  		return;
  
- 	set_extra_move_desc(desc, mask);
++	set_extra_move_desc(desc, *mask);
 +
- 	cpus_and(tmp, cfg->domain, mask);
+ 	cpumask_and(&tmp, &cfg->domain, mask);
  	dest = cpu_mask_to_apicid(tmp);
  	/*
  	 * Only the high 8 bits are valid.
  	 */
  	dest = SET_APIC_LOGICAL_ID(dest);
  
 -	desc = irq_to_desc(irq);
  	spin_lock_irqsave(&ioapic_lock, flags);
 -	__target_IO_APIC_irq(irq, dest, cfg->vector);
 +	__target_IO_APIC_irq(irq, dest, cfg);
- 	desc->affinity = mask;
+ 	cpumask_copy(&desc->affinity, mask);
  	spin_unlock_irqrestore(&ioapic_lock, flags);
  }
 +
- static void set_ioapic_affinity_irq(unsigned int irq, cpumask_t mask)
++static void set_ioapic_affinity_irq(unsigned int irq,
++				    const struct cpumask *mask)
 +{
 +	struct irq_desc *desc;
 +
 +	desc = irq_to_desc(irq);
 +
 +	set_ioapic_affinity_irq_desc(desc, mask);
 +}
  #endif /* CONFIG_SMP */
  
  /*
@@@ -2281,22 -2198,19 +2282,24 @@@ static void ir_irq_migration(struct wor
  /*
   * Migrates the IRQ destination in the process context.
   */
- static void set_ir_ioapic_affinity_irq_desc(struct irq_desc *desc, cpumask_t mask)
 -static void set_ir_ioapic_affinity_irq(unsigned int irq,
++static void set_ir_ioapic_affinity_irq_desc(struct irq_desc *desc,
+ 				       const struct cpumask *mask)
  {
 -	struct irq_desc *desc = irq_to_desc(irq);
 -
  	if (desc->status & IRQ_LEVEL) {
  		desc->status |= IRQ_MOVE_PENDING;
- 		desc->pending_mask = mask;
+ 		cpumask_copy(&desc->pending_mask, mask);
 -		migrate_irq_remapped_level(irq);
 +		migrate_irq_remapped_level_desc(desc);
  		return;
  	}
  
- 	migrate_ioapic_irq_desc(desc, mask);
 -	migrate_ioapic_irq(irq, *mask);
++	migrate_ioapic_irq_desc(desc, *mask);
 +}
- static void set_ir_ioapic_affinity_irq(unsigned int irq, cpumask_t mask)
++static void set_ir_ioapic_affinity_irq(unsigned int irq,
++				       const struct cpumask *mask)
 +{
 +	struct irq_desc *desc = irq_to_desc(irq);
 +
 +	set_ir_ioapic_affinity_irq_desc(desc, mask);
  }
  #endif
  
@@@ -3145,64 -3028,61 +3148,63 @@@ static int msi_compose_msg(struct pci_d
  }
  
  #ifdef CONFIG_SMP
- static void set_msi_irq_affinity(unsigned int irq, cpumask_t mask)
+ static void set_msi_irq_affinity(unsigned int irq, const struct cpumask *mask)
  {
 +	struct irq_desc *desc = irq_to_desc(irq);
  	struct irq_cfg *cfg;
  	struct msi_msg msg;
  	unsigned int dest;
  	cpumask_t tmp;
 -	struct irq_desc *desc;
  
- 	cpus_and(tmp, mask, cpu_online_map);
- 	if (cpus_empty(tmp))
+ 	if (!cpumask_intersects(mask, cpu_online_mask))
  		return;
  
 -	if (assign_irq_vector(irq, *mask))
 +	cfg = desc->chip_data;
- 	if (assign_irq_vector(irq, cfg, mask))
++	if (assign_irq_vector(irq, cfg, *mask))
  		return;
  
- 	set_extra_move_desc(desc, mask);
 -	cfg = irq_cfg(irq);
++	set_extra_move_desc(desc, *mask);
 +
- 	cpus_and(tmp, cfg->domain, mask);
+ 	cpumask_and(&tmp, &cfg->domain, mask);
  	dest = cpu_mask_to_apicid(tmp);
  
 -	read_msi_msg(irq, &msg);
 +	read_msi_msg_desc(desc, &msg);
  
  	msg.data &= ~MSI_DATA_VECTOR_MASK;
  	msg.data |= MSI_DATA_VECTOR(cfg->vector);
  	msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
  	msg.address_lo |= MSI_ADDR_DEST_ID(dest);
  
 -	write_msi_msg(irq, &msg);
 -	desc = irq_to_desc(irq);
 +	write_msi_msg_desc(desc, &msg);
- 	desc->affinity = mask;
+ 	cpumask_copy(&desc->affinity, mask);
  }
 -
  #ifdef CONFIG_INTR_REMAP
  /*
   * Migrate the MSI irq to another cpumask. This migration is
   * done in the process context using interrupt-remapping hardware.
   */
- static void ir_set_msi_irq_affinity(unsigned int irq, cpumask_t mask)
+ static void ir_set_msi_irq_affinity(unsigned int irq,
+ 				    const struct cpumask *mask)
  {
 +	struct irq_desc *desc = irq_to_desc(irq);
  	struct irq_cfg *cfg;
  	unsigned int dest;
  	cpumask_t tmp, cleanup_mask;
  	struct irte irte;
 -	struct irq_desc *desc;
  
- 	cpus_and(tmp, mask, cpu_online_map);
- 	if (cpus_empty(tmp))
+ 	if (!cpumask_intersects(mask, cpu_online_mask))
  		return;
  
  	if (get_irte(irq, &irte))
  		return;
  
 -	if (assign_irq_vector(irq, *mask))
 +	cfg = desc->chip_data;
- 	if (assign_irq_vector(irq, cfg, mask))
++	if (assign_irq_vector(irq, cfg, *mask))
  		return;
  
- 	set_extra_move_desc(desc, mask);
 -	cfg = irq_cfg(irq);
++	set_extra_move_desc(desc, *mask);
 +
- 	cpus_and(tmp, cfg->domain, mask);
+ 	cpumask_and(&tmp, &cfg->domain, mask);
  	dest = cpu_mask_to_apicid(tmp);
  
  	irte.vector = cfg->vector;
@@@ -3225,9 -3105,9 +3227,9 @@@
  		cfg->move_in_progress = 0;
  	}
  
- 	desc->affinity = mask;
 -	desc = irq_to_desc(irq);
+ 	cpumask_copy(&desc->affinity, mask);
  }
 +
  #endif
  #endif /* CONFIG_SMP */
  
@@@ -3416,25 -3308,22 +3418,24 @@@ void arch_teardown_msi_irq(unsigned in
  
  #ifdef CONFIG_DMAR
  #ifdef CONFIG_SMP
- static void dmar_msi_set_affinity(unsigned int irq, cpumask_t mask)
+ static void dmar_msi_set_affinity(unsigned int irq, const struct cpumask *mask)
  {
 +	struct irq_desc *desc = irq_to_desc(irq);
  	struct irq_cfg *cfg;
  	struct msi_msg msg;
  	unsigned int dest;
  	cpumask_t tmp;
 -	struct irq_desc *desc;
  
- 	cpus_and(tmp, mask, cpu_online_map);
- 	if (cpus_empty(tmp))
+ 	if (!cpumask_intersects(mask, cpu_online_mask))
  		return;
  
 -	if (assign_irq_vector(irq, *mask))
 +	cfg = desc->chip_data;
- 	if (assign_irq_vector(irq, cfg, mask))
++	if (assign_irq_vector(irq, cfg, *mask))
  		return;
  
- 	set_extra_move_desc(desc, mask);
 -	cfg = irq_cfg(irq);
++	set_extra_move_desc(desc, *mask);
 +
- 	cpus_and(tmp, cfg->domain, mask);
+ 	cpumask_and(&tmp, &cfg->domain, mask);
  	dest = cpu_mask_to_apicid(tmp);
  
  	dmar_msi_read(irq, &msg);
@@@ -3445,9 -3334,9 +3446,9 @@@
  	msg.address_lo |= MSI_ADDR_DEST_ID(dest);
  
  	dmar_msi_write(irq, &msg);
- 	desc->affinity = mask;
 -	desc = irq_to_desc(irq);
+ 	cpumask_copy(&desc->affinity, mask);
  }
 +
  #endif /* CONFIG_SMP */
  
  struct irq_chip dmar_msi_type = {
@@@ -3479,25 -3368,22 +3480,24 @@@ int arch_setup_dmar_msi(unsigned int ir
  #ifdef CONFIG_HPET_TIMER
  
  #ifdef CONFIG_SMP
- static void hpet_msi_set_affinity(unsigned int irq, cpumask_t mask)
+ static void hpet_msi_set_affinity(unsigned int irq, const struct cpumask *mask)
  {
 +	struct irq_desc *desc = irq_to_desc(irq);
  	struct irq_cfg *cfg;
 -	struct irq_desc *desc;
  	struct msi_msg msg;
  	unsigned int dest;
  	cpumask_t tmp;
  
- 	cpus_and(tmp, mask, cpu_online_map);
- 	if (cpus_empty(tmp))
+ 	if (!cpumask_intersects(mask, cpu_online_mask))
  		return;
  
 -	if (assign_irq_vector(irq, *mask))
 +	cfg = desc->chip_data;
- 	if (assign_irq_vector(irq, cfg, mask))
++	if (assign_irq_vector(irq, cfg, *mask))
  		return;
  
- 	set_extra_move_desc(desc, mask);
 -	cfg = irq_cfg(irq);
++	set_extra_move_desc(desc, *mask);
 +
- 	cpus_and(tmp, cfg->domain, mask);
+ 	cpumask_and(&tmp, &cfg->domain, mask);
  	dest = cpu_mask_to_apicid(tmp);
  
  	hpet_msi_read(irq, &msg);
@@@ -3508,9 -3394,9 +3508,9 @@@
  	msg.address_lo |= MSI_ADDR_DEST_ID(dest);
  
  	hpet_msi_write(irq, &msg);
- 	desc->affinity = mask;
 -	desc = irq_to_desc(irq);
+ 	cpumask_copy(&desc->affinity, mask);
  }
 +
  #endif /* CONFIG_SMP */
  
  struct irq_chip hpet_msi_type = {
@@@ -3563,30 -3449,27 +3563,29 @@@ static void target_ht_irq(unsigned int 
  	write_ht_irq_msg(irq, &msg);
  }
  
- static void set_ht_irq_affinity(unsigned int irq, cpumask_t mask)
+ static void set_ht_irq_affinity(unsigned int irq, const struct cpumask *mask)
  {
 +	struct irq_desc *desc = irq_to_desc(irq);
  	struct irq_cfg *cfg;
  	unsigned int dest;
  	cpumask_t tmp;
 -	struct irq_desc *desc;
  
- 	cpus_and(tmp, mask, cpu_online_map);
- 	if (cpus_empty(tmp))
+ 	if (!cpumask_intersects(mask, cpu_online_mask))
  		return;
  
 -	if (assign_irq_vector(irq, *mask))
 +	cfg = desc->chip_data;
- 	if (assign_irq_vector(irq, cfg, mask))
++	if (assign_irq_vector(irq, cfg, *mask))
  		return;
  
- 	set_extra_move_desc(desc, mask);
 -	cfg = irq_cfg(irq);
++	set_extra_move_desc(desc, *mask);
 +
- 	cpus_and(tmp, cfg->domain, mask);
+ 	cpumask_and(&tmp, &cfg->domain, mask);
  	dest = cpu_mask_to_apicid(tmp);
  
  	target_ht_irq(irq, dest, cfg->vector);
- 	desc->affinity = mask;
 -	desc = irq_to_desc(irq);
+ 	cpumask_copy(&desc->affinity, mask);
  }
 +
  #endif
  
  static struct irq_chip ht_irq_chip = {
@@@ -3927,10 -3791,10 +3926,10 @@@ void __init setup_ioapic_dest(void
  
  #ifdef CONFIG_INTR_REMAP
  			if (intr_remapping_enabled)
- 				set_ir_ioapic_affinity_irq_desc(desc, mask);
 -				set_ir_ioapic_affinity_irq(irq, &mask);
++				set_ir_ioapic_affinity_irq_desc(desc, &mask);
  			else
  #endif
- 				set_ioapic_affinity_irq_desc(desc, mask);
 -				set_ioapic_affinity_irq(irq, &mask);
++				set_ioapic_affinity_irq_desc(desc, &mask);
  		}
  
  	}
