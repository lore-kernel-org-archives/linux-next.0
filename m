From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvm-ppc tree with the kvm-arm
 tree
Date: Thu, 11 Oct 2018 10:58:23 +0200
Message-ID: <044aa41c-d42d-0bab-b9e8-0a14f018e084@redhat.com>
References: <20181010132224.3bee4dfd@canb.auug.org.au>
 <20181011130623.59a160f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011130623.59a160f5@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Mackerras <paulus@ozlabs.org>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, KVM <kvm@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
List-Id: linux-next.vger.kernel.org

On 11/10/2018 04:06, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 10 Oct 2018 13:22:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the kvm-ppc tree got a conflict in:
>>
>>   include/uapi/linux/kvm.h
>>
>> between commit:
>>
>>   233a7cb23531 ("kvm: arm64: Allow tuning the physical address size for VM")
>>
>> from the kvm-arm tree and commit:
>>
>>   aa069a996951 ("KVM: PPC: Book3S HV: Add a VM capability to enable nested virtualization")
>>
>> from the kvm-ppc tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc include/uapi/linux/kvm.h
>> index 95aa73ca65dc,7f2ff3a76995..000000000000
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@@ -962,7 -954,7 +963,8 @@@ struct kvm_ppc_resize_hpt 
>>   #define KVM_CAP_NESTED_STATE 157
>>   #define KVM_CAP_ARM_INJECT_SERROR_ESR 158
>>   #define KVM_CAP_MSR_PLATFORM_INFO 159
>>  -#define KVM_CAP_PPC_NESTED_HV 160
>>  +#define KVM_CAP_ARM_VM_IPA_SIZE 160 /* returns maximum IPA bits for a VM */
>> ++#define KVM_CAP_PPC_NESTED_HV 161
>>   
>>   #ifdef KVM_CAP_IRQ_ROUTING
>>   
> 
> This is now a conflict between the kvm tree and the kvm-arm tree.

Indeed, and ARM will be bumped to 161 (whoever comes first to the kvm
tree wins).

Paolo
