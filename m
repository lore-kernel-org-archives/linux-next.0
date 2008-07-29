From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: build failure
Date: Tue, 29 Jul 2008 07:31:49 -0700
Message-ID: <488F29D5.1080105@sgi.com>
References: <20080729180317.94c64634.sfr@canb.auug.org.au> <20080729085815.GA1301@elte.hu> <20080729202731.F18F.KOSAKI.MOTOHIRO@jp.fujitsu.com> <20080729114029.GA3836@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.171.30]:33942 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754968AbYG2Obw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 10:31:52 -0400
In-Reply-To: <20080729114029.GA3836@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus <torvalds@linux-foundation.org>

Ingo Molnar wrote:
> * KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com> wrote:
> 
>>> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>>> Hi Ingo,
>>>>
>>>> On Tue, 29 Jul 2008 10:00:55 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>>>>>> -#define cpumask_of_cpu(cpu) ({ *get_cpu_mask(cpu); })
>>>>>> +#define cpumask_of_cpu(cpu) (*get_cpu_mask(cpu))
>>>>> hm, i'm wondering - is this a compiler bug?
>>>> Or maybe a deficiency in such an old compiler (v3.4.5) but the fix 
>>>> makes sense anyway, right?
>>> yeah, i was just wondering.
>> in linux/README
>>
>> COMPILING the kernel:
>>
>>  - Make sure you have at least gcc 3.2 available.
>>    For more information, refer to Documentation/Changes.
>>
>> So, if 3.4.5 is old, Should we change readme?
> 
> the fix is simple enough.
> 
> but the question is, wont it generate huge artificial stackframes with 
> CONFIG_MAXSMP and NR_CPUS=4096? Maybe it is unable to figure out and 
> simplify the arithmetics there - or something like that.
> 
> 	Ingo

I've looked at stack frames quite extensively and usually they are
not generated unless you explicitly use a named cpumask variable,
pass a cpumask by value, expect a cpumask function return, create
an initializer that contains a cpumask field, and (probably a couple
more I missed).

Almost all others are done efficiently via pointers or simple
struct copies:

	cpus_xxx(*cpumask_of_cpu(), ...
	struct->cpumask_var = *cpumask_of_cpu()
	global_cpumask_var = *cpumask_of_cpu()
	etc.

Thanks,
Mike
