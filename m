From: "Alexey Zaytsev" <alexey.zaytsev@gmail.com>
Subject: Re: linux-next: Tree for December 11
Date: Wed, 17 Dec 2008 01:21:29 +0300
Message-ID: <f19298770812161421r77a10575ia956e59a52d7efb2@mail.gmail.com>
References: <20081211200459.14d18d7a.sfr@canb.auug.org.au>
	 <f19298770812110440s7e3781eex4a16b961ad6847b2@mail.gmail.com>
	 <f19298770812140634j434bf6a6gd883688f00dac45e@mail.gmail.com>
	 <20081216210834.GM14787@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.170]:30391 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751671AbYLPWVa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 16 Dec 2008 17:21:30 -0500
In-Reply-To: <20081216210834.GM14787@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Nick Piggin <nickpiggin@yahoo.com.au>

On Wed, Dec 17, 2008 at 00:08, Ingo Molnar <mingo@elte.hu> wrote:

>>
>> The warning can also be reproduced in qemu, so it was easy to bisect.
>>
>> commit 7317d7b87edb41a9135e30be1ec3f7ef817c53dd
>> Author: Nick Piggin <nickpiggin@yahoo.com.au>
>> Date:   Tue Sep 30 20:50:27 2008 +1000
>>
>>     sched: improve preempt debugging
>>
>>     This patch helped me out with a problem I recently had....
>>
>>     Basically, when the kernel lock is held, then preempt_count
>> underflow does not
>>     get detected until it is released which may be a long time (and arbitrarily,
>>     eg at different points it may be rescheduled). If the bkl is released at
>>     schedule, the resulting output is actually fairly cryptic...
>>
>>     With any other lock that elevates preempt_count, it is illegal to schedule
>>     under it (which would get found pretty quickly). bkl allows scheduling with
>>     preempt_count elevated, which makes underflows hard to debug.
>>
>>     Signed-off-by: Ingo Molnar <mingo@elte.hu>
>>
>> I understand that not this particular commit is buggy, but at least
>> I've got someone to add to the CC. ;)
>>
>> Also the author's e-mail looks suspicious.
>
> Suspicious in what way?

Does not appear in signed-off-by.

>
>        Ingo
>
