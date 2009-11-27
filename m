From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: percpu tree build warning
Date: Fri, 27 Nov 2009 07:20:01 +0100
Message-ID: <20091127062001.GA22149@elte.hu>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au>
 <4B0D23A6.8040902@kernel.org>
 <20091125134058.GA9097@elte.hu>
 <200911270846.02717.rusty@rustcorp.com.au>
 <20091127054128.GC13914@elte.hu>
 <4B0F6A67.9010706@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:49341 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751947AbZK0GUY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 01:20:24 -0500
Content-Disposition: inline
In-Reply-To: <4B0F6A67.9010706@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>


* Tejun Heo <tj@kernel.org> wrote:

> Hello,
> 
> 11/27/2009 02:41 PM, Ingo Molnar wrote:
> > But allowing &dr7 is outright dangerous - and not particularly clean 
> > either.
> > 
> > Nothing tells us that it's a percpu variable and it blends into the 
> > regular namespace while most of the operators on it are special 
> > (__get_cpu_var(), per_cpu(), __this_cpu(), etc.).
> > 
> > What if someone writes &dr7 in preemptible code? It's dangerous to do it 
> > and a quick review wont catch the mistake. Seeing &per_cpu_dr7 in 
> > clearly preemptible code does raise alarms on the other hand.
> >
> > So i think it should be valid to take the address of it and unify the 
> > static and dynamic percpu space ... if it's prefixed properly: what's 
> > wrong with &per_cpu_dr7?
> 
> DEFINE_PER_CPU(unsigned long, reg0);
> DEFINE_PER_CPU(unsigned long, reg1);
> 
> static void my_fn(void)
> {
> 	unsigned long reg0 = per_cpu_var(reg0);
> 	unsigned long reg1 = per_cpu_var(reg1);
> 	unsigned long *p = &per_cpu_var(reg0);
> 
> 	// blah blah
> 
> 	if (some cond)
> 		p = &reg1;	// oops meant &per_cpu_var(reg1)
> 
> 	// blah blah
> 
> 	this_cpu_inc(p);

At least to me a typo like this would stick out like a sore thumb during 
review.

I'd recognize &reg1 as a stack local variable immediately, and when i 
see it being used in this_cpu_inc() i'd go 'huh' immediately.

OTOH, the two examples of confusion i gave you in my previous mail would 
be far less obvious. The 'visual distance' to a percpu variable 
definition is greater (it's at least file scope in 95% of the cases), so 
i wouldnt be able to 'see' which the percpu variables are, from a code 
context.

Anyway, YMMV.

Thanks,

	Ingo
