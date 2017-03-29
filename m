From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-mips
 tree
Date: Wed, 29 Mar 2017 11:29:00 +0200
Message-ID: <7115ff68-df06-10e0-6fff-e040a222a5e8@de.ibm.com>
References: <20170329140832.5cbfb6ce@canb.auug.org.au>
 <20170329092112.GV31606@jhogan-linux.le.imgtec.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:44399 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754931AbdC2J3O (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Mar 2017 05:29:14 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v2T9J480128486
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2017 05:29:08 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 29g9pfsjhv-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 29 Mar 2017 05:29:07 -0400
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Wed, 29 Mar 2017 05:29:06 -0400
In-Reply-To: <20170329092112.GV31606@jhogan-linux.le.imgtec.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fan Zhang <zhangfan@linux.vnet.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>

On 03/29/2017 11:21 AM, James Hogan wrote:
> On Wed, Mar 29, 2017 at 02:08:32PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the kvms390 tree got a conflict in:
>>
>>   include/uapi/linux/kvm.h
>>
>> between commits:
>>
>>   a8a3c426772e ("KVM: MIPS: Add VZ & TE capabilities")
>>   578fd61d2d21 ("KVM: MIPS: Add 64BIT capability")
>>
>> from the kvm-mips tree and commit:
>>
>>   4e0b1ab72b8a ("KVM: s390: gs support for kvm guests")
>>
>> from the kvms390 tree.
>>
>> It looks like someone needs to arbitrate on these KVM_CAP_ numbers ...
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
>> index 1e1a6c728a18,c9d522765f8f..000000000000
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@@ -887,9 -883,7 +887,10 @@@ struct kvm_ppc_resize_hpt 
>>   #define KVM_CAP_PPC_MMU_RADIX 134
>>   #define KVM_CAP_PPC_MMU_HASH_V3 135
>>   #define KVM_CAP_IMMEDIATE_EXIT 136
>>  -#define KVM_CAP_S390_GS 137
>>  +#define KVM_CAP_MIPS_VZ 137
>>  +#define KVM_CAP_MIPS_TE 138
>>  +#define KVM_CAP_MIPS_64BIT 139
>> ++#define KVM_CAP_S390_GS 140
>>   
>>   #ifdef KVM_CAP_IRQ_ROUTING
> 
> Thanks Stephen,
> 
> Cc'ing Paulo and Radim.
> 
> This does seem a bit of a conflict magnet, and they're part of the user
> ABI so when the values change upon merge, the intermediate versions
> before and after require different userland builds.
> 
> Should the numbering be decided in advance somehow (i.e. in response to
> conflicts in linux-next)? I don't particularly want to change the
> numbering again as others would need rebuilds again, but I only just
> pushed the MIPS changes, so if I change the MIPS numbering to 138-140,
> can we expect other branches to continue at 141 so I don't need to
> change them again?
> 
> Alternatively does it make sense to have different ranges reserved for
> different architectures (like the get one reg numbers)?

I can live with a changing GS capability number, so keep your number.
In the end I think Radim/Paolo will do the assigment when merging.
And no userspace should rely on this before this is at least in kvm/next
Yes, this will be a bit of pain for internal QA, but this worked ok
for the last 3 or 4 years on our side
