From: Brijesh Singh <brijesh.singh@amd.com>
Subject: Re: linux-next: manual merge of the kvm tree with the tip tree
Date: Fri, 25 Aug 2017 11:53:32 -0500
Message-ID: <a71c9dbd-ec32-8bb6-9d36-c138d9b4f001@amd.com>
References: <20170825143930.494744fe@canb.auug.org.au>
 <2984689e-ab4e-0c22-7151-adfeeffce4ed@redhat.com>
 <dd8be323-8ffb-bab5-0431-f77e48fd5df1@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-owner@vger.kernel.org>
In-Reply-To: <dd8be323-8ffb-bab5-0431-f77e48fd5df1@amd.com>
Content-Language: en-US
Sender: kvm-owner@vger.kernel.org
To: Tom Lendacky <thomas.lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: brijesh.singh@amd.com, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, paolo.bonzini@gmail.com
List-Id: linux-next.vger.kernel.org

Hi Paolo,


On 08/25/2017 08:57 AM, Tom Lendacky wrote:
> On 8/25/2017 1:39 AM, Paolo Bonzini wrote:
>> On 25/08/2017 06:39, Stephen Rothwell wrote:

>> First, rsvd_bits is just a simple function to return some 1 bits.  Applying
>> a mask based on properties of the host MMU is incorrect.
>>
>> Second, the masks computed by __reset_rsvds_bits_mask also apply to
>> guest page tables, where the C bit is reserved since we don't emulate
>> SME.
>>
>> Something like this:
> 

Thanks for the tip, I have expanded the patch to cover tdp cases and have verified
that it works fine with SME enabled KVM. If you are okay with this then I can
send patch.

diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index ccb70b8..7a8edc0 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -4109,16 +4109,30 @@ void
  reset_shadow_zero_bits_mask(struct kvm_vcpu *vcpu, struct kvm_mmu *context)
  {
         bool uses_nx = context->nx || context->base_role.smep_andnot_wp;
+       struct rsvd_bits_validate *shadow_zero_check;
+       int i;
  
         /*
diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index ccb70b8..7a8edc0 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -4109,16 +4109,30 @@ void
  reset_shadow_zero_bits_mask(struct kvm_vcpu *vcpu, struct kvm_mmu *context)
  {
         bool uses_nx = context->nx || context->base_role.smep_andnot_wp;
+       struct rsvd_bits_validate *shadow_zero_check;
+       int i;
  
         /*
          * Passing "true" to the last argument is okay; it adds a check
          * on bit 8 of the SPTEs which KVM doesn't use anyway.
          */
-       __reset_rsvds_bits_mask(vcpu, &context->shadow_zero_check,
+       shadow_zero_check = &context->shadow_zero_check;
+       __reset_rsvds_bits_mask(vcpu, shadow_zero_check,
                                 boot_cpu_data.x86_phys_bits,
                                 context->shadow_root_level, uses_nx,
                                 guest_cpuid_has_gbpages(vcpu), is_pse(vcpu),
                                 true);
+
+       if (!shadow_me_mask)
+               return;
+
+       for (i = context->shadow_root_level; --i >= 0;) {
+               shadow_zero_check->rsvd_bits_mask[i][0] &= ~shadow_me_mask;
+               shadow_zero_check->rsvd_bits_mask[i][1] &= ~shadow_me_mask;
+               shadow_zero_check->rsvd_bits_mask[i][2] &= ~shadow_me_mask;
+               shadow_zero_check->rsvd_bits_mask[i][3] &= ~shadow_me_mask;
+       }
+
  }
  EXPORT_SYMBOL_GPL(reset_shadow_zero_bits_mask);
  
@@ -4136,8 +4150,13 @@ static void
  reset_tdp_shadow_zero_bits_mask(struct kvm_vcpu *vcpu,
                                 struct kvm_mmu *context)
  {
+       struct rsvd_bits_validate *shadow_zero_check;
+       int i;
+
+       shadow_zero_check = &context->shadow_zero_check;
+
         if (boot_cpu_is_amd())
-               __reset_rsvds_bits_mask(vcpu, &context->shadow_zero_check,
+               __reset_rsvds_bits_mask(vcpu, shadow_zero_check,
                                         boot_cpu_data.x86_phys_bits,
                                         context->shadow_root_level, false,
                                         boot_cpu_has(X86_FEATURE_GBPAGES),
@@ -4147,6 +4166,15 @@ reset_tdp_shadow_zero_bits_mask(struct kvm_vcpu *vcpu,
                                             boot_cpu_data.x86_phys_bits,
                                             false);
  
+       if (!shadow_me_mask)
+               return;
+
+       for (i = context->shadow_root_level; --i >= 0;) {
+               shadow_zero_check->rsvd_bits_mask[i][0] &= ~shadow_me_mask;
+               shadow_zero_check->rsvd_bits_mask[i][1] &= ~shadow_me_mask;
+               shadow_zero_check->rsvd_bits_mask[i][2] &= ~shadow_me_mask;
+               shadow_zero_check->rsvd_bits_mask[i][3] &= ~shadow_me_mask;
+       }
  }
  
  /*
diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 3cc7255..d7d248a 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -48,7 +48,7 @@
  
  static inline u64 rsvd_bits(int s, int e)
  {
-       return __sme_clr(((1ULL << (e - s + 1)) - 1) << s);
+       return ((1ULL << (e - s + 1)) - 1) << s;
  }
  
  void kvm_mmu_set_mmio_spte_mask(u64 mmio_mask, u64 mmio_value);





> Thanks Paolo, Brijesh and I will test this and make sure everything works
> properly with this patch.
> 
> Thanks,
> Tom
> 
>>
>> diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
>> index 2dafd36368cc..e0597d703d72 100644
>> --- a/arch/x86/kvm/mmu.c
>> +++ b/arch/x86/kvm/mmu.c
>> @@ -4142,16 +4142,24 @@ void
>>   reset_shadow_zero_bits_mask(struct kvm_vcpu *vcpu, struct kvm_mmu *context)
>>   {
>>       bool uses_nx = context->nx || context->base_role.smep_andnot_wp;
>> +    struct rsvd_bits_validate *shadow_zero_check;
>> +    int i;
>>       /*
>>        * Passing "true" to the last argument is okay; it adds a check
>>        * on bit 8 of the SPTEs which KVM doesn't use anyway.
>>        */
>> -    __reset_rsvds_bits_mask(vcpu, &context->shadow_zero_check,
>> +        shadow_zero_check = &context->shadow_zero_check;
>> +    __reset_rsvds_bits_mask(vcpu, shadow_zero_check,
>>                   boot_cpu_data.x86_phys_bits,
>>                   context->shadow_root_level, uses_nx,
>>                   guest_cpuid_has(vcpu, X86_FEATURE_GBPAGES),
>>                   is_pse(vcpu), true);
>> +
>> +    for (i = context->shadow_root_level; --i >= 0; ) {
>> +        shadow_zero_check->rsvd_bits_mask[i][0] &= ~shadow_me_mask;
>> +        shadow_zero_check->rsvd_bits_mask[i][1] &= ~shadow_me_mask;
>> +    }
>>   }
>>   EXPORT_SYMBOL_GPL(reset_shadow_zero_bits_mask);
>>
>> Can you please fix it up?   Please Cc me at paolo.bonzini@gmail.com too
>> because I'll be on vacation next week.
>>
>> (And thanks Stephen for the heads-up!)
>>
>> Paolo
>>
