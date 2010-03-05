From: Tejun Heo <tj@kernel.org>
Subject: Re: -next March 3: Boot failure on x86 (Oops)
Date: Fri, 05 Mar 2010 22:24:51 +0900
Message-ID: <4B910623.9020707@kernel.org>
References: <20100303174603.5be197ba.sfr@canb.auug.org.au> <4B8E83D4.6090507@in.ibm.com> <4B8F0CD0.1040507@kernel.org> <4B8F43DD.10002@in.ibm.com> <4B909FC5.8020800@kernel.org> <4B90A031.8090306@kernel.org> <4B90E07A.5090302@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:35001 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750719Ab0CENZA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 5 Mar 2010 08:25:00 -0500
In-Reply-To: <4B90E07A.5090302@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hello,

On 03/05/2010 07:44 PM, Sachin Sant wrote:
> Tejun Heo wrote:
>> On 03/05/2010 03:08 PM, Tejun Heo wrote:
>>  
>>> Hmmm... this means that on one of the chunks, chunk->list.next was
>>> NULL (BTW, the disassembly is from unlinked object, right?).  The main
>>> allocation code hasn't seen much change lately.  The only changes are,
>>>
>>> 22b737f4c75197372d64afc6ed1bccd58c00e549 : just refactoring
>>> 833af8427be4b217b5bc522f61afdbd3f1d282c2 : possible but isn't very new
>>>     
>>
>> Can you also please try reverting the above two commits?
>>
>> Thanks.
>>
>>   
> Reverting both the commits allows the machine to boot.
> If i just apply 22b737f4c75197372d64afc6ed1bccd58c00e549 the
> box fails to boot with following kobject related traces:
> 
> registered taskstats version 1
> kobject '' (c11d5fdc): tried to add an uninitialized object, something
> is seriously wrong.
> Pid: 1, comm: swapper Not tainted 2.6.33-autotest-next-20100305 #3
> Call Trace:
> [<c03a7678>] ? printk+0xf/0x17
> [<c028766f>] kobject_add+0x28/0x49
> [<c05a1a8e>] memmap_init+0x4f/0x89
> [<c05a1a3f>] ? memmap_init+0x0/0x89
> [<c0101139>] do_one_initcall+0x4c/0x131
> [<c057b352>] kernel_init+0x127/0x1a8
> [<c057b22b>] ? kernel_init+0x0/0x1a8
> [<c0102db6>] kernel_thread_helper+0x6/0x10
> ------------[ cut here ]------------
> WARNING: at lib/kobject.c:595 kobject_put+0x27/0x3c()
> Hardware name: eserver xSeries 235 -[86717AX]-
> kobject: '' (c11d5fdc): is not initialized, yet kobject_put() is being
> called.
> Modules linked in:
> Pid: 1, comm: swapper Not tainted 2.6.33-autotest-next-20100305 #3
> Call Trace:
> [<c012fe66>] warn_slowpath_common+0x60/0x90
> [<c012feca>] warn_slowpath_fmt+0x24/0x27
> [<c02872c6>] kobject_put+0x27/0x3c
> [<c05a1a9c>] memmap_init+0x5d/0x89
> [<c05a1a3f>] ? memmap_init+0x0/0x89
> [<c0101139>] do_one_initcall+0x4c/0x131
> [<c057b352>] kernel_init+0x127/0x1a8
> [<c057b22b>] ? kernel_init+0x0/0x1a8
> [<c0102db6>] kernel_thread_helper+0x6/0x10
> ---[ end trace 7b6574301a0037c2 ]---
> 
> The results are with today's next, but i think same applies to Linus
> tree as well.

I'm having very difficult time imagining how 22b737f4 could have
affected this as the patch is identical transformation of the previous
code.  Also, 833af842 was released with 2.6.32 and stayed that way, so
it really looks like a memory overrun / random corruption thing.  Can
you please retry with kmalloc debug stuff turned on?

Thanks.

-- 
tejun
