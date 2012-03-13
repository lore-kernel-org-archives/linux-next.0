From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Date: Tue, 13 Mar 2012 09:09:13 +0000
Message-ID: <20120313090913.GF27560@flint.arm.linux.org.uk>
References: <20120313110840.7b444deb6b1bb902c15f3cdf@canb.auug.org.au> <20120313061622.GA24357@elte.hu> <20120313083310.GA27560@flint.arm.linux.org.uk> <20120313084803.GA6991@elte.hu> <20120313085847.GD27560@flint.arm.linux.org.uk> <20120313090612.GA22820@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:46771 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756870Ab2CMJJe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 Mar 2012 05:09:34 -0400
Content-Disposition: inline
In-Reply-To: <20120313090612.GA22820@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>

From: Catalin Marinas <catalin.marinas@arm.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
        Peter Zijlstra <peterz@infradead.org>
Subject: [GIT PULL] ARM: Remove the __ARCH_WANT_INTERRUPTS_ON_CTXSW
        definition
Delivery-date: Mon, 27 Feb 2012 16:45:17 +0000

Hi Russell,

Could you please pull the context switching patches for ARM, together
with a generic hook acked by PeterZ?

Thanks,

On Tue, Mar 13, 2012 at 10:06:12AM +0100, Ingo Molnar wrote:
> 
> * Russell King <rmk@arm.linux.org.uk> wrote:
> 
> > On Tue, Mar 13, 2012 at 09:48:03AM +0100, Ingo Molnar wrote:
> > > 
> > > * Russell King <rmk@arm.linux.org.uk> wrote:
> > > 
> > > > Please check your mailbox:
> > > > 
> > > > Date: Fri, 20 Jan 2012 17:42:27 +0000
> > > > From: Catalin Marinas <catalin.marinas@arm.com>
> > > > To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
> > > > Cc: Russell King <linux@arm.linux.org.uk>, Ingo Molnar <mingo@elte.hu>,
> > > >         Peter Zijlstra <peterz@infradead.org>,
> > > >         Will Deacon <will.deacon@arm.com>,
> > > >         Frank Rowand <frank.rowand@am.sony.com>
> > > > Subject: [PATCH v3 1/6] sched: Introduce the finish_arch_post_lock_switch()
> > > >         scheduler hook
> > > 
> > > Btw., are you losing emails? Because the reply from peterz to 
> > > those patches, a month ago, was pretty clear:
> > > 
> > > > > Russell, what's the status of these patches? I'd like to see 
> > > > > them land in 3.4 if possible. I'm fine either way, I'll
> > > > >
> > > > > probably ask Ingo to pull your tree so that I can stack some 
> > > > > other patches on top.
> > > 
> > > You never replied to PeterZ's request, you just ignored this 
> > > scheduler maintainer request and you just did it in some 
> > > random way that was most convenient to you many weeks after 
> > > the thread died down, ignoring everyone else's concerns - a 
> > > pretty usual pattern from you I have to say.
> > 
> > Sigh.  You know, people communicate via other methods from 
> > time to time. How the hell do you think PeterZ provided his 
> > ack for the patch?
> 
> He provided it via email to lkml:
> 
>   http://lkml.org/lkml/2012/2/27/210
> 
> But he asked *you* to do a proper Git space solution:
> 
>   http://lkml.org/lkml/2012/2/16/232
> 
> You *never* replied to that request that I can see, you just 
> ignored it, why?

I talked to peterz by other means.  He gave his ack after that message was
sent.  He was fully aware of what was happening.

> This discussion shows that you seem to have basic reading 
> comprehension problems.

And your a fucking idiot too.  Go to hell Ingo and stop being an utter
prat.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
