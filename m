From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Date: Tue, 13 Mar 2012 10:06:12 +0100
Message-ID: <20120313090612.GA22820@elte.hu>
References: <20120313110840.7b444deb6b1bb902c15f3cdf@canb.auug.org.au>
 <20120313061622.GA24357@elte.hu>
 <20120313083310.GA27560@flint.arm.linux.org.uk>
 <20120313084803.GA6991@elte.hu>
 <20120313085847.GD27560@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:59996 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758229Ab2CMJGW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Mar 2012 05:06:22 -0400
Content-Disposition: inline
In-Reply-To: <20120313085847.GD27560@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Russell King <rmk@arm.linux.org.uk> wrote:

> On Tue, Mar 13, 2012 at 09:48:03AM +0100, Ingo Molnar wrote:
> > 
> > * Russell King <rmk@arm.linux.org.uk> wrote:
> > 
> > > Please check your mailbox:
> > > 
> > > Date: Fri, 20 Jan 2012 17:42:27 +0000
> > > From: Catalin Marinas <catalin.marinas@arm.com>
> > > To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
> > > Cc: Russell King <linux@arm.linux.org.uk>, Ingo Molnar <mingo@elte.hu>,
> > >         Peter Zijlstra <peterz@infradead.org>,
> > >         Will Deacon <will.deacon@arm.com>,
> > >         Frank Rowand <frank.rowand@am.sony.com>
> > > Subject: [PATCH v3 1/6] sched: Introduce the finish_arch_post_lock_switch()
> > >         scheduler hook
> > 
> > Btw., are you losing emails? Because the reply from peterz to 
> > those patches, a month ago, was pretty clear:
> > 
> > > > Russell, what's the status of these patches? I'd like to see 
> > > > them land in 3.4 if possible. I'm fine either way, I'll
> > > >
> > > > probably ask Ingo to pull your tree so that I can stack some 
> > > > other patches on top.
> > 
> > You never replied to PeterZ's request, you just ignored this 
> > scheduler maintainer request and you just did it in some 
> > random way that was most convenient to you many weeks after 
> > the thread died down, ignoring everyone else's concerns - a 
> > pretty usual pattern from you I have to say.
> 
> Sigh.  You know, people communicate via other methods from 
> time to time. How the hell do you think PeterZ provided his 
> ack for the patch?

He provided it via email to lkml:

  http://lkml.org/lkml/2012/2/27/210

But he asked *you* to do a proper Git space solution:

  http://lkml.org/lkml/2012/2/16/232

You *never* replied to that request that I can see, you just 
ignored it, why?

This discussion shows that you seem to have basic reading 
comprehension problems.

Thanks,

	Ingo
