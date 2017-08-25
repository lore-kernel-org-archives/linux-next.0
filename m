From: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 25 Aug 2017 08:57:38 -0500
Message-ID: <dd8be323-8ffb-bab5-0431-f77e48fd5df1@amd.com>
References: <20170825143930.494744fe@canb.auug.org.au>
 <2984689e-ab4e-0c22-7151-adfeeffce4ed@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2984689e-ab4e-0c22-7151-adfeeffce4ed@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paolo Bonzini <pbonzini@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, Brijesh Singh <brijesh.singh@amd.com>
List-Id: linux-next.vger.kernel.org

On 8/25/2017 1:39 AM, Paolo Bonzini wrote:
> On 25/08/2017 06:39, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the kvm tree got a conflict in:
>>
>>    arch/x86/kvm/mmu.h
>>
>> between commit:
>>
>>    d0ec49d4de90 ("kvm/x86/svm: Support Secure Memory Encryption within KVM")
>>
>> from the tip tree and commit:
>>
>>    d1cd3ce90044 ("KVM: MMU: check guest CR3 reserved bits based on its physical address width.")
>>
>> from the kvm tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> 
> Thomas L., Ingo,
> 
> this is completely wrong:
> 
>>
>>   static inline u64 rsvd_bits(int s, int e)
>>   {
>> -	return ((1ULL << (e - s + 1)) - 1) << s;
>> +	return __sme_clr(((1ULL << (e - s + 1)) - 1) << s);
>>   }
>>   
> 
> First, rsvd_bits is just a simple function to return some 1 bits.  Applying
> a mask based on properties of the host MMU is incorrect.
> 
> Second, the masks computed by __reset_rsvds_bits_mask also apply to
> guest page tables, where the C bit is reserved since we don't emulate
> SME.
> 
> Something like this:

Thanks Paolo, Brijesh and I will test this and make sure everything works
properly with this patch.

Thanks,
Tom

> 
> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
> index 2dafd36368cc..e0597d703d72 100644
> --- a/arch/x86/kvm/mmu.c
> +++ b/arch/x86/kvm/mmu.c
> @@ -4142,16 +4142,24 @@ void
>   reset_shadow_zero_bits_mask(struct kvm_vcpu *vcpu, struct kvm_mmu *context)
>   {
>   	bool uses_nx = context->nx || context->base_role.smep_andnot_wp;
> +	struct rsvd_bits_validate *shadow_zero_check;
> +	int i;
>   
>   	/*
>   	 * Passing "true" to the last argument is okay; it adds a check
>   	 * on bit 8 of the SPTEs which KVM doesn't use anyway.
>   	 */
> -	__reset_rsvds_bits_mask(vcpu, &context->shadow_zero_check,
> +        shadow_zero_check = &context->shadow_zero_check;
> +	__reset_rsvds_bits_mask(vcpu, shadow_zero_check,
>   				boot_cpu_data.x86_phys_bits,
>   				context->shadow_root_level, uses_nx,
>   				guest_cpuid_has(vcpu, X86_FEATURE_GBPAGES),
>   				is_pse(vcpu), true);
> +
> +	for (i = context->shadow_root_level; --i >= 0; ) {
> +		shadow_zero_check->rsvd_bits_mask[i][0] &= ~shadow_me_mask;
> +		shadow_zero_check->rsvd_bits_mask[i][1] &= ~shadow_me_mask;
> +	}
>   }
>   EXPORT_SYMBOL_GPL(reset_shadow_zero_bits_mask);
>   
> 
> Can you please fix it up?   Please Cc me at paolo.bonzini@gmail.com too
> because I'll be on vacation next week.
> 
> (And thanks Stephen for the heads-up!)
> 
> Paolo
> 
