From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] zram: fix build errors, depends on BLOCK
Date: Thu, 24 Jun 2010 08:53:25 -0700
Message-ID: <4C237F75.70603@oracle.com>
References: <20100623154531.0a4b02e1.sfr@canb.auug.org.au> <20100623202709.4ecb798c.randy.dunlap@oracle.com> <4C22E0B3.60203@vflare.org> <4C236C93.1020407@oracle.com> <4C237E12.9020903@vflare.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:44931 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754185Ab0FXPzX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 24 Jun 2010 11:55:23 -0400
In-Reply-To: <4C237E12.9020903@vflare.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ngupta@vflare.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, devel@driverdev.osuosl.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de

On 06/24/10 08:47, Nitin Gupta wrote:
> On 06/24/2010 08:02 PM, Randy Dunlap wrote:
>> On 06/23/10 21:36, Nitin Gupta wrote:
>>> On 06/24/2010 08:57 AM, Randy Dunlap wrote:
>>>> From: Randy Dunlap <randy.dunlap@oracle.com>
>>>>
>>>> Fix 49 zram build errors in one swoop.  Examples:
>>>>
>>>> drivers/staging/zram/zram_drv.c:225: error: dereferencing pointer to incomplete type
>>>> drivers/staging/zram/zram_drv.c:226: error: implicit declaration of function 'bio_for_each_segment'
>>>> drivers/staging/zram/zram_drv.c:226: error: expected ';' before '{' token
>>>> drivers/staging/zram/zram_drv.c:281: error: implicit declaration of function 'bio_endio'
>>>> drivers/staging/zram/zram_drv.c:285: error: implicit declaration of function 'bio_io_error'
>>>> drivers/staging/zram/zram_drv.c:545: error: implicit declaration of function 'set_capacity'
>>>> drivers/staging/zram/zram_drv.c:548: error: implicit declaration of function 'queue_flag_set_unlocked'
>>>> drivers/staging/zram/zram_drv.c:548: error: 'QUEUE_FLAG_NONROT' undeclared (first use in this function)
>>>> drivers/staging/zram/zram_drv.c:548: error: dereferencing pointer to incomplete type
>>>>
>>>
>>>
>>> Thanks for the fix. Strangely, I didn't get any of these
>>> errors when I compiled against mainline.
>>
>> This patch isn't against mainline, it's against linux-next.
>> See subject's "[PATCH -next]" hint.
>>
> 
> Randy, I understood that your patch is against linux-next. I was just wondering
> why the error did not come up when I applied and tested this whole zram thing
> against linux mainline.

Did you test a build with CONFIG_BLOCK disabled?

> Anyways, thanks for the fix.


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
