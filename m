From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the tip tree
Date: Wed, 4 May 2016 13:49:18 +1000
Message-ID: <20160504134918.11edacf7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53358 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757004AbcEDDtU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 3 May 2016 23:49:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, Julien Grall <julien.grall@arm.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  drivers/irqchip/irq-gic-v3.c

between commit:

  e3825ba1af3a ("irqchip/gic-v3: Add support for partitioned PPIs")

from the tip tree and commit:

  1839e576968f ("irqchip/gic-v3: Parse and export virtual GIC information")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/irqchip/irq-gic-v3.c
index f83e5f4ec701,05a856073714..000000000000
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@@ -28,8 -30,8 +30,9 @@@
  #include <linux/slab.h>
  
  #include <linux/irqchip.h>
+ #include <linux/irqchip/arm-gic-common.h>
  #include <linux/irqchip/arm-gic-v3.h>
 +#include <linux/irqchip/irq-partition-percpu.h>
  
  #include <asm/cputype.h>
  #include <asm/exception.h>
@@@ -957,119 -906,30 +962,143 @@@ static int __init gic_validate_dist_ver
  	return 0;
  }
  
 +static int get_cpu_number(struct device_node *dn)
 +{
 +	const __be32 *cell;
 +	u64 hwid;
 +	int i;
 +
 +	cell = of_get_property(dn, "reg", NULL);
 +	if (!cell)
 +		return -1;
 +
 +	hwid = of_read_number(cell, of_n_addr_cells(dn));
 +
 +	/*
 +	 * Non affinity bits must be set to 0 in the DT
 +	 */
 +	if (hwid & ~MPIDR_HWID_BITMASK)
 +		return -1;
 +
 +	for (i = 0; i < num_possible_cpus(); i++)
 +		if (cpu_logical_map(i) == hwid)
 +			return i;
 +
 +	return -1;
 +}
 +
 +/* Create all possible partitions at boot time */
 +static void gic_populate_ppi_partitions(struct device_node *gic_node)
 +{
 +	struct device_node *parts_node, *child_part;
 +	int part_idx = 0, i;
 +	int nr_parts;
 +	struct partition_affinity *parts;
 +
 +	parts_node = of_find_node_by_name(gic_node, "ppi-partitions");
 +	if (!parts_node)
 +		return;
 +
 +	nr_parts = of_get_child_count(parts_node);
 +
 +	if (!nr_parts)
 +		return;
 +
 +	parts = kzalloc(sizeof(*parts) * nr_parts, GFP_KERNEL);
 +	if (WARN_ON(!parts))
 +		return;
 +
 +	for_each_child_of_node(parts_node, child_part) {
 +		struct partition_affinity *part;
 +		int n;
 +
 +		part = &parts[part_idx];
 +
 +		part->partition_id = of_node_to_fwnode(child_part);
 +
 +		pr_info("GIC: PPI partition %s[%d] { ",
 +			child_part->name, part_idx);
 +
 +		n = of_property_count_elems_of_size(child_part, "affinity",
 +						    sizeof(u32));
 +		WARN_ON(n <= 0);
 +
 +		for (i = 0; i < n; i++) {
 +			int err, cpu;
 +			u32 cpu_phandle;
 +			struct device_node *cpu_node;
 +
 +			err = of_property_read_u32_index(child_part, "affinity",
 +							 i, &cpu_phandle);
 +			if (WARN_ON(err))
 +				continue;
 +
 +			cpu_node = of_find_node_by_phandle(cpu_phandle);
 +			if (WARN_ON(!cpu_node))
 +				continue;
 +
 +			cpu = get_cpu_number(cpu_node);
 +			if (WARN_ON(cpu == -1))
 +				continue;
 +
 +			pr_cont("%s[%d] ", cpu_node->full_name, cpu);
 +
 +			cpumask_set_cpu(cpu, &part->mask);
 +		}
 +
 +		pr_cont("}\n");
 +		part_idx++;
 +	}
 +
 +	for (i = 0; i < 16; i++) {
 +		unsigned int irq;
 +		struct partition_desc *desc;
 +		struct irq_fwspec ppi_fwspec = {
 +			.fwnode		= gic_data.fwnode,
 +			.param_count	= 3,
 +			.param		= {
 +				[0]	= 1,
 +				[1]	= i,
 +				[2]	= IRQ_TYPE_NONE,
 +			},
 +		};
 +
 +		irq = irq_create_fwspec_mapping(&ppi_fwspec);
 +		if (WARN_ON(!irq))
 +			continue;
 +		desc = partition_create_desc(gic_data.fwnode, parts, nr_parts,
 +					     irq, &partition_domain_ops);
 +		if (WARN_ON(!desc))
 +			continue;
 +
 +		gic_data.ppi_descs[i] = desc;
 +	}
 +}
 +
+ static void __init gic_of_setup_kvm_info(struct device_node *node)
+ {
+ 	int ret;
+ 	struct resource r;
+ 	u32 gicv_idx;
+ 
+ 	gic_v3_kvm_info.type = GIC_V3;
+ 
+ 	gic_v3_kvm_info.maint_irq = irq_of_parse_and_map(node, 0);
+ 	if (!gic_v3_kvm_info.maint_irq)
+ 		return;
+ 
+ 	if (of_property_read_u32(node, "#redistributor-regions",
+ 				 &gicv_idx))
+ 		gicv_idx = 1;
+ 
+ 	gicv_idx += 3;	/* Also skip GICD, GICC, GICH */
+ 	ret = of_address_to_resource(node, gicv_idx, &r);
+ 	if (!ret)
+ 		gic_v3_kvm_info.vcpu = r;
+ 
+ 	gic_set_kvm_info(&gic_v3_kvm_info);
+ }
+ 
  static int __init gic_of_init(struct device_node *node, struct device_node *parent)
  {
  	void __iomem *dist_base;
@@@ -1121,11 -981,10 +1150,12 @@@
  
  	err = gic_init_bases(dist_base, rdist_regs, nr_redist_regions,
  			     redist_stride, &node->fwnode);
 -	if (!err) {
 -		gic_of_setup_kvm_info(node);
 -		return 0;
 -	}
 +	if (err)
 +		goto out_unmap_rdist;
 +
 +	gic_populate_ppi_partitions(node);
++	gic_of_setup_kvm_info(node);
 +	return 0;
  
  out_unmap_rdist:
  	for (i = 0; i < nr_redist_regions; i++)
