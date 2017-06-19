From: "Baicar, Tyler" <tbaicar@codeaurora.org>
Subject: Re: linux-next: manual merge of the uuid tree with the arm64 tree
Date: Mon, 19 Jun 2017 13:22:03 -0600
Message-ID: <2c0228e4-f235-f97b-880a-e331d164b3ce@codeaurora.org>
References: <20170616152136.161630bf@canb.auug.org.au>
 <20170619091942.GA2702@arm.com> <1497866790.22624.164.camel@linux.intel.com>
 <20170619102240.GC2702@arm.com>
 <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:60448 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753148AbdFSTW3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jun 2017 15:22:29 -0400
In-Reply-To: <afe3af71-36d4-df49-07a9-2e3fba3a5c16@codeaurora.org>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Catalin Marinas <catalin.marinas@arm.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 6/19/2017 12:41 PM, Baicar, Tyler wrote:
> On 6/19/2017 4:22 AM, Will Deacon wrote:
>> On Mon, Jun 19, 2017 at 01:06:30PM +0300, Andy Shevchenko wrote:
>>> On Mon, 2017-06-19 at 10:19 +0100, Will Deacon wrote:
>>>> Hi Stephen, Christoph, Tyler,
>>>> On Fri, Jun 16, 2017 at 03:21:36PM +1000, Stephen Rothwell wrote:
>>>> Apologies for this: I've just dropped the offending merge from the
>>>> arm64
>>>> tree so you can include the uuid tree in -next again.
>>>>
>>>> Tyler: please rebase your patches on top of Christoph's uuid-types
>>>> branch
>>>> and send me a new series.
>>> To have better coordination, please, look at my WIP branch regarding
>>> UUID stuff:
>>> http://bitbucket.org/andy-shev/linux/branch/topic%2Fuuid
>> That link doesn't work for me. Is there anything specific Tyler 
>> should be
>> paying attention to on that branch?
> That link doesn't work for me either, but I assume it is the 
> topic/uuid branch here:
>
> https://bitbucket.org/andy-shev/linux/branches/
>
> I'll rebase my patches on top of this branch and send them to you Will.
I'm trying to rebase my patches; however, this branch does not compile 
as is. It seems that the UUID changes in the APEI code are wrong:

drivers/acpi/apei/ghes.c: In function 'ghes_do_proc':
drivers/acpi/apei/ghes.c:438:12: error: assignment from incompatible 
pointer type [-Werror=incompatible-pointer-types]
    sec_type = gdata->section_type;
             ^
I am just trying to compile the tip code in the topic/uuid branch from 
above. Tip commit is currently:

commit ab4ea80ef9dc97878d60a4a3487fe9dacd0e6b3a
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Fri Apr 21 16:36:06 2017 +0300

     ASoC: Intel: Skylake: Use recently introduced uuid_le_cmp_p{p}()

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
