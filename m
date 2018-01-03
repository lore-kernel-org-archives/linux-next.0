From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Wed, 3 Jan 2018 13:38:04 +1100
Message-ID: <20180103133804.441cd1e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33401 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750997AbeACCiG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Jan 2018 21:38:06 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  virt/kvm/arm/arch_timer.c

between commit:

  36e5cfd410ad ("KVM: arm/arm64: Properly handle arch-timer IRQs after vtimer_save_state")

from Linus' tree and commit:

  70450a9fbe06 ("KVM: arm/arm64: Don't cache the timer IRQ level")

from the kvm-arm tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc virt/kvm/arm/arch_timer.c
index cc29a8148328,cfcd0323deab..000000000000
--- a/virt/kvm/arm/arch_timer.c
+++ b/virt/kvm/arm/arch_timer.c
@@@ -92,27 -92,19 +92,26 @@@ static irqreturn_t kvm_arch_timer_handl
  {
  	struct kvm_vcpu *vcpu = *(struct kvm_vcpu **)dev_id;
  	struct arch_timer_context *vtimer;
 +	u32 cnt_ctl;
  
 -	if (!vcpu) {
 -		pr_warn_once("Spurious arch timer IRQ on non-VCPU thread\n");
 -		return IRQ_NONE;
 -	}
 -	vtimer = vcpu_vtimer(vcpu);
 +	/*
 +	 * We may see a timer interrupt after vcpu_put() has been called which
 +	 * sets the CPU's vcpu pointer to NULL, because even though the timer
 +	 * has been disabled in vtimer_save_state(), the hardware interrupt
 +	 * signal may not have been retired from the interrupt controller yet.
 +	 */
 +	if (!vcpu)
 +		return IRQ_HANDLED;
  
 -	vtimer->cnt_ctl = read_sysreg_el0(cntv_ctl);
 -	if (kvm_timer_irq_can_fire(vtimer))
 +	vtimer = vcpu_vtimer(vcpu);
- 	if (!vtimer->irq.level) {
- 		cnt_ctl = read_sysreg_el0(cntv_ctl);
- 		cnt_ctl &= ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT |
- 			   ARCH_TIMER_CTRL_IT_MASK;
- 		if (cnt_ctl == (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
- 			kvm_timer_update_irq(vcpu, true, vtimer);
- 	}
- 
- 	if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
++	cnt_ctl = read_sysreg_el0(cntv_ctl);
++	cnt_ctl &= ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT |
++		   ARCH_TIMER_CTRL_IT_MASK;
++	if (cnt_ctl == (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
+ 		kvm_timer_update_irq(vcpu, true, vtimer);
+ 
+ 	if (static_branch_unlikely(&userspace_irqchip_in_use) &&
+ 	    unlikely(!irqchip_in_kernel(vcpu->kvm)))
  		kvm_vtimer_update_mask_user(vcpu);
  
  	return IRQ_HANDLED;
