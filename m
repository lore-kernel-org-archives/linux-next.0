From: Manfred Spraul <manfred@colorfullife.com>
Subject: Re: [PATCH 1/2] ipc/sem.c: Fix complex_count vs. simple op race
Date: Thu, 23 Jun 2016 20:55:06 +0200
Message-ID: <c484baa7-f34d-03b5-c5b9-ad922b1f5a58@colorfullife.com>
References: <20160615152318.164b1ebd@canb.auug.org.au>
 <1466280142-19741-1-git-send-email-manfred@colorfullife.com>
 <20160620160456.a07982236e08d6d6be4cd442@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35077 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbcFWSzJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Jun 2016 14:55:09 -0400
Received: by mail-wm0-f65.google.com with SMTP id a66so13262288wme.2
        for <linux-next@vger.kernel.org>; Thu, 23 Jun 2016 11:55:09 -0700 (PDT)
In-Reply-To: <20160620160456.a07982236e08d6d6be4cd442@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, 1vier1@web.de, Davidlohr Bueso <dave@stgolabs.net>, felixh@informatik.uni-bremen.de, stable@vger.kernel.org

On 06/21/2016 01:04 AM, Andrew Morton wrote:
> On Sat, 18 Jun 2016 22:02:21 +0200 Manfred Spraul <manfred@colorfullife.com> wrote:
>
>> Commit 6d07b68ce16a ("ipc/sem.c: optimize sem_lock()") introduced a race:
>>
>> sem_lock has a fast path that allows parallel simple operations.
>> There are two reasons why a simple operation cannot run in parallel:
>> - a non-simple operations is ongoing (sma->sem_perm.lock held)
>> - a complex operation is sleeping (sma->complex_count != 0)
>>
>> As both facts are stored independently, a thread can bypass the current
>> checks by sleeping in the right positions. See below for more details
>> (or kernel bugzilla 105651).
>>
>> The patch fixes that by creating one variable (complex_mode)
>> that tracks both reasons why parallel operations are not possible.
>>
>> The patch also updates stale documentation regarding the locking.
>>
>> With regards to stable kernels:
>> The patch is required for all kernels that include the commit 6d07b68ce16a
>> ("ipc/sem.c: optimize sem_lock()") (3.10?)
> I've had this in -mm (and -next) since January 4, without issues.  I
> put it on hold because Davidlohr expressed concern about performance
> regressions.
I had several ideas how to fix it. The initial ideas probably had 
performance issue.

The current one doesn't have any issues. It just took longer than 
expected to test it.
> Your [2/2] should prevent those regressions (yes?) so I assume that any
> kernel which has [1/2] really should have [2/2] as well.  But without
> any quantitative information, this is all mad guesswork.
>
> What to do?
[2/2] is an improvement, it handles one case better than the current code.
If you want:
3.10 improved scalability, but it introduced a performance regression 
for one use case.
[with 3.10, simple ops got parallel, but complex ops had to perform a 
"for_each_sem() {spin_unlock_wait()}"]
The patch fixes that.


--
     Manfred
