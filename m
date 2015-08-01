From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Build error in -next due to 'drivers/video/fbdev/atyfb: Replace
 MTRR UC hole with strong UC'
Date: Fri, 31 Jul 2015 18:05:25 -0700
Message-ID: <55BC1B55.2070504@roeck-us.net>
References: <55BADCB8.3030503@roeck-us.net> <CAP=VYLoUTKemCoqw8t6mC4Gz+-HrhUzMY7DvTL-yE0Cx6gpJQw@mail.gmail.com> <20150801000233.GS30479@wotan.suse.de> <55BC0E50.9060606@roeck-us.net> <20150801003933.GT30479@wotan.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39948 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751072AbbHABF2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2015 21:05:28 -0400
In-Reply-To: <20150801003933.GT30479@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@suse.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

Hi Luis,

On 07/31/2015 05:39 PM, Luis R. Rodriguez wrote:
> On Fri, Jul 31, 2015 at 05:09:52PM -0700, Guenter Roeck wrote:
>> On 07/31/2015 05:02 PM, Luis R. Rodriguez wrote:
>>> On Fri, Jul 31, 2015 at 01:52:24PM -0400, Paul Gortmaker wrote:
>>>> On Thu, Jul 30, 2015 at 10:26 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>> Hi Luis,
>>>>>
>>>>> probably the zero-day build already told you, but just in case:
>>>>>
>>>>> Your commit 'drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC'
>>>>> causes build errors for architectures which don't support ioremap_uc.
>>>>> This affects at least the alpha architecture, though there may be others.
>>>>
>>>> Yep, parisc allmodconfig now sees it as well.  Bisected before seeing
>>>> this message.
>>>>
>>>> 3cc2dac5be3f23414a4efdee0b26d79bed297cac is the first bad commit
>>>> commit 3cc2dac5be3f23414a4efdee0b26d79bed297cac
>>>> Author: Luis R. Rodriguez <mcgrof@suse.com>
>>>> Date:   Thu Jul 9 18:24:58 2015 -0700
>>>>
>>>>      drivers/video/fbdev/atyfb: Replace MTRR UC hole with strong UC
>>>>
>>>> http://kisskb.ellerman.id.au/kisskb/buildresult/12475234/
>>>
>>> I submitted a fix for it, can you tell me your linux-next tree?
>>>
>>
>> http://server.roeck-us.net:8010/builders/next-alpha-next
>>
>> next-20150729 to next-20150731.
>
> Great thanks, I sent a proposal general fix, that should be tested first.
> If all the bots say go for it, then yay, otherwise a simple
>
> #define ioremap_uc ioremap_nocache
>
> would be the way to go, but I would prefer to fix this sort of thing for good.
>

I just replied to your patch - it doesn't work.

We already know that parisc is also affected, and with
some experimentation I found that ia64 is affected as well.

Guenter
