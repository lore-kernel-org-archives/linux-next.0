From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure
Date: Tue, 29 Jul 2008 09:26:03 -0700 (PDT)
Message-ID: <alpine.LFD.1.10.0807290918460.3334@nehalem.linux-foundation.org>
References: <20080729162300.733b3e09.sfr@canb.auug.org.au> <20080729080055.GA28916@elte.hu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:59686 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751608AbYG2Q31 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 29 Jul 2008 12:29:27 -0400
In-Reply-To: <20080729080055.GA28916@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mike Travis <travis@sgi.com>



On Tue, 29 Jul 2008, Ingo Molnar wrote:
>
> > @@ -287,7 +287,7 @@ static inline const cpumask_t *get_cpu_mask(unsigned int cpu)
> >   * gcc optimizes it out (it's a constant) and there's no huge stack
> >   * variable created:
> >   */
> > -#define cpumask_of_cpu(cpu) ({ *get_cpu_mask(cpu); })
> > +#define cpumask_of_cpu(cpu) (*get_cpu_mask(cpu))
> 
> hm, i'm wondering - is this a compiler bug?

Not necessarily. The code is fragile.

Doing a statement expression basically creates a new temporary variable 
with pretty much undefined scope. Taking the address of it *may* be 
optimized away to the original cpu_mask pointer, but it's not really a 
well-defined operation: there really _is_ a local temporary variable, and 
if you were to change things through the address-of thing, gcc would be 
buggy if it had done the optimization.

So the "address-of statement expression" really is a dubious construct.

That said, the change that Stephen introduces is _not_ a no-op. It very 
fundamentally changes the code - exactly because now there is no temporary 
value created any more: it's a real lvalue, and now anybody who does 
&cpumask_of_cpu(cpu) will fundamentally get the original pointer back, 
except it has lost the "const".

And that's actually dangerous - exactly because it now loses the "const" 
thing, there may be people who end up modifying the result without 
getting any compile-time warnings.

I would _seriously_ suggest that both the original code and Stephen's 
modified version is really bad. And you should have taken my interface 
as-is - one that returns a "const cpumask_t *", and nothing else. 

Anything else is simply fundamentally broken.

			Linus
