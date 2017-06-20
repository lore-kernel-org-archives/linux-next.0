From: "Baicar, Tyler" <tbaicar@codeaurora.org>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Tue, 20 Jun 2017 12:13:13 -0600
Message-ID: <25d08c14-eea7-8b58-675a-1124200b50a6@codeaurora.org>
References: <20170616152136.161630bf@canb.auug.org.au>
 <20170619091942.GA2702@arm.com> <1497866790.22624.164.camel@linux.intel.com>
 <20170619102240.GC2702@arm.com>
 <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
 <20170620084007.GA30664@arm.com> <20170620084307.GA9703@lst.de>
 <1497948465.22624.167.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54408 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750823AbdFTSNQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jun 2017 14:13:16 -0400
In-Reply-To: <1497948465.22624.167.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Christoph Hellwig <hch@lst.de>, Will Deacon <will.deacon@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 6/20/2017 2:47 AM, Andy Shevchenko wrote:
> On Tue, 2017-06-20 at 10:43 +0200, Christoph Hellwig wrote:
>> On Tue, Jun 20, 2017 at 09:40:08AM +0100, Will Deacon wrote:
>>>>>> To have better coordination, please, look at my WIP branch
>>>>>> regarding
>>>>>> UUID stuff:
>>>>>> http://bitbucket.org/andy-shev/linux/branch/topic%2Fuuid
>>>>> That link doesn't work for me. Is there anything specific Tyler
>>>>> should be
>>>>> paying attention to on that branch?
>>>> That link doesn't work for me either, but I assume it is the
>>>> topic/uuid
>>>> branch here:
>>>>
>>>> https://bitbucket.org/andy-shev/linux/branches/
>>>>
>>>> I'll rebase my patches on top of this branch and send them to you
>>>> Will.
>>> The conflict in -next came from Christoph's tree:
>>>
>>>    http://git.infradead.org/users/hch/uuid.git/heads
>>>
>>> hence why I mentioned the uuid-types branch above. It's not clear to
>>> me
>>> how Andy's branch fits in with this.
>> I think Andy is preparing various uuid conversion in it and wanted to
>> make sure you don't do any work he already did or which conflicts with
>> this work.
> Thanks, Christoph, that's correct.
>
>> For now please just base it on my uuid-types tree.
> Yeah, this is safest option for now.
>
Will,

I have sent you the rebased patches. I took Christoph's uuid-types tree 
and added this patch onto it:

7bf130e4a065 ("ACPI/APEI: Handle GSIV and GPIO notification types")

And then added my patches onto that. This will hopefully now avoid 
conflicts with any other patch.

Andy,

The patch that was causing compilation failures on your branch was:

22e31da efi: Switch to use new generic UUID API

The failures were because of the removed guid_t * casts. Note that this 
patch will conflict with my patch series, so you may want to rebase it 
onto linux-next once they are in.

Thanks,
Tyler

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
