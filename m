From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: percpu tree build warning
Date: Sun, 29 Nov 2009 07:40:19 +0100
Message-ID: <20091129064019.GA19916@elte.hu>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au>
 <200911270846.02717.rusty@rustcorp.com.au>
 <20091127054128.GC13914@elte.hu>
 <200911282021.50315.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:52610 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751937AbZK2Gkg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Nov 2009 01:40:36 -0500
Content-Disposition: inline
In-Reply-To: <200911282021.50315.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>


* Rusty Russell <rusty@rustcorp.com.au> wrote:

> On Fri, 27 Nov 2009 04:11:28 pm Ingo Molnar wrote:
> > 
> > * Rusty Russell <rusty@rustcorp.com.au> wrote:
> > 
> > > On Thu, 26 Nov 2009 12:10:58 am Ingo Molnar wrote:
> > > > While a percpu variable is defined and used in completely different 
> > > > ways:
> > > > 
> > > >   DEFINE_PER_CPU(unsigned long, dr7);
> > > > 
> > > > and is used via:
> > > > 
> > > >   __get_cpu_var(dr7);  [[Fixed -- RR]]
> > > 
> > > The entire point of Tejun's per-cpu work is that &dr7 is now valid. A 
> > > per-cpu pointer as if it were allocated by the dynamic per-cpu 
> > > allocator.
> > >
> > > Your arguments are fine, but out-of-date.
> > 
> > But allowing &dr7 is outright dangerous - and not particularly clean 
> > either.
> 
> That's foolish.  We can now have generic per-cpu function for counters 
> and the like.

So your argument in favor of what i see as at least a mild form of type 
obfusaction is that ... even more obfuscation is upcoming?

I think percpu usage should be spelled out clear and loud. We should not 
pretend they are 'usual' C variables, because they are not. They are 
defined in a special way, they are used via special operators. I sure 
want to make sure that taking an address of one of them:

	ptr = &dr7;

... looks special too.

Just look at the two 'fixes' i quoted in this discussion:

 28b4e0d: x86: Rename global percpu symbol dr7 to cpu_dr7
 11e6635: kernel/hw_breakpoint.c: Fix local/global shadowing

They actually 'solved' the shadowing by renaming the variables to ... 
cpu_. Think about it: the 'I am percpu' prefix came right back - it's 
just now present in a more volatile form and the default usage is 
slightly more dangerous!

I guess i'm a bit more sensitive to percpu complications than you 
because i've seen my fair share of bugs in the scheduler (and 
preemptible/non-preemptible code) related to percpu code (a fair share 
of it introduced by yourself ;-), so the last thing i'd like to see is 
changes that are hiding its nature.

I _use_ percpu code, i dont just write the facilities ;-)

> [...] Again, I'm explaining what you should already know before 
> sending email about this stuff.
> [...]
> Stupidest debate ever.

What i am making is a somewhat subtle technical argument and making any 
progress on it needs at least a minimal form of a working debate. I do 
not claim i am right, but still you are dismissing my arguments in a 
rather nasty way.

... alas, i dont care _that_ much about this and i dont think my 
concerns deserved your ad hominem attacks so i see no point in further 
participating in this thread.

Thanks,

	Ingo
