From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Date: Tue, 13 Mar 2012 09:56:28 +0100
Message-ID: <20120313085628.GB6991@elte.hu>
References: <20120313110840.7b444deb6b1bb902c15f3cdf@canb.auug.org.au>
 <20120313061622.GA24357@elte.hu>
 <20120313083310.GA27560@flint.arm.linux.org.uk>
 <20120313083630.GA10131@elte.hu>
 <20120313084713.GB27560@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:45820 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759565Ab2CMI4l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Mar 2012 04:56:41 -0400
Content-Disposition: inline
In-Reply-To: <20120313084713.GB27560@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Russell King <rmk@arm.linux.org.uk> wrote:

> Sorry, you're blaming the wrong person.  I got the commit via 
> a pull, not via a patch.

This is the most idiotic excuse I've ever read.

Dammit, don't pull code you don't maintain and which you have 
not checked the background of, *especially* not if the 
originating discussion very clearly asked *you* to do it in 
another way.

We were modifying that very code in this development cycle, in 
the scheduler tree - a fact highlighted by the conflict - which 
you could have seen yourself, had you even attempted to 
test-merge your tree to linux-next ...

Let me quote PeterZ again:

> > Russell, what's the status of these patches? I'd like to see 
> > them land in 3.4 if possible. I'm fine either way, I'll
> >
> > probably ask Ingo to pull your tree so that I can stack some 
> > other patches on top.

Russell, read and reply to your mail in a timely and reliable 
fashion, that will avoid such mixups in the future.

> If that's how you want to run your bit of the kernel, then 
> please be more responsive when you're sent patches and say how 
> you want to handle things. Don't ignore patches and then blame 
> people when conflicts happen.

Stop blaming others for your own mistakes, one of the the 
scheduler maintainers replied to the patches a month ago, in an 
absolutely constructive fashion:

  http://lkml.org/lkml/2012/2/16/232

You never replied to PeterZ that I can see.

Again, fortunately it's not a big deal right now - both the 
commit and the conflict is trivial - but your current attitute 
towards applying patches and following discussions is rather sad 
and could cause bigger problems in the future.

Thanks,

	Ingo
