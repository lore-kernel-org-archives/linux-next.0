From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use by modules.
Date: Thu, 23 Apr 2009 22:25:30 +0900
Message-ID: <20090423132530.GA26887@linux-sh.org>
References: <20090416030704.GH16961@linux-sh.org> <49E6E816.8010709@panasas.com> <20090423065006.GB21733@linux-sh.org> <49F03F26.4060103@panasas.com> <20090423102930.GA24434@linux-sh.org> <1240491589.8240.42.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:45461 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864AbZDWNal (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2009 09:30:41 -0400
Content-Disposition: inline
In-Reply-To: <1240491589.8240.42.camel@heimdal.trondhjem.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Benny Halevy <bhalevy@panasas.com>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Beregalov <a.beregalov@gmail.com>, Subrata Modak <subrata@linux.vnet.ibm.com>, sachinp <sachinp@linux.vnet.ibm.com>

On Thu, Apr 23, 2009 at 08:59:49AM -0400, Trond Myklebust wrote:
> On Thu, 2009-04-23 at 19:29 +0900, Paul Mundt wrote:
> > I was under the impression that a tree that caused a build regression
> > would be dropped until it had it sorted out, but that seems to be more
> > the exception than the rule.
> > 
> > -next is good at finding bugs in build configurations folks haven't
> > considered, which should serve as a pretty good platform for getting
> > those types of fixes merged quickly, whether it be in to the tree that
> > caused the regression or -next directly.
> > 
> > Unfortunately it seems like build regressions are more of an afterthought
> > than a show stopper. I count at least 3 on the sh builds in the last
> > couple weeks that are all averaging a week or longer to unbreak, while
> > patches have been available almost immediately.
> 
> In this case, the tree in question is exposing a bug that already exists
> in mainline; a function that is explicitly labelled as being exported
> for use by arbitrary modules, and yet isn't being compiled into the
> kernel. Shooting the messenger isn't going to fix that.
> 
Nor is bantering on semantics going to change the fact that you caused a
build regression and have so far refused to even acknowledge that that is
a problem. If anyone had bothered to test the module build, this would
have shown up immediately and would have rightly been fixed before that
change was merged. Claiming that the two are completely unrelated after
the fact is rather disingenuous, and does nothing to address the process
problem.

> In any case, this patch does not belong in the NFS tree since it touches
> generic library code, not NFS code. Benny, if nobody else wants to
> shepherd it, then just send it directly to Linus.
> 
That's a complete cop-out, if there had been no export at all how would
you have proceeded? How is this situation any different?

I am willing to monitor my builds regularly and send out trivial patches
to fix whatever ends up breaking, but I do expect people who have caused
regressions to take these matters seriously rather than sweep them under
the carpet and pretend like they either don't exist or are somehow
someone else's problem.

Any tree that causes a regression should simply be dropped until it gets
it sorted out, as it's abundantly obvious that people aren't even
prepared to do the bare minimum to keep things working after they've been
pulled from.
