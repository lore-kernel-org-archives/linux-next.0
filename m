From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: percpu tree build warning
Date: Wed, 25 Nov 2009 14:40:58 +0100
Message-ID: <20091125134058.GA9097@elte.hu>
References: <20091125214219.f37935e8.sfr@canb.auug.org.au>
 <20091125105004.GA18163@elte.hu>
 <4B0D23A6.8040902@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:41153 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934772AbZKYNlj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 08:41:39 -0500
Content-Disposition: inline
In-Reply-To: <4B0D23A6.8040902@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Fr??d??ric Weisbecker <fweisbec@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Tejun Heo <tj@kernel.org> wrote:

> > If yes then that needs to be fixed in the percpu tree. per-cpu 
> > variables used to have a __per_cpu prefix and that should be 
> > maintained - the two namespaces are obviously separate on the 
> > logical space, so they should never overlap in the implementational 
> > space either.
> 
> If all we ever have are static variables, the prefix may be fine but 
> with dynamic percpu variables now basically being the same first class 
> citizen but prefix just doesn't cut it.  It just ends up adding more 
> confusion.  The transition will be a bit painful (but not too much, 
> how many of these reports have we had?  Only several) but after that 
> it's just plain local/global symbol collision the compiler would have 
> no problem warning about.  It behaves exactly like other global 
> symbols.
> 
> Percpu symbols and variables belong to a different address space than 
> normal symbols.  Unfortunately, C doesn't have support for such thing. 

That argument does not parse for me. Obviously no sane programming 
language should allow shadowed variables which are used in the same way 
- it's way too easy to use the wrong one.

But we have _no_ real shadowing here - it's a pure artifact of how the 
percpu symbol space is mapped back into C - and the collision (which 
does not exist in the program space) is created where none existed 
before.

In other words: you are solving a problem that does not exist - you 
cannot mix up a local C variable and a percpu variable. The two spaces 
are clearly separated via definition and APIs. A C variable is defined 
via:

  unsigned long *dr7;

and is used via:

  dr7

While a percpu variable is defined and used in completely different 
ways:

  DEFINE_PER_CPU(unsigned long, dr7);

and is used via:

  __get_cpu_var(cpu_dr7);

It's analogous as if we had a 'struct percpu' C structure, and 
dereferenced it via:

 cpu->dr7.

Note that we dont require it to be renamed to cpu->cpu_dr7.

And look at your own 'cleanup' patch - it changes the percpu name to 
'cpu_dr7'. That results in nonsensical repetition:

        dr7 = &__get_cpu_var(cpu_dr7);

I already said it's a percpu variable, via the __get_cpu_var() 
primitive. Why do i have to type cpu_ again to express this, hm?

These kinds of messy interactions between clearly disjunct name spaces 
are bad IMO. And i dont see how dynamic percpu variables change this in 
any way - none of the above is a dynamic percpu variable.

I've applied your patch to not hold things up in linux-next (shadowing 
is dangerous) but i dont see how your arguments add up.

	Ingo
