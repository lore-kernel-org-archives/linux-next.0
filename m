From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 25 Aug 2017 22:05:33 +0200
Message-ID: <2b021bf3-9ace-8678-0793-c0048500469c@redhat.com>
References: <20170825143930.494744fe@canb.auug.org.au>
 <2984689e-ab4e-0c22-7151-adfeeffce4ed@redhat.com>
 <dd8be323-8ffb-bab5-0431-f77e48fd5df1@amd.com>
 <a71c9dbd-ec32-8bb6-9d36-c138d9b4f001@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a71c9dbd-ec32-8bb6-9d36-c138d9b4f001@amd.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Brijesh Singh <brijesh.singh@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, paolo.bonzini@gmail.com
List-Id: linux-next.vger.kernel.org

On 25/08/2017 18:53, Brijesh Singh wrote:
>>
> 
> Thanks for the tip, I have expanded the patch to cover tdp cases and
> have verified
> that it works fine with SME enabled KVM. If you are okay with this then
> I can
> send patch.
> 
> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> index ccb70b8..7a8edc0 100644
> --- a/arch/x86/kvm/mmu.c
> +++ b/arch/x86/kvm/mmu.c
> @@ -4109,16 +4109,30 @@ void
>  reset_shadow_zero_bits_mask(struct kvm_vcpu *vcpu, struct kvm_mmu
> *context)
>  {
>         bool uses_nx = context->nx || context->base_role.smep_andnot_wp;
> +       struct rsvd_bits_validate *shadow_zero_check;
> +       int i;
>  
>         /*
> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> index ccb70b8..7a8edc0 100644
> --- a/arch/x86/kvm/mmu.c
> +++ b/arch/x86/kvm/mmu.c
> @@ -4109,16 +4109,30 @@ void
>  reset_shadow_zero_bits_mask(struct kvm_vcpu *vcpu, struct kvm_mmu
> *context)
>  {
>         bool uses_nx = context->nx || context->base_role.smep_andnot_wp;
> +       struct rsvd_bits_validate *shadow_zero_check;
> +       int i;
>  
>         /*
>          * Passing "true" to the last argument is okay; it adds a check
>          * on bit 8 of the SPTEs which KVM doesn't use anyway.
>          */
> -       __reset_rsvds_bits_mask(vcpu, &context->shadow_zero_check,
> +       shadow_zero_check = &context->shadow_zero_check;
> +       __reset_rsvds_bits_mask(vcpu, shadow_zero_check,
>                                 boot_cpu_data.x86_phys_bits,
>                                 context->shadow_root_level, uses_nx,
>                                 guest_cpuid_has_gbpages(vcpu),
> is_pse(vcpu),
>                                 true);
> +
> +       if (!shadow_me_mask)
> +               return;
> +
> +       for (i = context->shadow_root_level; --i >= 0;) {
> +               shadow_zero_check->rsvd_bits_mask[i][0] &= ~shadow_me_mask;
> +               shadow_zero_check->rsvd_bits_mask[i][1] &= ~shadow_me_mask;
> +               shadow_zero_check->rsvd_bits_mask[i][2] &= ~shadow_me_mask;
> +               shadow_zero_check->rsvd_bits_mask[i][3] &= ~shadow_me_mask;

Neither my version nor yours is correct. :)  The right one has [0][i]
and [1][i] (I inverted the indices by mistake).

With that change, you can include my

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

> +       }
> +
>  }
>  EXPORT_SYMBOL_GPL(reset_shadow_zero_bits_mask);
>  
> @@ -4136,8 +4150,13 @@ static void
>  reset_tdp_shadow_zero_bits_mask(struct kvm_vcpu *vcpu,
>                                 struct kvm_mmu *context)
>  {
> +       struct rsvd_bits_validate *shadow_zero_check;
> +       int i;
> +
> +       shadow_zero_check = &context->shadow_zero_check;
> +
>         if (boot_cpu_is_amd())
> -               __reset_rsvds_bits_mask(vcpu, &context->shadow_zero_check,
> +               __reset_rsvds_bits_mask(vcpu, shadow_zero_check,
>                                         boot_cpu_data.x86_phys_bits,
>                                         context->shadow_root_level, false,
>                                         boot_cpu_has(X86_FEATURE_GBPAGES),

Please use shadow_zero_check here too:

                __reset_rsvds_bits_mask_ept(&context->shadow_zero_check,

Thanks,

Paolo

> @@ -4147,6 +4166,15 @@ reset_tdp_shadow_zero_bits_mask(struct kvm_vcpu
> *vcpu,
>                                             boot_cpu_data.x86_phys_bits,
>                                             false);
>  
> +       if (!shadow_me_mask)
> +               return;
> +
> +       for (i = context->shadow_root_level; --i >= 0;) {
> +               shadow_zero_check->rsvd_bits_mask[i][0] &= ~shadow_me_mask;
> +               shadow_zero_check->rsvd_bits_mask[i][1] &= ~shadow_me_mask;
> +               shadow_zero_check->rsvd_bits_mask[i][2] &= ~shadow_me_mask;
> +               shadow_zero_check->rsvd_bits_mask[i][3] &= ~shadow_me_mask;
> +       }
>  }
>  
>  /*
> diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
> index 3cc7255..d7d248a 100644
> --- a/arch/x86/kvm/mmu.h
> +++ b/arch/x86/kvm/mmu.h
> @@ -48,7 +48,7 @@
>  
>  static inline u64 rsvd_bits(int s, int e)
>  {
> -       return __sme_clr(((1ULL << (e - s + 1)) - 1) << s);
> +       return ((1ULL << (e - s + 1)) - 1) << s;
>  }
>  
>  void kvm_mmu_set_mmio_spte_mask(u64 mmio_mask, u64 mmio_value);
> 
> 
