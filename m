From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: PowerPC WARN_ON_ONCE() after merge of the final
	tree (tip related)
Date: Fri, 16 Apr 2010 14:32:12 +0200
Message-ID: <20100416123208.GA5162@nowhere>
References: <20100415161214.04637496.sfr@canb.auug.org.au> <20100415064940.GA9240@elte.hu> <20100415130032.GA6789@nowhere> <20100415140358.GA19981@elte.hu> <20100415171551.GA5069@nowhere> <1271414323.4807.1931.camel@twins>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ww0-f46.google.com ([74.125.82.46]:55016 "EHLO
	mail-ww0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752746Ab0DPMcN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2010 08:32:13 -0400
Content-Disposition: inline
In-Reply-To: <1271414323.4807.1931.camel@twins>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Fri, Apr 16, 2010 at 12:38:43PM +0200, Peter Zijlstra wrote:
> On Thu, 2010-04-15 at 19:15 +0200, Frederic Weisbecker wrote:
> > > that looks rather ugly. Why not do a raw:
> > > 
> > >       this_cpu_inc(lockdep_stats.redundant_hardirqs_on);
> > > 
> > > which basically open-codes debug_atomic_inc(), but without the warning?
> > 
> > 
> > Because that would open a race against interrupts that might
> > touch lockdep_stats.redundant_hardirqs_on too.
> 
> 
> How so, its a pure per-cpu variable right? so either the increment
> happens before the interrupts hits, or after, in either case there
> should not be a race with interrupts.


In x86 yeah, I guess the compiler simply loads the address
and does an inc directly, which is atomic wrt interrupts.

But what about another arch that would need an intermediate
load of the value:

load val, reg
add reg, 1
		<---interrupt here
store reg, val
