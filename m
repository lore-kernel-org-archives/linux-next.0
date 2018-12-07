From: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Fri, 7 Dec 2018 14:27:12 +0000
Message-ID: <0e7534a0-ae7b-7968-d97b-b3dec9a7be8d@arm.com>
References: <20181207091847.1db6a48e@canb.auug.org.au>
 <20181207121609.GA26721@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181207121609.GA26721@arm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Will Deacon <will.deacon@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Will, Stephen

On 07/12/2018 12:16, Will Deacon wrote:
> On Fri, Dec 07, 2018 at 09:18:47AM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the arm64 tree got a conflict in:
>>
>>    arch/arm64/kernel/cpu_errata.c
>>
>> between commit:
>>
>>    ce8c80c536da ("arm64: Add workaround for Cortex-A76 erratum 1286807")
>>
>> from Linus' tree and commit:
>>
>>    c9460dcb06ee ("arm64: capabilities: Merge entries for ARM64_WORKAROUND_CLEAN_CACHE")
>>
>> from the arm64 tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
> 
> Thanks, Stephen, this looks correct to me. Suzuki -- can you please confirm?
> 


Yes, it looks correct to me did a boot test.

Thanks Stephen!

Cheers
Suzuki
