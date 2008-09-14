From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip-core build failure
Date: Sun, 14 Sep 2008 20:36:29 +0200
Message-ID: <20080914183629.GA28010@elte.hu>
References: <20080913111423.981554c3.sfr@canb.auug.org.au> <200809131144.36507.rui.p.m.sousa@gmail.com> <20080914124320.GG16097@elte.hu> <20080915040100.5a6f634f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54285 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752903AbYINSgs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 14:36:48 -0400
Content-Disposition: inline
In-Reply-To: <20080915040100.5a6f634f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rui Sousa <rui.p.m.sousa@gmail.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Sun, 14 Sep 2008 14:43:20 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > yes, i agree with that direction. But it's difficult: the non-x86 
> > architectures do not get much testing in practice at the development 
> > stage so trivial build bugs like this get only found at the latest 
> > stage. That's not actually bad in itself - stuff that is not used does 
> > not matter nearly as much as stuff that does get used.
> 
> Well, its not really that difficult, you just have to remember that x86
> is not the whole world [...]

[ ... just used by 90%+ of our active testers/developers ;-) ... ]

> [...] and touching generic code just might affect the other 
> architectures - especially when the code you are touching is using 
> stuff that is clearly implemented by the architectures. Posting stuff 
> like this to linux-arch usually gets some attention (my apologies if 
> you did so, I don't remember seeing it).

hm, you seem to have a bias for powerpc, but you should realize that 
cross-building for 20+ architectures (i.e. increasing the testing 
overhead twenty-fold), to cover the remaining <10% of the test space is 
unreasonable: for many developers it's not just virtually impossible in 
practice but also often a serious waste of time.

Most people who have ever tried to collect cross-compilers for _all_ 
architectures and managed to get them all to work, and then used them 
consistently for all their patches will agree with that.

We want to push unreasonable work to those who depend on the result of 
that unreasonable work - i.e. users/developers of those platforms - not 
everyone else. We dont want to hinder the progress of Linux with blindly 
requiring all patches that happen to touch common .c or .h files to 
successfully build on 20+ odd architectures.

... anyway, no real arguments about this specific case, if a fix/report 
is available we'll integrate/fix the issue.

	Ingo
