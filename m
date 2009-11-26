From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/4 tip/sched/core] sched: rename preempt_notifier to
 sched_notifier and always enable it
Date: Thu, 26 Nov 2009 11:29:36 +0100
Message-ID: <20091126102936.GA1196@elte.hu>
References: <20091126190018.88a6dd77.sfr@canb.auug.org.au>
 <20091126081237.GA31034@elte.hu>
 <4B0E4741.10509@kernel.org>
 <20091126092631.GA17253@elte.hu>
 <4B0E4EFB.2070705@kernel.org>
 <20091126095154.GE32275@elte.hu>
 <4B0E5458.30303@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:51970 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759357AbZKZK3s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 05:29:48 -0500
Content-Disposition: inline
In-Reply-To: <4B0E5458.30303@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>


* Tejun Heo <tj@kernel.org> wrote:

> Rename preempt_notifier to sched_notifier, move it from preempt.h to 
> sched.h, drop sched_ prefixes from ops names and make sched_notifier 
> always enabled.
> 
> This is to prepare for adding more notification hooks.  This patch 
> doesn't make any functional changes.

The sched notifiers and the various event notifiers we have in the same 
codepaths should really be unified into a single callback framework.

We have these _5_ callbacks:

...
        perf_event_task_sched_out(prev, next, cpu);
...
        fire_sched_out_notifiers(prev, next);
...
        trace_sched_switch(rq, prev, next);
...
        perf_event_task_sched_in(current, cpu_of(rq));
	fire_sched_in_notifiers(current);
...

That could be done with just two callbacks - one for sched-out, one for 
sched-in.

The best way to do that would be to use two TRACE_EVENT() callbacks, 
make them unconditional and register to them. (with wrappers to make it 
all convenient to use)

This requires some work but needs to be done.

	Ingo
