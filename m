From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] Allow sharing xvmalloc for zram and zcache
Date: Thu, 10 Feb 2011 13:17:01 -0800
Message-ID: <4D5455CD.3000507@oracle.com>
References: <1297371646-11604-1-git-send-email-ngupta@vflare.org> <4D5453CB.7050206@oracle.com> <4D5454CC.1000609@vflare.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:23464 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751296Ab1BJVRW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2011 16:17:22 -0500
In-Reply-To: <4D5454CC.1000609@vflare.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nitin Gupta <ngupta@vflare.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dan Magenheimer <dan.magenheimer@oracle.com>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On 02/10/11 13:12, Nitin Gupta wrote:
> On 02/11/2011 02:38 AM, Randy Dunlap wrote:
>> On 02/10/11 13:00, Nitin Gupta wrote:
>>> Both zram and zcache use xvmalloc allocator. If xvmalloc
>>> is compiled separately for both of them, we will get linker
>>> error if they are both selected as "built-in". We can also
>>> get linker error regarding missing xvmalloc symbols if zram
>>> is not built.
>>>
>>> So, we now compile xvmalloc separately and export its symbols
>>> which are then used by both of zram and zcache.
>>>
>>> Signed-off-by: Nitin Gupta<ngupta@vflare.org>
>>
>> Acked-by: Randy Dunlap<randy.dunlap@oracle.com>
>>
>>
>> but what does this patch apply to?  It does not apply cleanly to
>> linux-next of 20110210.
>>
> 
> This applies to staging-2.6. I thought linux-next won't be that
> different so as to produce conflicts. Can you please send reject files,
> or let me fetch linux-next tree and will soon post patch against the same.

I'll let you fetch linux-next.  I merged it by hand and test-built it
successfully.

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
