From: Peter Hurley <peter@hurleysoftware.com>
Subject: Re: [PATCH tty-next] n_tty: Fix termios_rwsem lockdep false positive
Date: Mon, 12 Aug 2013 09:39:01 -0400
Message-ID: <5208E575.1080008@hurleysoftware.com>
References: <20130731114726.GA11570@cpv436-motbuntu.spb.ea.mot-mobility.com> <1376222663-5666-1-git-send-email-peter@hurleysoftware.com> <20130812092810.GA26400@cpv436-motbuntu.spb.ea.mot-mobility.com> <20130812105041.GA2268@swordfish> <5208DB32.40304@hurleysoftware.com> <20130812131949.GA2297@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout39.mail01.mtsvc.net ([216.70.64.83]:52613 "EHLO
	n12.mail01.mtsvc.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756181Ab3HLNjE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 12 Aug 2013 09:39:04 -0400
In-Reply-To: <20130812131949.GA2297@swordfish>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jslaby@suse.cz>, Belisko Marek <marek.belisko@gmail.com>

On 08/12/2013 09:19 AM, Sergey Senozhatsky wrote:
> On (08/12/13 08:55), Peter Hurley wrote:
>>>>> [..]
>>>>>   drivers/tty/n_tty.c | 25 +++++++++++--------------
>>>>>   1 file changed, 11 insertions(+), 14 deletions(-)
>>>>>
>>>
>>> I hate to do this, but isn't it actually my patch posted here
>>> https://lkml.org/lkml/2013/8/1/510
>>>
>>> which was tagged as `wrong'?
>>
>> Sergey,
>>
>> My apologies; I was mistaken regarding this problem being a lockdep
>> regression (although it's still a false positive from lockdep). Once
>> I had worked around some issues with the nouveau driver, I was able to
>> reproduce the lockdep report on 3.10.
>>
> no problem.
>
>> I included Artem's lockdep report in the changelog because I received
>> that first, on 30 July.
>>
>> My patch below is not the same as your patch of 1 Aug. This patch
>> preserves the protected access of termios.c_cc[VMIN] and termios.c_cc[VTIME]
>> (via the MIN_CHAR() and TIME_CHAR() macros).
>
> fair enough. v3 was protecting VMIN/VTIME (my bad, I noticed this a bit later),
> but I didn't submit it since v2 did not get positive response.
>
>> If you'd prefer, I could add to changelog:
>>
>>     Patch based on original posted here https://lkml.org/lkml/2013/8/1/510
>>     by Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
>
> if you don't mind, that would be great.

Ok.

Greg,
Should I re-spin a v2 to include the note above
(or can you add it with Artem's Tested-by)?

Regards,
Peter Hurley
