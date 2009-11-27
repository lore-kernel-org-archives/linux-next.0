From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: percpu tree build warning
Date: Fri, 27 Nov 2009 14:57:59 +0900
Message-ID: <4B0F6A67.9010706@kernel.org>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au> <4B0D23A6.8040902@kernel.org> <20091125134058.GA9097@elte.hu> <200911270846.02717.rusty@rustcorp.com.au> <20091127054128.GC13914@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:56349 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751779AbZK0F6P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Nov 2009 00:58:15 -0500
In-Reply-To: <20091127054128.GC13914@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

Hello,

11/27/2009 02:41 PM, Ingo Molnar wrote:
> But allowing &dr7 is outright dangerous - and not particularly clean 
> either.
> 
> Nothing tells us that it's a percpu variable and it blends into the 
> regular namespace while most of the operators on it are special 
> (__get_cpu_var(), per_cpu(), __this_cpu(), etc.).
> 
> What if someone writes &dr7 in preemptible code? It's dangerous to do it 
> and a quick review wont catch the mistake. Seeing &per_cpu_dr7 in 
> clearly preemptible code does raise alarms on the other hand.
>
> So i think it should be valid to take the address of it and unify the 
> static and dynamic percpu space ... if it's prefixed properly: what's 
> wrong with &per_cpu_dr7?

DEFINE_PER_CPU(unsigned long, reg0);
DEFINE_PER_CPU(unsigned long, reg1);

static void my_fn(void)
{
	unsigned long reg0 = per_cpu_var(reg0);
	unsigned long reg1 = per_cpu_var(reg1);
	unsigned long *p = &per_cpu_var(reg0);

	// blah blah

	if (some cond)
		p = &reg1;	// oops meant &per_cpu_var(reg1)

	// blah blah

	this_cpu_inc(p);
}

It's more dangerous to depend on the pseudo namespace created by
prefixing.  Let's add __percpu sparse annotations.  It will be more
flexible and safer.

Thanks.

-- 
tejun
