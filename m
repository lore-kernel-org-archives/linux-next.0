From: Manfred Spraul <manfred@colorfullife.com>
Subject: Re: [PATCH 2/2] ipc/sem: sem_lock with hysteresis
Date: Sat, 25 Jun 2016 19:37:41 +0200
Message-ID: <fb23c7da-52a3-5e90-6c45-10e33d80417b@colorfullife.com>
References: <20160615152318.164b1ebd@canb.auug.org.au>
 <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
 <1466280142-19741-2-git-send-email-manfred@colorfullife.com>
 <20160621202902.GB3790@linux-80c1.suse>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:38674 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751123AbcFYRhq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Jun 2016 13:37:46 -0400
Received: by mail-wm0-f43.google.com with SMTP id r201so62461295wme.1
        for <linux-next@vger.kernel.org>; Sat, 25 Jun 2016 10:37:45 -0700 (PDT)
In-Reply-To: <20160621202902.GB3790@linux-80c1.suse>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, felixh@informatik.uni-bremen.de

On 06/21/2016 10:29 PM, Davidlohr Bueso wrote:
> On Sat, 18 Jun 2016, Manfred Spraul wrote:
>
>> sysv sem has two lock modes: One with per-semaphore locks, one lock mode
>> with a single big lock for the whole array.
>> When switching from the per-semaphore locks to the big lock, all
>> per-semaphore locks must be scanned for ongoing operations.
>>
>> The patch adds a hysteresis for switching from the big lock to the per
>> semaphore locks. This reduces how often the per-semaphore locks must
>> be scanned.
>
> Isn't this very arbitrary depending on the workload? Ie the other way 
> around:
> when we have a lot more simple ops going on not so good. While I'm 
> more worried
> about combinations that could cause enough complex ops to always delay 
> taking
> the finer grained lock, this change also obviously makes simple ops 
> more expensive
> on newly created segments.
I

Entering complex mode requires a scan of sem_base[].sem_lock.
>         for (i = 0; i < sma->sem_nsems; i++) {
>                 sem = sma->sem_base + i;
>                 spin_unlock_wait(&sem->lock);
This is what the patch tries to avoid.
>
> In general I don't trust magic numbers much. What sort of numbers have 
> you seen
> with this patch? Is this a real concern (particularly because a lot of 
> the sem->lock
> work was because real world workloads were doing a lot more simple ops 
> afaicr)?
>
With a microbenchmark: As much improvement as you want :-)

- Only simple ops: patch has no impact (the first 10 semops do not matter)
- sleeping complex ops: patch has no impact, we are always in complex mode
- not sleeping complex ops: depends on the size of the array.
With a 4.000 semaphore array, I see an improvement of factor 20.

There is obviously one case where the patch causes a slowdown:
- complex op, then 11 simple ops, then repeat.


Perhaps: set COMPLEX_MODE_ENTER to 1 or 2, then allow to configure it 
from user space.
Or do not merge the patch and wait until someone come with a profile 
that shows complexmode_enter().

--
     Manfred
