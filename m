From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/4 tip/sched/core] sched: rename preempt_notifier to
 sched_notifier and always enable it
Date: Fri, 27 Nov 2009 08:02:54 +0100
Message-ID: <20091127070254.GA1547@elte.hu>
References: <1259239259.4273.82.camel@twins>
 <4B0F356B.3040206@kernel.org>
 <20091127045209.GA13914@elte.hu>
 <4B0F65DD.1090707@kernel.org>
 <20091127054621.GA25672@elte.hu>
 <4B0F6B32.4090401@kernel.org>
 <20091127061319.GA8620@elte.hu>
 <4B0F6EA9.6070105@kernel.org>
 <20091127062147.GB22149@elte.hu>
 <4B0F73CA.7090804@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:51055 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751650AbZK0HDM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 02:03:12 -0500
Content-Disposition: inline
In-Reply-To: <4B0F73CA.7090804@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Tejun Heo <tj@kernel.org> wrote:

> > Please send all sched.c modifications via the scheduler tree. Going 
> > via other trees is fine when there's agreement by the maintainers - 
> > but this is one of the rare cases where that's not the case.
> 
> Yeah, sure.  So, two patchsets.  One for sched/core doing pure 
> reorganization without any functional changes.  The other for 
> sched/notifier (or whatever name you would prefer) which is purely for 
> development and testing and will not be pushed to Linus unless it 
> receives notifier framework cleanup.  wq#for-next will pull from 
> sched/notifier and be exported to linux-next but it will never be 
> submitted to Linus until sched/notifier is cleaned up.  Am I 
> understanding it correctly?

Yeah, that would be fine.

	Ingo
