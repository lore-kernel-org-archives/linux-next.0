From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the mips tree
Date: Mon, 4 Sep 2017 14:19:00 +1000
Message-ID: <20170904141900.7ec5955d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753697AbdIDETC (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 4 Sep 2017 00:19:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@imgtec.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Paul Burton <paul.burton@imgtec.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/irqchip/irq-mips-gic.c

between commit:

  ac04be51a650 ("irqchip: mips-gic: Remove gic_map_to_vpe()")
  b6e583e41993 ("irqchip: mips-gic: Make pcpu_masks a per-cpu variable")
  6ab4fb2810db ("irqchip: mips-gic: Use pcpu_masks to avoid reading GIC_SH_MASK*")
  0429ecf6a6b4 ("irqchip: mips-gic: Use cpumask_first_and() in gic_set_affinity()")
  69aa0cbafce1 ("irqchip: mips-gic: Let the core set struct irq_common_data affinity")

from the mips tree and commit:

  18416e45b761 ("irqchip/mips-gic: Report that effective affinity is a single target")

from the tip tree.

I fixed it up (I think - see below, and please check result) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/irqchip/irq-mips-gic.c
index 7187af1bea03,6461380ff1a4..000000000000
--- a/drivers/irqchip/irq-mips-gic.c
+++ b/drivers/irqchip/irq-mips-gic.c
@@@ -261,16 -457,18 +261,17 @@@ static int gic_set_affinity(struct irq_
  	spin_lock_irqsave(&gic_lock, flags);
  
  	/* Re-route this IRQ */
 -	gic_map_to_vpe(irq, mips_cm_vp_id(cpu));
 +	write_gic_map_vp(irq, BIT(mips_cm_vp_id(cpu)));
  
  	/* Update the pcpu_masks */
 -	for (i = 0; i < min(gic_vpes, NR_CPUS); i++)
 -		clear_bit(irq, pcpu_masks[i].pcpu_mask);
 -	set_bit(irq, pcpu_masks[cpu].pcpu_mask);
 +	gic_clear_pcpu_masks(irq);
 +	if (read_gic_mask(irq))
 +		set_bit(irq, per_cpu_ptr(pcpu_masks, cpu));
  
 -	cpumask_copy(irq_data_get_affinity_mask(d), cpumask);
+ 	irq_data_update_effective_affinity(d, cpumask_of(cpu));
  	spin_unlock_irqrestore(&gic_lock, flags);
  
 -	return IRQ_SET_MASK_OK_NOCOPY;
 +	return IRQ_SET_MASK_OK;
  }
  #endif
  
