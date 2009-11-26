From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/4 tip/sched/core] sched: rename preempt_notifier to
 sched_notifier and always enable it
Date: Thu, 26 Nov 2009 12:56:05 +0100
Message-ID: <20091126115605.GA15189@elte.hu>
References: <20091126190018.88a6dd77.sfr@canb.auug.org.au>
 <20091126081237.GA31034@elte.hu>
 <4B0E4741.10509@kernel.org>
 <20091126092631.GA17253@elte.hu>
 <4B0E4EFB.2070705@kernel.org>
 <20091126095154.GE32275@elte.hu>
 <4B0E5458.30303@kernel.org>
 <20091126102936.GA1196@elte.hu>
 <1259231565.4273.31.camel@twins>
 <1259234619.4273.32.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:52678 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759696AbZKZL4W (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 06:56:22 -0500
Content-Disposition: inline
In-Reply-To: <1259234619.4273.32.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, =?unknown-8bit?B?RnLDqWTDqXJpYw==?= Weisbecker <fweisbec@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, 2009-11-26 at 11:32 +0100, Peter Zijlstra wrote:
> > On Thu, 2009-11-26 at 11:29 +0100, Ingo Molnar wrote:
> > > * Tejun Heo <tj@kernel.org> wrote:
> > > 
> > > > Rename preempt_notifier to sched_notifier, move it from preempt.h to 
> > > > sched.h, drop sched_ prefixes from ops names and make sched_notifier 
> > > > always enabled.
> > > > 
> > > > This is to prepare for adding more notification hooks.  This patch 
> > > > doesn't make any functional changes.
> > > 
> > > The sched notifiers and the various event notifiers we have in the same 
> > > codepaths should really be unified into a single callback framework.
> > > 
> > > We have these _5_ callbacks:
> > > 
> > > ....
> > >         perf_event_task_sched_out(prev, next, cpu);
> > > ....
> > >         fire_sched_out_notifiers(prev, next);
> > > ....
> > >         trace_sched_switch(rq, prev, next);
> > > ....
> > >         perf_event_task_sched_in(current, cpu_of(rq));
> > > 	fire_sched_in_notifiers(current);
> > > ....
> > > 
> > > That could be done with just two callbacks - one for sched-out, one for 
> > > sched-in.
> > > 
> > > The best way to do that would be to use two TRACE_EVENT() callbacks, 
> > > make them unconditional and register to them. (with wrappers to make it 
> > > all convenient to use)
> > > 
> > > This requires some work but needs to be done.
> > 
> > Ugh,.. it also makes TRACE_EVENT unconditional.
> > 
> > That really wants a separate option.. What we could do is take regular
> > notifier lists and extend them to auto-generate a tracepoint when the
> > trace stuff is enabled or something.

I wouldnt mind some form of TRACE_EVENT_CALLBACK() thing whose callback 
facility is always available, even if CONFIG_PERF_EVENTS and 
CONFIG_TRACING is disabled.

It might grow out of notifier.h - albeit i suspect the shorter path 
would be to grow it from TRACE_EVENT().

( The various pagefault notifiers in arch/x86/mm/fault.c could use this 
  facility too. )

What we definitely dont want is the proliferation of callbacks.

> Also, there is this thing about direct and indirect function calls.

Yeah. The norm would be for those points to be disabled and have near 
zero overhead. If it has callbacks registered it should be light-weight.

	Ingo
