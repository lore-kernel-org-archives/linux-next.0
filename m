From: Christoffer Dall <cdall@kernel.org>
Subject: Re: linux-next: manual merge of the kvm-arm tree with Linus' tree
Date: Wed, 3 Jan 2018 10:50:57 +0100
Message-ID: <CAEDV+gJDjHNtHSoefFpcTLt0H+B2na5hFTWyvdAkq8b3D_c=oQ@mail.gmail.com>
References: <20180103133804.441cd1e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:44447 "EHLO
        mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751862AbeACJu7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jan 2018 04:50:59 -0500
Received: by mail-oi0-f51.google.com with SMTP id g6so629044oib.11
        for <linux-next@vger.kernel.org>; Wed, 03 Jan 2018 01:50:58 -0800 (PST)
In-Reply-To: <20180103133804.441cd1e1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>

Thanks Stephen,

On Wed, Jan 3, 2018 at 3:38 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the kvm-arm tree got a conflict in:
>
>   virt/kvm/arm/arch_timer.c
>
> between commit:
>
>   36e5cfd410ad ("KVM: arm/arm64: Properly handle arch-timer IRQs after vtimer_save_state")
>
> from Linus' tree and commit:
>
>   70450a9fbe06 ("KVM: arm/arm64: Don't cache the timer IRQ level")
>
> from the kvm-arm tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary.
> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The resolution looks correct to me.

cc'ing the KVM maintainers in case they want to merge kvm/master into
kvm/next to avoid the conflict going up to Linus.

Thanks,
-Christoffer

>
> diff --cc virt/kvm/arm/arch_timer.c
> index cc29a8148328,cfcd0323deab..000000000000
> --- a/virt/kvm/arm/arch_timer.c
> +++ b/virt/kvm/arm/arch_timer.c
> @@@ -92,27 -92,19 +92,26 @@@ static irqreturn_t kvm_arch_timer_handl
>   {
>         struct kvm_vcpu *vcpu = *(struct kvm_vcpu **)dev_id;
>         struct arch_timer_context *vtimer;
>  +      u32 cnt_ctl;
>
>  -      if (!vcpu) {
>  -              pr_warn_once("Spurious arch timer IRQ on non-VCPU thread\n");
>  -              return IRQ_NONE;
>  -      }
>  -      vtimer = vcpu_vtimer(vcpu);
>  +      /*
>  +       * We may see a timer interrupt after vcpu_put() has been called which
>  +       * sets the CPU's vcpu pointer to NULL, because even though the timer
>  +       * has been disabled in vtimer_save_state(), the hardware interrupt
>  +       * signal may not have been retired from the interrupt controller yet.
>  +       */
>  +      if (!vcpu)
>  +              return IRQ_HANDLED;
>
>  -      vtimer->cnt_ctl = read_sysreg_el0(cntv_ctl);
>  -      if (kvm_timer_irq_can_fire(vtimer))
>  +      vtimer = vcpu_vtimer(vcpu);
> -       if (!vtimer->irq.level) {
> -               cnt_ctl = read_sysreg_el0(cntv_ctl);
> -               cnt_ctl &= ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT |
> -                          ARCH_TIMER_CTRL_IT_MASK;
> -               if (cnt_ctl == (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
> -                       kvm_timer_update_irq(vcpu, true, vtimer);
> -       }
> -
> -       if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
> ++      cnt_ctl = read_sysreg_el0(cntv_ctl);
> ++      cnt_ctl &= ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT |
> ++                 ARCH_TIMER_CTRL_IT_MASK;
> ++      if (cnt_ctl == (ARCH_TIMER_CTRL_ENABLE | ARCH_TIMER_CTRL_IT_STAT))
> +               kvm_timer_update_irq(vcpu, true, vtimer);
> +
> +       if (static_branch_unlikely(&userspace_irqchip_in_use) &&
> +           unlikely(!irqchip_in_kernel(vcpu->kvm)))
>                 kvm_vtimer_update_mask_user(vcpu);
>
>         return IRQ_HANDLED;
