From: Paul Mundt <lethal@linux-sh.org>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use by modules.
Date: Thu, 23 Apr 2009 23:12:37 +0900
Message-ID: <20090423141237.GA27102@linux-sh.org>
References: <20090416030704.GH16961@linux-sh.org> <49E6E816.8010709@panasas.com> <20090423065006.GB21733@linux-sh.org> <49F03F26.4060103@panasas.com> <20090423102930.GA24434@linux-sh.org> <1240491589.8240.42.camel@heimdal.trondhjem.org> <20090423132530.GA26887@linux-sh.org> <1240495168.11148.12.camel@heimdal.trondhjem.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:60740 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755061AbZDWORs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Apr 2009 10:17:48 -0400
Content-Disposition: inline
In-Reply-To: <1240495168.11148.12.camel@heimdal.trondhjem.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Benny Halevy <bhalevy@panasas.com>, Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Alexander Beregalov <a.beregalov@gmail.com>, Subrata Modak <subrata@linux.vnet.ibm.com>, sachinp <sachinp@linux.vnet.ibm.com>

On Thu, Apr 23, 2009 at 09:59:28AM -0400, Trond Myklebust wrote:
> On Thu, 2009-04-23 at 22:25 +0900, Paul Mundt wrote:
> > > In any case, this patch does not belong in the NFS tree since it touches
> > > generic library code, not NFS code. Benny, if nobody else wants to
> > > shepherd it, then just send it directly to Linus.
> > > 
> > That's a complete cop-out, if there had been no export at all how would
> > you have proceeded? How is this situation any different?
> 
> Please see Documentation/SubmittingPatches. If we were requesting a new
> kernel feature, I'd go looking for the maintainer and get an ACK or get
> said maintainer to include the patch in their tree.
> 
> As it is, said kernel feature exists, but is broken. The correct thing
> to do is to fix the kernel feature. Sooner, rather than later.
> 
And until that feature is working, you have absolutely no business
merging crap in to the kernel that uses it. You made an assumption that
it was working, which turned out to be wrong (which you also failed to
validate through any form of testing), and subsequently caused a
regression. Mistakes happen and are expected in -next, refusing to deal
with them at all on the other hand..

The first course of action any responsible maintainer would have taken
would be to revert the offending changeset once the issue was pointed out
until its dependencies were sorted out. Not only have you failed to do
that, you couldn't even be bothered replying to the email with patch that
pointed out the build failure in the first place. This created the
mistaken conclusion that you were actually doing something about the
regression you caused rather than just dismissing it out of hand.

The nfs tree should be dropped on the floor immediately until this issue
is resolved. 
