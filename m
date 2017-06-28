From: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: linux-next: manual merge of the kvms390 tree with the kvm-arm
 tree
Date: Wed, 28 Jun 2017 09:10:00 +0200
Message-ID: <fbab4d70-e7df-b93c-d728-b5316bade2f1@de.ibm.com>
References: <20170609142856.461a9d28@canb.auug.org.au>
 <20170628160204.0007fe06@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40635 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751457AbdF1HKH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 03:10:07 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v5S79Psd027853
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2017 03:10:07 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2bc6fcu7tv-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2017 03:10:07 -0400
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <borntraeger@de.ibm.com>;
        Wed, 28 Jun 2017 03:10:05 -0400
In-Reply-To: <20170628160204.0007fe06@canb.auug.org.au>
Content-Language: en-IE
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Cornelia Huck <cornelia.huck@de.ibm.com>, Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Jones <drjones@redhat.com>, Claudio Imbrenda <imbrenda@linux.vnet.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>

On 06/28/2017 08:02 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 9 Jun 2017 14:28:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the kvms390 tree got a conflict in:
>>
>>   arch/s390/include/asm/kvm_host.h
>>
>> between commit:
>>
>>   2387149eade2 ("KVM: improve arch vcpu request defining")
>>
>> from the kvm-arm tree and commit:
>>
>>   8611a6a64661 ("KVM: s390: CMMA tracking, ESSA emulation, migration mode")
>>
>> from the kvms390 tree.
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
>> diff --cc arch/s390/include/asm/kvm_host.h
>> index 9c3bd94204ac,a8cafed79eb4..000000000000
>> --- a/arch/s390/include/asm/kvm_host.h
>> +++ b/arch/s390/include/asm/kvm_host.h
>> @@@ -42,9 -42,11 +42,11 @@@
>>   #define KVM_HALT_POLL_NS_DEFAULT 80000
>>   
>>   /* s390-specific vcpu->requests bit members */
>>  -#define KVM_REQ_ENABLE_IBS         8
>>  -#define KVM_REQ_DISABLE_IBS        9
>>  -#define KVM_REQ_ICPT_OPEREXC       10
>>  -#define KVM_REQ_START_MIGRATION   11
>>  -#define KVM_REQ_STOP_MIGRATION    12
>>  +#define KVM_REQ_ENABLE_IBS	KVM_ARCH_REQ(0)
>>  +#define KVM_REQ_DISABLE_IBS	KVM_ARCH_REQ(1)
>>  +#define KVM_REQ_ICPT_OPEREXC	KVM_ARCH_REQ(2)
>> ++#define KVM_REQ_START_MIGRATION	KVM_ARCH_REQ(3)
>> ++#define KVM_REQ_STOP_MIGRATION	KVM_ARCH_REQ(4)
>>   
>>   #define SIGP_CTRL_C		0x80
>>   #define SIGP_CTRL_SCN_MASK	0x3f
> 
> With the merge window appraoching, I assume that these 2 trees will
> merge in the kvm tree soon.  This is just a reminder that this conflict
> still exists (I think).

Yes, these 2 trees will be merged in the kvm tree and Paolo/Radim will resolve
the conflict.
