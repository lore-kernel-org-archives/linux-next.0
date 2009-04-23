From: Trond Myklebust <Trond.Myklebust@netapp.com>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use
 by modules.
Date: Thu, 23 Apr 2009 08:59:49 -0400
Message-ID: <1240491589.8240.42.camel@heimdal.trondhjem.org>
References: <20090416030704.GH16961@linux-sh.org>
	 <49E6E816.8010709@panasas.com> <20090423065006.GB21733@linux-sh.org>
	 <49F03F26.4060103@panasas.com>  <20090423102930.GA24434@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.netapp.com ([216.240.18.37]:50217 "EHLO mx2.netapp.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752079AbZDWNA0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 09:00:26 -0400
In-Reply-To: <20090423102930.GA24434@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>
Cc: Benny Halevy <bhalevy@panasas.com>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Beregalov <a.beregalov@gmail.com>, Subrata Modak <subrata@linux.vnet.ibm.com>, sachinp <sachinp@linux.vnet.ibm.com>

On Thu, 2009-04-23 at 19:29 +0900, Paul Mundt wrote:
> On Thu, Apr 23, 2009 at 01:12:54PM +0300, Benny Halevy wrote:
> > On Apr. 23, 2009, 9:50 +0300, Paul Mundt <lethal@linux-sh.org> wrote:
> > > Ok, so we have two different trivial patches for fixing the same thing,
> > > and a week later it is still broken.
> > > 
> > > I realize it is a trivial patch, but it does break builds. If folks
> > > aren't going to take these sorts of things more seriously, then their
> > > tree should be dropped after a grace period (say 2 days or so).
> > > 
> > > Beyond that, it doesn't seem like -next has any sort of coherent policy
> > > for dealing with trivial patches. If the emphasis is on the tree that
> > > introduced the regression to deal with it, then trees need to be
> > > aggressively dropped when these things go unfixed.
> > > 
> > > Having builds broken for a week for an issue that has been spotted and
> > > fixed by several people is simply unacceptable.
> > 
> > Paul, that's a valid point but I don't set these polices.
> > Trond suggested to just commit this to 2.6.30
> > and I asked Rusty's Ack here:
> > http://lkml.org/lkml/2009/4/21/489
> > 
> > Like I said there, I'm not sure who to send this patch to.
> > Ingo?
> > 
> I was under the impression that a tree that caused a build regression
> would be dropped until it had it sorted out, but that seems to be more
> the exception than the rule.
> 
> -next is good at finding bugs in build configurations folks haven't
> considered, which should serve as a pretty good platform for getting
> those types of fixes merged quickly, whether it be in to the tree that
> caused the regression or -next directly.
> 
> Unfortunately it seems like build regressions are more of an afterthought
> than a show stopper. I count at least 3 on the sh builds in the last
> couple weeks that are all averaging a week or longer to unbreak, while
> patches have been available almost immediately.

In this case, the tree in question is exposing a bug that already exists
in mainline; a function that is explicitly labelled as being exported
for use by arbitrary modules, and yet isn't being compiled into the
kernel. Shooting the messenger isn't going to fix that.

In any case, this patch does not belong in the NFS tree since it touches
generic library code, not NFS code. Benny, if nobody else wants to
shepherd it, then just send it directly to Linus.

Trond
-- 
Trond Myklebust
Linux NFS client maintainer

NetApp
Trond.Myklebust@netapp.com
www.netapp.com
