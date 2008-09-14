From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: tip-core build failure
Date: Sun, 14 Sep 2008 21:17:09 +0200
Message-ID: <20080914191709.GA3246@elte.hu>
References: <20080913111423.981554c3.sfr@canb.auug.org.au> <200809131144.36507.rui.p.m.sousa@gmail.com> <20080914124320.GG16097@elte.hu> <20080915040100.5a6f634f.sfr@canb.auug.org.au> <20080914183629.GA28010@elte.hu> <20080915050234.3519203a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:44540 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755881AbYINTRX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 14 Sep 2008 15:17:23 -0400
Content-Disposition: inline
In-Reply-To: <20080915050234.3519203a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rui Sousa <rui.p.m.sousa@gmail.com>, linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Sun, 14 Sep 2008 20:36:29 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > 
> > > Well, its not really that difficult, you just have to remember that x86
> > > is not the whole world [...]
> > 
> > [ ... just used by 90%+ of our active testers/developers ;-) ... ]
> 
> An irrelevant argument in this case.

why is the actual usage distribution of Linux irrelevant? We make 
maintenance and testing prioritization based on usage and popularity on 
a daily basis: for example an unfixed bug in ext3 can easily stall an 
-rc or a stable release - an unfixed bug in freevxfs wont.

> > hm, you seem to have a bias for powerpc, but you should realize that
> 
> And you seem to have a bias for x86, so what!

Well, having a bias towards the most popular code and most popular 
devices and platforms is not just acceptable and it is not just common 
sense - it's also a basic required skill from any Linux subsystem 
maintainer. Ignoring the most popular usage would be silly and 
counter-productive.

And that requirement can be turned around to a certain degree: having an 
unreasonable bias _against_ popular platforms is counterproductive. I.e. 
you should weigh whether forcing the unreasonable use of our testing and 
development resources is good for Linux.

> > cross-building for 20+ architectures (i.e. increasing the testing 
> > overhead twenty-fold), to cover the remaining <10% of the test space 
> > is unreasonable: for many developers it's not just virtually 
> > impossible in practice but also often a serious waste of time.
> 
> I am not asking for that.
>
> > We want to push unreasonable work to those who depend on the result 
> > of that unreasonable work - i.e. users/developers of those platforms 
> > - not everyone else. We dont want to hinder the progress of Linux 
> > with blindly requiring all patches that happen to touch common .c or 
> > .h files to successfully build on 20+ odd architectures.
> 
> But doing at least a simple grep for usages of the thing you are 
> changing, that is not unreasonable ...  especially if you are changing 
> (usually not well defined in the first place) interfaces that the 
> architectures have had to implement (as was the case here).

this assumes that the connection is realized. It was not realized in 
this case.

> > ... anyway, no real arguments about this specific case, if a 
> > fix/report is available we'll integrate/fix the issue.
> 
> Thanks.
> 
> Besides, Ingo, many of the TIP trees (as I understand them) are not 
> x86 specific, so expecting them to build on more than one architecture 
> is not unreasonable.  This is part of the job of the integrator ...

we cross-build them (and fix the bugs, if any are found), but it's all 
driven by demand really or when we suspect there might be cross-arch 
breakage (it wasnt in this case). If i have the choice between analysing 
and fixing a bug that was reported by a real user and spending hours on 
cross-builds i do chose the one that helps Linux more.

	Ingo
