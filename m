From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the msm tree with the arm tree
Date: Mon, 18 Oct 2010 22:19:25 +0200
Message-ID: <201010182219.25890.arnd@arndb.de>
References: <20101018103540.7bd9c535.sfr@canb.auug.org.au> <alpine.LFD.2.00.1010181525000.2764@xanadu.home> <1287432774.5588.5.camel@c-dwalke-linux.qualcomm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:52471 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755652Ab0JRUUJ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2010 16:20:09 -0400
In-Reply-To: <1287432774.5588.5.camel@c-dwalke-linux.qualcomm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Walker <dwalker@fifo99.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Russell King <rmk@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Kerr <jeremy.kerr@canonical.com>, Jeff Ohlstein <johlstei@codeaurora.org>

On Monday 18 October 2010 22:12:54 Daniel Walker wrote:
> On Mon, 2010-10-18 at 15:29 -0400, Nicolas Pitre wrote:
> 
> > > Ok, well in that case why not accept this immediately after the merge
> > > window? A point when everything is quiet, and most of the tree's are
> > > empty?
> > 
> > RMK has his own merge window which closes about at the same time as 
> > Linus' one opens.  We thought this was happening last week and therefore 
> > this change was supposed to be the last one.
> 
> It seems like that could potentially make these kinds of problem worse,
> since your merging things immediately before sending them to Linus. Like
> right now we only have a fairly short amount of time to correct this
> conflict. 

What Nicolas was talking about is the *end* of the merge window, not the
start. This is how all sensible maintainer trees work: you get to
merge stuff into the maintainer tree for a number of weeks (some start
at -rc1, other start a bit later). When Linus tells people to get ready
for the release, the subsystem goes into regression fix mode and when
Linus opens his merge window, everything should be reasonably stable.

> > > Well how about I merge this change into my tree ?
> > 
> > If you ask RMK to merge your tree in his that would be much simpler to 
> > add this change in a single pass afterwards.
> 
> I can do that , but would I still be able to merge stuff into my tree?
> Seems like I could, Russell would just clean up the conflict and my tree
> would just move forward like it has been already , and I would send the
> whole thing to Linus.

When you know that Russell does not rebase his tree, you can pull his
tree into yours whenever a change hits his tree that impacts you in
a major way. You shouldn't do this too frequently, but it's a good way
to resolve conflicts like this one.

	Arnd
