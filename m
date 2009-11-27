From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 1/4 tip/sched/core] sched: rename preempt_notifier to
 sched_notifier and always enable it
Date: Fri, 27 Nov 2009 15:38:02 +0900
Message-ID: <4B0F73CA.7090804@kernel.org>
References: <1259234619.4273.32.camel@twins> <20091126115605.GA15189@elte.hu> <1259239259.4273.82.camel@twins> <4B0F356B.3040206@kernel.org> <20091127045209.GA13914@elte.hu> <4B0F65DD.1090707@kernel.org> <20091127054621.GA25672@elte.hu> <4B0F6B32.4090401@kernel.org> <20091127061319.GA8620@elte.hu> <4B0F6EA9.6070105@kernel.org> <20091127062147.GB22149@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:60257 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750729AbZK0Gi1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 01:38:27 -0500
In-Reply-To: <20091127062147.GB22149@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Hello,

11/27/2009 03:21 PM, Ingo Molnar wrote:
>> No, I'm not gonna do that.  Just patches to reorganize code so that 
>> unnecessary conflicts won't occur.  There will be NO functional 
>> changes.
> 
> Not without the other changes - which you want to do too, right?

The extra things I want can stay in a devel branch until notifiers get
cleaned up and it will only be a few patches which aren't very likely
to cause conflicts when it gets exported for linux-next or other
testing branches.

> Please send all sched.c modifications via the scheduler tree. Going
> via other trees is fine when there's agreement by the maintainers -
> but this is one of the rare cases where that's not the case.

Yeah, sure.  So, two patchsets.  One for sched/core doing pure
reorganization without any functional changes.  The other for
sched/notifier (or whatever name you would prefer) which is purely for
development and testing and will not be pushed to Linus unless it
receives notifier framework cleanup.  wq#for-next will pull from
sched/notifier and be exported to linux-next but it will never be
submitted to Linus until sched/notifier is cleaned up.  Am I
understanding it correctly?

Thanks.

-- 
tejun
