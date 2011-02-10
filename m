From: Nitin Gupta <ngupta@vflare.org>
Subject: Re: [PATCH] Allow sharing xvmalloc for zram and zcache
Date: Fri, 11 Feb 2011 02:42:44 +0530
Message-ID: <4D5454CC.1000609@vflare.org>
References: <1297371646-11604-1-git-send-email-ngupta@vflare.org> <4D5453CB.7050206@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:45463 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756993Ab1BJVMI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2011 16:12:08 -0500
In-Reply-To: <4D5453CB.7050206@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Magenheimer <dan.magenheimer@oracle.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On 02/11/2011 02:38 AM, Randy Dunlap wrote:
> On 02/10/11 13:00, Nitin Gupta wrote:
>> Both zram and zcache use xvmalloc allocator. If xvmalloc
>> is compiled separately for both of them, we will get linker
>> error if they are both selected as "built-in". We can also
>> get linker error regarding missing xvmalloc symbols if zram
>> is not built.
>>
>> So, we now compile xvmalloc separately and export its symbols
>> which are then used by both of zram and zcache.
>>
>> Signed-off-by: Nitin Gupta<ngupta@vflare.org>
>
> Acked-by: Randy Dunlap<randy.dunlap@oracle.com>
>
>
> but what does this patch apply to?  It does not apply cleanly to
> linux-next of 20110210.
>

This applies to staging-2.6. I thought linux-next won't be that 
different so as to produce conflicts. Can you please send reject files, 
or let me fetch linux-next tree and will soon post patch against the same.

Thanks,
Nitin
