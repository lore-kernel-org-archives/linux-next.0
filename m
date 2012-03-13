From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [GIT PULL/NEXT] sched/arch: Introduce the
 finish_arch_post_lock_switch() scheduler callback
Date: Tue, 13 Mar 2012 11:19:00 +0100
Message-ID: <20120313101859.GA2626@elte.hu>
References: <20120313110840.7b444deb6b1bb902c15f3cdf@canb.auug.org.au>
 <20120313061622.GA24357@elte.hu>
 <20120313083310.GA27560@flint.arm.linux.org.uk>
 <20120313083630.GA10131@elte.hu>
 <20120313084713.GB27560@flint.arm.linux.org.uk>
 <20120313085628.GB6991@elte.hu>
 <20120313090040.GE27560@flint.arm.linux.org.uk>
 <20120313092649.GA15406@elte.hu>
 <20120313095020.GA13220@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:52600 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030191Ab2CMKTZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Mar 2012 06:19:25 -0400
Content-Disposition: inline
In-Reply-To: <20120313095020.GA13220@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>


* Russell King <rmk@arm.linux.org.uk> wrote:

> On Tue, Mar 13, 2012 at 10:26:49AM +0100, Ingo Molnar wrote:
> >
> > As I said it in my first mail, doing that is unnecessary - 
> > but if you insist on being difficult then Catalin, feel free 
> > to pull the patch from tip:sched/arch:
> 
> Nope, I'm not taking the tree anymore, [...]

So instead of saying "sure, lets avoid conflicts next time 
around" you are now *refusing* to take technically perfectly 
fine patches just because another maintainer asked you to use a 
different workflow for future patches? Wow ...

Regardless of the imperfect workflow I certainly find Catalin's 
work useful technically, so I'll send his preparatory commit to 
Linus in this merge window - I hope you will see sense later and 
won't block his subsequent ARM patches...

> [...] you've refused to behave in a reasonable way.  Your 
> problem to sort out now.

For the record, that's utter nonsense:

 - *You* failed to reply on the public thread to sort this out
   properly in the Git space, avoiding conflicts naturally:

      http://lkml.org/lkml/2012/2/16/232

   While generally we don't mind conflicts, I do mind 
   *avoidable* conflicts - and this was such a case.

 - *You* created a conflict by taking a tree that patched some 
   rather old version of the scheduler, shortly before the merge 
   window, when maintainer capacity is the shortest. PeterZ
   is a nice guy who will agree to just about any approach, but 
   I'm quite sure he did not tell you to do *that* ;-)

 - *You* replied to me in a rather dismissive and increasingly
   obnoxious style when I inquired about it constructively:

     http://lkml.org/lkml/2012/3/13/79

There were several easy solutions - I cannot believe that we are 
still arguing this:

 - it literally took me two minutes to create a proper Git
   solution, it's not rocket science. You could have done it, or
   I could have done it for you (as I have done it).

 - Or you could have replied to the public thread, explaining
   why that is not desirable.

 - Or you could have said "sure thing, lets do it that way next
   time around".

Thanks,

	Ingo
