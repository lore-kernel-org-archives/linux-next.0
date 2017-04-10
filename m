From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Mon, 10 Apr 2017 14:02:08 +1000
Message-ID: <20170410140208.058f9938@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56521 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750711AbdDJECL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Apr 2017 00:02:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Today's linux-next merge of the kvm-arm tree got conflicts in:

  virt/kvm/arm/vgic/vgic-v2.c
  virt/kvm/arm/vgic/vgic.h

between commit:

  5b0d2cc28058 ("KVM: arm64: Ensure LRs are clear when they should be")

from Linus' tree and commits:

  328e56647944 ("KVM: arm/arm64: vgic: Defer touching GICH_VMCR to vcpu_load/put")
  af0614991ab6 ("KVM: arm/arm64: vgic: Get rid of unnecessary process_maintenance operation")

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

diff --cc virt/kvm/arm/vgic/vgic-v2.c
index b637d9c7afe3,025b57d5787e..000000000000
--- a/virt/kvm/arm/vgic/vgic-v2.c
+++ b/virt/kvm/arm/vgic/vgic-v2.c
@@@ -22,36 -22,7 +22,22 @@@
  
  #include "vgic.h"
  
- /*
-  * Call this function to convert a u64 value to an unsigned long * bitmask
-  * in a way that works on both 32-bit and 64-bit LE and BE platforms.
-  *
-  * Warning: Calling this function may modify *val.
-  */
- static unsigned long *u64_to_bitmask(u64 *val)
- {
- #if defined(CONFIG_CPU_BIG_ENDIAN) && BITS_PER_LONG == 32
- 	*val = (*val >> 32) | (*val << 32);
- #endif
- 	return (unsigned long *)val;
- }
- 
 +static inline void vgic_v2_write_lr(int lr, u32 val)
 +{
 +	void __iomem *base = kvm_vgic_global_state.vctrl_base;
 +
 +	writel_relaxed(val, base + GICH_LR0 + (lr * 4));
 +}
 +
 +void vgic_v2_init_lrs(void)
 +{
 +	int i;
 +
 +	for (i = 0; i < kvm_vgic_global_state.nr_lr; i++)
 +		vgic_v2_write_lr(i, 0);
 +}
 +
- void vgic_v2_process_maintenance(struct kvm_vcpu *vcpu)
+ void vgic_v2_set_underflow(struct kvm_vcpu *vcpu)
  {
  	struct vgic_v2_cpu_if *cpuif = &vcpu->arch.vgic_cpu.vgic_v2;
  
@@@ -206,10 -160,10 +175,10 @@@ void vgic_v2_set_vmcr(struct kvm_vcpu *
  		GICH_VMCR_ALIAS_BINPOINT_MASK;
  	vmcr |= (vmcrp->bpr << GICH_VMCR_BINPOINT_SHIFT) &
  		GICH_VMCR_BINPOINT_MASK;
 -	vmcr |= (vmcrp->pmr << GICH_VMCR_PRIMASK_SHIFT) &
 -		GICH_VMCR_PRIMASK_MASK;
 +	vmcr |= ((vmcrp->pmr >> GICV_PMR_PRIORITY_SHIFT) <<
 +		 GICH_VMCR_PRIMASK_SHIFT) & GICH_VMCR_PRIMASK_MASK;
  
- 	vcpu->arch.vgic_cpu.vgic_v2.vgic_vmcr = vmcr;
+ 	cpu_if->vgic_vmcr = vmcr;
  }
  
  void vgic_v2_get_vmcr(struct kvm_vcpu *vcpu, struct vgic_vmcr *vmcrp)
diff --cc virt/kvm/arm/vgic/vgic.h
index 6cf557e9f718,44445dac0835..000000000000
--- a/virt/kvm/arm/vgic/vgic.h
+++ b/virt/kvm/arm/vgic/vgic.h
@@@ -137,7 -129,8 +136,9 @@@ int vgic_v2_map_resources(struct kvm *k
  int vgic_register_dist_iodev(struct kvm *kvm, gpa_t dist_base_address,
  			     enum vgic_type);
  
 +void vgic_v2_init_lrs(void);
+ void vgic_v2_load(struct kvm_vcpu *vcpu);
+ void vgic_v2_put(struct kvm_vcpu *vcpu);
  
  static inline void vgic_get_irq_kref(struct vgic_irq *irq)
  {
