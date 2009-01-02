From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Fri, 2 Jan 2009 12:16:39 +0100
Message-ID: <20090102111639.GB20172@elte.hu>
References: <20090102200754.3cd3661c.sfr@canb.auug.org.au> <20090102091456.GB30018@elte.hu> <20090102212242.13f9007e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:38990 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757516AbZABLQu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 06:16:50 -0500
Content-Disposition: inline
In-Reply-To: <20090102212242.13f9007e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Fri, 2 Jan 2009 10:14:56 +0100 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > this has been fixed already a few days ago (if you google for the build 
> > failure string it will send you straight to the fix patch) - i just didnt 
> > push it out to the -next branches yet during the hollidays. (did that now)
> 
> Thanks.
> 
> > Generally if you see a problem with our trees you can check whether an 
> > issue is still present in tip/master:
> > 
> >   http://people.redhat.com/mingo/tip.git/README
> 
> I'll try to remember ...
> 
> [I wish you had stopped there]
> 
> > before duplicating fixing effort and reporting it as a genuine issue - 
> 
> It broke a linux-next build - just how genuine does an issue have to be?

as genuine i mean 'new, unknown issue' - not an issue that has been 
reported to lkml already by testers and has been fixed already.

The thing is, i wouldnt have said that had you not said:

> > [...] A bit more care, please.

i can do without such suggestions in the merge window really - it looked 
rather condescending to me. A lkml search or a trivial google for the 
build failure pattern would have given you a working patch.

	Ingo
