From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm tree with the arm64 tree
Date: Tue, 5 Jun 2018 19:08:51 +0200
Message-ID: <c5fa65ad-791c-1b5a-4b54-c05d2a206885@redhat.com>
References: <20180604165754.6ae09612@canb.auug.org.au>
 <20180604073319.GF22983@e103592.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180604073319.GF22983@e103592.cambridge.arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Martin <Dave.Martin@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: linux-next.vger.kernel.org

On 04/06/2018 09:33, Dave Martin wrote:
> On Mon, Jun 04, 2018 at 04:57:54PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the kvm tree got a conflict in:
>>
>>   arch/arm64/include/asm/processor.h
>>
>> between commit:
>>
>>   94b07c1f8c39 ("arm64: signal: Report signal frame size to userspace via auxv")
>>
>> from the arm64 tree and commit:
>>
>>   9a6e594869b2 ("arm64/sve: Move sve_pffr() to fpsimd.h and make inline")
>>
>> from the kvm tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> The resolution looks fine here, thanks.

Looks good, but it would have been even better if the ARM64 tree
provided a topic branch and the kvm/arm tree pulled it.

Thanks,

Paolo

> ---Dave
> 
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc arch/arm64/include/asm/processor.h
>> index 65ab83e8926e,c99e657fdd57..000000000000
>> --- a/arch/arm64/include/asm/processor.h
>> +++ b/arch/arm64/include/asm/processor.h
>> @@@ -246,9 -246,17 +248,20 @@@ void cpu_enable_pan(const struct arm64_
>>   void cpu_enable_cache_maint_trap(const struct arm64_cpu_capabilities *__unused);
>>   void cpu_clear_disr(const struct arm64_cpu_capabilities *__unused);
>>   
>>  +extern unsigned long __ro_after_init signal_minsigstksz; /* sigframe size */
>>  +extern void __init minsigstksz_setup(void);
>>  +
>> + /*
>> +  * Not at the top of the file due to a direct #include cycle between
>> +  * <asm/fpsimd.h> and <asm/processor.h>.  Deferring this #include
>> +  * ensures that contents of processor.h are visible to fpsimd.h even if
>> +  * processor.h is included first.
>> +  *
>> +  * These prctl helpers are the only things in this file that require
>> +  * fpsimd.h.  The core code expects them to be in this header.
>> +  */
>> + #include <asm/fpsimd.h>
>> + 
>>   /* Userspace interface for PR_SVE_{SET,GET}_VL prctl()s: */
>>   #define SVE_SET_VL(arg)	sve_set_current_vl(arg)
>>   #define SVE_GET_VL()	sve_get_current_vl()
> 
> 
