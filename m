From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/4 tip/sched/core] sched: rename preempt_notifier to
 sched_notifier and always enable it
Date: Fri, 27 Nov 2009 06:46:21 +0100
Message-ID: <20091127054621.GA25672@elte.hu>
References: <20091126095154.GE32275@elte.hu>
 <4B0E5458.30303@kernel.org>
 <20091126102936.GA1196@elte.hu>
 <1259231565.4273.31.camel@twins>
 <1259234619.4273.32.camel@twins>
 <20091126115605.GA15189@elte.hu>
 <1259239259.4273.82.camel@twins>
 <4B0F356B.3040206@kernel.org>
 <20091127045209.GA13914@elte.hu>
 <4B0F65DD.1090707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:43902 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751149AbZK0Fqo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 00:46:44 -0500
Content-Disposition: inline
In-Reply-To: <4B0F65DD.1090707@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Galbraith <efault@gmx.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Tejun Heo <tj@kernel.org> wrote:

> Hello,
> 
> 11/27/2009 01:52 PM, Ingo Molnar wrote:
> > Btw., longer term it will be faster than a mask check and a
> > default-untaken conditional: there's ongoign work to offer runtime
> > instruction patching features for tracing callbacks.  There's the
> > jump patching optimization and also the immediate values patching
> > optimization.
> 
> Scheduler callbacks won't benefit much from it.  There will always be 
> workqueues and thus conditional branch will always be necessary.

Other code will benefit from it though, such as the page fault callbacks 
i already mentioned.

My position on this is rather clear: i want no new callbacks and no 
changes to callbacks in the scheduler until this situation is cleaned 
up. Five callback sites are _way_ too much - so if you want to add 
callbacks or change them, please clean it up and improve it first.

	Ingo
