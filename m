From: Christoffer Dall <cdall@cs.columbia.edu>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the arm64 tree
Date: Fri, 23 Jan 2015 12:53:19 +0100
Message-ID: <20150123115319.GL15076@cbox>
References: <20150122160704.5ad5aeb9@canb.auug.org.au>
 <87r3unfb9x.fsf@approximate.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:43030 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753274AbbAWLxS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jan 2015 06:53:18 -0500
Received: by mail-lb0-f171.google.com with SMTP id u14so6601213lbd.2
        for <linux-next@vger.kernel.org>; Fri, 23 Jan 2015 03:53:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <87r3unfb9x.fsf@approximate.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Wei Huang <wei@redhat.com>

On Thu, Jan 22, 2015 at 08:51:54AM +0000, Marc Zyngier wrote:
> On Thu, Jan 22 2015 at  5:07:04 am GMT, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> Hi Stephen,
> 
> > Today's linux-next merge of the kvm-arm tree got a conflict in
> > arch/arm64/include/asm/kvm_arm.h between commit 6e53031ed840 ("arm64:
> > kvm: remove ESR_EL2_* macros") from the arm64 tree and commit
> > 0d97f8848104 ("arm/arm64: KVM: add tracing support for arm64 exit
> > handler") from the kvm-arm tree.
> >
> > I fixed it up (see below, but this probably requires more work) and can
> > carry the fix as necessary (no action is required).
> 
> Thanks for dealing with this. I think the following patch should be
> applied on top of your resolution, making the new macro part of the
> asm/esr.h file.
> 
> Mark, Wei: does it match your expectations?
> 
> Thanks,
> 
> 	M.
> 
> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> index 6216709..92bbae3 100644
> --- a/arch/arm64/include/asm/esr.h
> +++ b/arch/arm64/include/asm/esr.h
> @@ -96,6 +96,7 @@
>  #define ESR_ELx_COND_SHIFT	(20)
>  #define ESR_ELx_COND_MASK	(UL(0xF) << ESR_ELx_COND_SHIFT)
>  #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
> +#define ESR_ELx_xVC_IMM_MASK	((1UL << 16) - 1)
>  
>  #ifndef __ASSEMBLY__
>  #include <asm/types.h>
> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
> index 53fbc1e..94674eb 100644
> --- a/arch/arm64/include/asm/kvm_arm.h
> +++ b/arch/arm64/include/asm/kvm_arm.h
> @@ -192,6 +192,4 @@
>  /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
>  #define HPFAR_MASK	(~UL(0xf))
>  
> -#define ESR_EL2_HVC_IMM_MASK	((1UL << 16) - 1)
> -
>  #endif /* __ARM64_KVM_ARM_H__ */
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index b861ff6..bbc17cd 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -133,7 +133,7 @@ static inline phys_addr_t kvm_vcpu_get_fault_ipa(const struct kvm_vcpu *vcpu)
>  
>  static inline u32 kvm_vcpu_hvc_get_imm(const struct kvm_vcpu *vcpu)
>  {
> -	return kvm_vcpu_get_hsr(vcpu) & ESR_EL2_HVC_IMM_MASK;
> +	return kvm_vcpu_get_hsr(vcpu) & ESR_ELx_xVC_IMM_MASK;
>  }
>  
>  static inline bool kvm_vcpu_dabt_isvalid(const struct kvm_vcpu *vcpu)
> 

This looks good to me too, I'll sync with Paolo on how to get this
upstream.

-Christoffer
