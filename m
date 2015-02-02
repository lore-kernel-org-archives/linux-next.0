From: Laura Abbott <lauraa@codeaurora.org>
Subject: Re: linux-next: Tree for Jan 27 (build failures due to 'don't offset
 memmap for flatmem')
Date: Mon, 02 Feb 2015 10:31:09 -0800
Message-ID: <54CFC26D.9020901@codeaurora.org>
References: <20150127195123.46885d96@canb.auug.org.au> <20150127173128.GA1555@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.11.231]:35400 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751663AbbBBSbL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Feb 2015 13:31:11 -0500
In-Reply-To: <20150127173128.GA1555@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On 1/27/2015 9:31 AM, Guenter Roeck wrote:
> On Tue, Jan 27, 2015 at 07:51:23PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20150123:
>>
>> The arm64 tree gained a conflict against Linus' tree.
>>
>> The net-next tree gained conflicts against the arm-soc and net trees.
>>
>> The drm-panel tree gained a conflict against the drm tree.
>>
>> The wireless-drivers-next tree gained a build failure for which I reverted
>> a commit.
>>
>> The block tree gained conflicts against the vfs and Linus' trees.
>>
>> The clockevents tree gained a conflict against the arm tree.
>>
>> The akpm tree lost a patch that turned up elsewhere.
>>
>> Non-merge commits (relative to Linus' tree): 5237
>>   4877 files changed, 200964 insertions(+), 94565 deletions(-)
>>
> There are various build failures due to commit
> 	'mm/page_alloc.c: don't offset memmap for flatmem',
> which assumes that ARCH_PFN_OFFSET is defined for all architectures,
> but it isn't. This is also the first use of ARCH_PFN_OFFSET outside
> an architecture directory.
>
> Build fails for mn10300, m68k_nommu, and avr32.
>
> Guenter
>

Apologies for the late reply, I was on vacation last week. Yes,
the patch is being re-worked. I asked Andrew to drop the patch
from mmotm.

Thanks,
Laura

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
