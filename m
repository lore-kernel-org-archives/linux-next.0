From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: percpu tree build warning
Date: Sat, 28 Nov 2009 20:21:50 +1030
Message-ID: <200911282021.50315.rusty@rustcorp.com.au>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au> <200911270846.02717.rusty@rustcorp.com.au> <20091127054128.GC13914@elte.hu>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:52899 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752777AbZK1Jvu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 28 Nov 2009 04:51:50 -0500
In-Reply-To: <20091127054128.GC13914@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 27 Nov 2009 04:11:28 pm Ingo Molnar wrote:
> 
> * Rusty Russell <rusty@rustcorp.com.au> wrote:
> 
> > On Thu, 26 Nov 2009 12:10:58 am Ingo Molnar wrote:
> > > While a percpu variable is defined and used in completely different 
> > > ways:
> > > 
> > >   DEFINE_PER_CPU(unsigned long, dr7);
> > > 
> > > and is used via:
> > > 
> > >   __get_cpu_var(dr7);  [[Fixed -- RR]]
> > 
> > The entire point of Tejun's per-cpu work is that &dr7 is now valid. A 
> > per-cpu pointer as if it were allocated by the dynamic per-cpu 
> > allocator.
> >
> > Your arguments are fine, but out-of-date.
> 
> But allowing &dr7 is outright dangerous - and not particularly clean 
> either.

That's foolish.  We can now have generic per-cpu function for counters
and the like.

> Nothing tells us that it's a percpu variable

__percpu.  Again, I'm explaining what you should already know before sending
email about this stuff.

> and it blends into the 
> regular namespace while most of the operators on it are special 
> (__get_cpu_var(), per_cpu(), __this_cpu(), etc.).

OK, you convince Linus to change __user vars to use a prefix.  Then I'll
agree that per_cpu_## is more kernely.

Stupidest debate ever.
Rusty.
