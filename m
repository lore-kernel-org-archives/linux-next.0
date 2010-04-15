From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: PowerPC WARN_ON_ONCE() after merge of the final
	tree (tip related)
Date: Thu, 15 Apr 2010 19:24:22 +0200
Message-ID: <20100415172421.GB5069@nowhere>
References: <20100415161214.04637496.sfr@canb.auug.org.au> <20100415064940.GA9240@elte.hu> <20100415130032.GA6789@nowhere> <20100415140358.GA19981@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pz0-f204.google.com ([209.85.222.204]:40443 "EHLO
	mail-pz0-f204.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755152Ab0DORY0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Apr 2010 13:24:26 -0400
Content-Disposition: inline
In-Reply-To: <20100415140358.GA19981@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Thu, Apr 15, 2010 at 04:03:58PM +0200, Ingo Molnar wrote:
> > 
> > 
> > diff --git a/kernel/lockdep.c b/kernel/lockdep.c
> > index 78325f8..65d4336 100644
> > --- a/kernel/lockdep.c
> > +++ b/kernel/lockdep.c
> > @@ -2298,7 +2298,11 @@ void trace_hardirqs_on_caller(unsigned long ip)
> >  		return;
> >  
> >  	if (unlikely(curr->hardirqs_enabled)) {
> > +		unsigned long flags;
> > +
> > +		raw_local_irq_save(flags);
> >  		debug_atomic_inc(redundant_hardirqs_on);
> > +		raw_local_irq_restore(flags);
> >  		return;
> >  	}
> >  	/* we'll do an OFF -> ON transition: */
> 
> that looks rather ugly. Why not do a raw:
> 
> 	this_cpu_inc(lockdep_stats.redundant_hardirqs_on);
> 
> which basically open-codes debug_atomic_inc(), but without the warning?


There is also no guarantee we are in a non-preemptable section. We can then
also race against another cpu.

I'm not sure what to do.
