From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 1/4 tip/sched/core] sched: rename preempt_notifier to
 sched_notifier and always enable it
Date: Fri, 27 Nov 2009 14:38:37 +0900
Message-ID: <4B0F65DD.1090707@kernel.org>
References: <20091126092631.GA17253@elte.hu> <4B0E4EFB.2070705@kernel.org> <20091126095154.GE32275@elte.hu> <4B0E5458.30303@kernel.org> <20091126102936.GA1196@elte.hu> <1259231565.4273.31.camel@twins> <1259234619.4273.32.camel@twins> <20091126115605.GA15189@elte.hu> <1259239259.4273.82.camel@twins> <4B0F356B.3040206@kernel.org> <20091127045209.GA13914@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751472AbZK0FjK@vger.kernel.org>
In-Reply-To: <20091127045209.GA13914@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@elte.hu>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: linux-next.vger.kernel.org

Hello,

11/27/2009 01:52 PM, Ingo Molnar wrote:
> Btw., longer term it will be faster than a mask check and a
> default-untaken conditional: there's ongoign work to offer runtime
> instruction patching features for tracing callbacks.  There's the
> jump patching optimization and also the immediate values patching
> optimization.

Scheduler callbacks won't benefit much from it.  There will always be
workqueues and thus conditional branch will always be necessary.

> We've got old-style notifiers for regular callbacks, we've got new-style 
> tracepoints which are callbacks and event source descriptors - and what 
> i'm asking for is to have _one_ callback mechanism, and to use that in 
> the scheduler. 5 callbacks using 3 different facilities is excessive - 
> i'd like to see just two callbacks using one facility.

The patches in question don't really change anything in in/out paths.
It only adds wake up and sleep callbacks to the existing notifier
mechanism.  Sure, let's unify all of them and make them prettier and
more efficient but I don't think we need to hold up workqueue changes
for that, right?  We can do those in separate steps and have workqueue
changes tested in at least linux-next.

I'll re-post four scheduler patches which reorganize preempt notifier
but make no functional changes and another one to add wakeup and
sleep.  The first four can go into sched/core and the last one in a
separate branch.  That way, conflicts will be minimal yet upstream
won't see any functional difference from the current code.  Later when
notifier frameworks is reworked, we can merge them all up and send
them upstream.  How does it sound?

Thanks.

-- 
tejun
