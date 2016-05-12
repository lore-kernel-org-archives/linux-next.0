From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the tip tree
Date: Thu, 12 May 2016 12:54:06 +1000
Message-ID: <20160512125406.076ff089@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43869 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751530AbcELCyJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 May 2016 22:54:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Julien Grall <julien.grall@arm.com>, Christoffer Dall <christoffer.dall@linaro.org>, Jon Hunter <jonathanh@nvidia.com>, Marc Zyngier <marc.zyngier@arm.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  drivers/irqchip/irq-gic.c

between commits:

  dc9722cc57eb ("irqchip/gic: Return an error if GIC initialisation fails")
  f673b9b5cb54 ("irqchip/gic: Store GIC configuration parameters")
  d6490461a102 ("irqchip/gic: Add helper functions for GIC setup and teardown")

from the tip tree and commits:

  bafa9193d00c ("irqchip/gic-v2: Gather ACPI specific data in a single structure")
  502d6df11ae3 ("irqchip/gic-v2: Parse and export virtual GIC information")

from the kvm tree.

I fixed it up (hopefully - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/irqchip/irq-gic.c
index 1de20e14a721,3f1d9fd3a462..000000000000
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@@ -1248,30 -1191,29 +1250,53 @@@ static bool gic_check_eoimode(struct de
  	return true;
  }
  
 +static int gic_of_setup(struct gic_chip_data *gic, struct device_node *node)
 +{
 +	if (!gic || !node)
 +		return -EINVAL;
 +
 +	gic->raw_dist_base = of_iomap(node, 0);
 +	if (WARN(!gic->raw_dist_base, "unable to map gic dist registers\n"))
 +		goto error;
 +
 +	gic->raw_cpu_base = of_iomap(node, 1);
 +	if (WARN(!gic->raw_cpu_base, "unable to map gic cpu registers\n"))
 +		goto error;
 +
 +	if (of_property_read_u32(node, "cpu-offset", &gic->percpu_offset))
 +		gic->percpu_offset = 0;
 +
 +	return 0;
 +
 +error:
 +	gic_teardown(gic);
 +
 +	return -ENOMEM;
 +}
 +
+ static void __init gic_of_setup_kvm_info(struct device_node *node)
+ {
+ 	int ret;
+ 	struct resource *vctrl_res = &gic_v2_kvm_info.vctrl;
+ 	struct resource *vcpu_res = &gic_v2_kvm_info.vcpu;
+ 
+ 	gic_v2_kvm_info.type = GIC_V2;
+ 
+ 	gic_v2_kvm_info.maint_irq = irq_of_parse_and_map(node, 0);
+ 	if (!gic_v2_kvm_info.maint_irq)
+ 		return;
+ 
+ 	ret = of_address_to_resource(node, 2, vctrl_res);
+ 	if (ret)
+ 		return;
+ 
+ 	ret = of_address_to_resource(node, 3, vcpu_res);
+ 	if (ret)
+ 		return;
+ 
+ 	gic_set_kvm_info(&gic_v2_kvm_info);
+ }
+ 
  int __init
  gic_of_init(struct device_node *node, struct device_node *parent)
  {
@@@ -1294,17 -1235,18 +1319,19 @@@
  	 * Disable split EOI/Deactivate if either HYP is not available
  	 * or the CPU interface is too small.
  	 */
 -	if (gic_cnt == 0 && !gic_check_eoimode(node, &cpu_base))
 +	if (gic_cnt == 0 && !gic_check_eoimode(node, &gic->raw_cpu_base))
  		static_key_slow_dec(&supports_deactivate);
  
 -	if (of_property_read_u32(node, "cpu-offset", &percpu_offset))
 -		percpu_offset = 0;
 +	ret = __gic_init_bases(gic, -1, &node->fwnode);
 +	if (ret) {
 +		gic_teardown(gic);
 +		return ret;
 +	}
  
- 	if (!gic_cnt)
 -	__gic_init_bases(gic_cnt, -1, dist_base, cpu_base, percpu_offset,
 -			 &node->fwnode);
+ 	if (!gic_cnt) {
  		gic_init_physaddr(node);
+ 		gic_of_setup_kvm_info(node);
+ 	}
  
  	if (parent) {
  		irq = irq_of_parse_and_map(node, 0);
@@@ -1401,8 -1391,8 +1476,8 @@@ static int __init gic_v2_acpi_init(stru
  		return -EINVAL;
  	}
  
- 	gic->raw_cpu_base = ioremap(cpu_phy_base, ACPI_GIC_CPU_IF_MEM_SIZE);
 -	cpu_base = ioremap(acpi_data.cpu_phys_base, ACPI_GIC_CPU_IF_MEM_SIZE);
 -	if (!cpu_base) {
++	gic->raw_cpu_base = ioremap(acpi_data.cpu_phys_base, ACPI_GIC_CPU_IF_MEM_SIZE);
 +	if (!gic->raw_cpu_base) {
  		pr_err("Unable to map GICC registers\n");
  		return -ENOMEM;
  	}
