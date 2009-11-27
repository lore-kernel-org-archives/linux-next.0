From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/4 tip/sched/core] sched: rename preempt_notifier to
 sched_notifier and always enable it
Date: Fri, 27 Nov 2009 05:52:09 +0100
Message-ID: <20091127045209.GA13914@elte.hu>
References: <20091126092631.GA17253@elte.hu>
 <4B0E4EFB.2070705@kernel.org>
 <20091126095154.GE32275@elte.hu>
 <4B0E5458.30303@kernel.org>
 <20091126102936.GA1196@elte.hu>
 <1259231565.4273.31.camel@twins>
 <1259234619.4273.32.camel@twins>
 <20091126115605.GA15189@elte.hu>
 <1259239259.4273.82.camel@twins>
 <4B0F356B.3040206@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:41399 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752053AbZK0ExG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 26 Nov 2009 23:53:06 -0500
Content-Disposition: inline
In-Reply-To: <4B0F356B.3040206@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Tejun Heo <tj@kernel.org> wrote:

> Hello, Peter, Ingo.
> 
> 11/26/2009 09:40 PM, Peter Zijlstra wrote:
> > CALLBACK_EVENT() would be my preferred name, and shouldn't live anywhere
> > near the regular tracing bits, the tracing bits could simply add another
> > callback in it when enabled.
> 
> I haven't looked at the mm code but if the scheduler callback 
> requirement isn't gonna explode big time soon and we know which 
> functions are the candidate callbacks at build time, I think this can 
> be done pretty efficiently with an ulong enable mask per task and 
> fixed function dispatch such that no callback case just goes through 
> one likely() conditional test at the tracing point and callback cases 
> are dispatched using conditional direct jump.

Yes - and that's what the tracepoints infrastructure is about.

Btw., longer term it will be faster than a mask check and a 
default-untaken conditional: there's ongoign work to offer runtime 
instruction patching features for tracing callbacks. There's the jump 
patching optimization and also the immediate values patching 
optimization.

We've got old-style notifiers for regular callbacks, we've got new-style 
tracepoints which are callbacks and event source descriptors - and what 
i'm asking for is to have _one_ callback mechanism, and to use that in 
the scheduler. 5 callbacks using 3 different facilities is excessive - 
i'd like to see just two callbacks using one facility.

	Ingo
