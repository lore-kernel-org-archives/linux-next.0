From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-mips
 tree
Date: Wed, 29 Mar 2017 11:47:30 +0200
Message-ID: <f933eae5-7c48-8a1d-c748-a99f29acee2a@redhat.com>
References: <20170329140832.5cbfb6ce@canb.auug.org.au>
 <20170329092112.GV31606@jhogan-linux.le.imgtec.org>
 <7115ff68-df06-10e0-6fff-e040a222a5e8@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7115ff68-df06-10e0-6fff-e040a222a5e8@de.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Borntraeger <borntraeger@de.ibm.com>, James Hogan <james.hogan@imgtec.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Zhang <zhangfan@linux.vnet.ibm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
List-Id: linux-next.vger.kernel.org



On 29/03/2017 11:29, Christian Borntraeger wrote:
>>>  -#define KVM_CAP_S390_GS 137
>>>  +#define KVM_CAP_MIPS_VZ 137
>>>  +#define KVM_CAP_MIPS_TE 138
>>>  +#define KVM_CAP_MIPS_64BIT 139
>>> ++#define KVM_CAP_S390_GS 140
>>>   
>>>   #ifdef KVM_CAP_IRQ_ROUTING
>> Thanks Stephen,
>>
>> Cc'ing Paulo and Radim.
>>
>> This does seem a bit of a conflict magnet, and they're part of the user
>> ABI so when the values change upon merge, the intermediate versions
>> before and after require different userland builds.
>>
>> Should the numbering be decided in advance somehow (i.e. in response to
>> conflicts in linux-next)? I don't particularly want to change the
>> numbering again as others would need rebuilds again, but I only just
>> pushed the MIPS changes, so if I change the MIPS numbering to 138-140,
>> can we expect other branches to continue at 141 so I don't need to
>> change them again?

Yes, that can be expected.  If you don't do it, I'll bump the capability
number as soon as I get the conflict.

If it's an issue, the solution is topic branches: as soon as you need a
capability, fire a pull request so that it gets in kvm/next.  But it
doesn't happen too often, the last times were in 4.1, 4.6 and 4.8 (three
times in 2 years).

>> Alternatively does it make sense to have different ranges reserved for
>> different architectures (like the get one reg numbers)?
> 
> I can live with a changing GS capability number, so keep your number.
> In the end I think Radim/Paolo will do the assigment when merging.

Yes---and in that case it's first come first served.

Same for ioctls, though those change even more rarely.

Paolo

> And no userspace should rely on this before this is at least in kvm/next
> Yes, this will be a bit of pain for internal QA, but this worked ok
> for the last 3 or 4 years on our side
