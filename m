From: Mike Galbraith <bitbucket@online.de>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Sat, 18 Jan 2014 16:21:34 +0100
Message-ID: <1390058494.5439.3.camel@marge.simpson.net>
References: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au>
	 <20140116121955.GQ31570@twins.programming.kicks-ass.net>
	 <20140117074628.88698f59939c9002b7c12968@canb.auug.org.au>
	 <20140116222536.GX30183@twins.programming.kicks-ass.net>
	 <20140117093426.ee8e3d1bb2e95c9f67ec625b@canb.auug.org.au>
	 <52D8625C.1000902@zytor.com>
	 <20140117144518.231fa4bccb16a8d7edd36662@canb.auug.org.au>
	 <1390038366.5676.10.camel@marge.simpson.net>
	 <20140118124451.GA30183@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:49662 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752017AbaARPVy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 18 Jan 2014 10:21:54 -0500
In-Reply-To: <20140118124451.GA30183@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2014-01-18 at 13:44 +0100, Peter Zijlstra wrote: 
> On Sat, Jan 18, 2014 at 10:46:06AM +0100, Mike Galbraith wrote:
> > 
> > I hope it doesn't look quite like that, next-20140117 is -ENOBOOT on
> > Q6600 box.  See below for an alternative.
> 
> Urgh, I see, we call the idle arch_cpu_idle() callback with irqs
> disabled.
> 
> Could something like this work?
> 
> 	local_irq_enable();
> 	mwait_idle_with_hints(0,0);
> 
> The interrupt enable window is slightly larger, but I'm not immediately
> seeing a problem with that.

Yup, works just fine.  Less is more.

Nice to see a _progression_ in the pipe too btw.

-Mike
