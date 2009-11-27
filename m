From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: percpu tree build warning
Date: Fri, 27 Nov 2009 06:41:28 +0100
Message-ID: <20091127054128.GC13914@elte.hu>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au>
 <4B0D23A6.8040902@kernel.org>
 <20091125134058.GA9097@elte.hu>
 <200911270846.02717.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:50083 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751063AbZK0Flv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 00:41:51 -0500
Content-Disposition: inline
In-Reply-To: <200911270846.02717.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>


* Rusty Russell <rusty@rustcorp.com.au> wrote:

> On Thu, 26 Nov 2009 12:10:58 am Ingo Molnar wrote:
> > While a percpu variable is defined and used in completely different 
> > ways:
> > 
> >   DEFINE_PER_CPU(unsigned long, dr7);
> > 
> > and is used via:
> > 
> >   __get_cpu_var(dr7);  [[Fixed -- RR]]
> 
> The entire point of Tejun's per-cpu work is that &dr7 is now valid. A 
> per-cpu pointer as if it were allocated by the dynamic per-cpu 
> allocator.
>
> Your arguments are fine, but out-of-date.

But allowing &dr7 is outright dangerous - and not particularly clean 
either.

Nothing tells us that it's a percpu variable and it blends into the 
regular namespace while most of the operators on it are special 
(__get_cpu_var(), per_cpu(), __this_cpu(), etc.).

What if someone writes &dr7 in preemptible code? It's dangerous to do it 
and a quick review wont catch the mistake. Seeing &per_cpu_dr7 in 
clearly preemptible code does raise alarms on the other hand.

So i think it should be valid to take the address of it and unify the 
static and dynamic percpu space ... if it's prefixed properly: what's 
wrong with &per_cpu_dr7?

Either make it fully blend in or keep it separate - but dont do it 
half-ways, that's only causing confusion down the road. Furthermore, i 
think per cpu logic and code is tricky enough to be documented clearly, 
every time it's used. We have bugs with such code again and again, and 
disproportionately so.

So AFAICS this change is going in exactly the wrong direction, makes the 
percpu code less readable and more obstructed and more inconsistent, and 
does it for all the wrong reasons and is causing some collateral damage 
as well.

	Ingo
