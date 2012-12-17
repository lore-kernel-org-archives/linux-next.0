From: Chris Mason <chris.mason@fusionio.com>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Date: Sun, 16 Dec 2012 22:38:43 -0500
Message-ID: <20121217033843.GD13828@shiny>
References: <20121217100022.7d751dc9075d60a33d636a23@canb.auug.org.au>
 <20121217001504.GA13828@shiny>
 <20121217025241.GC13828@shiny>
 <20121217141355.9bbbd1ef4c59959bf7940a4a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.fusionio.com ([66.114.96.31]:36510 "EHLO mx2.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750989Ab2LQDiq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Dec 2012 22:38:46 -0500
Content-Disposition: inline
In-Reply-To: <20121217141355.9bbbd1ef4c59959bf7940a4a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Mason <clmason@fusionio.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stefan Behrens <sbehrens@giantdisaster.de>, Josef Bacik <JBacik@fusionio.com>, Linus <torvalds@linux-foundation.org>

On Sun, Dec 16, 2012 at 08:13:55PM -0700, Stephen Rothwell wrote:
> Hi Chris,
> 
> On Sun, 16 Dec 2012 21:52:41 -0500 Chris Mason <chris.mason@fusionio.com> wrote:
> >
> > On Sun, Dec 16, 2012 at 05:15:04PM -0700, Chris Mason wrote:
> > > On Sun, Dec 16, 2012 at 04:00:22PM -0700, Stephen Rothwell wrote:
> > > Josef and I have sob on all of our commits (at least all the ones not in
> > > 3.7, I didn't go back farther).  In this case the Author was Stefan and
> > > it ended up rebased in either Josef's or my tree.  We usually try to
> > > preserve merges on rebase, but this time was a bigger set of changes
> > > than usual and it didn't work out.
> > 
> > Just FYI, I've pushed out a fixed version of the tree with proper
> > signed-off-by on all the commits, thanks for catching that.
> > 
> > It also has the fix for the ppc compile problems.  (This isn't a pull
> > request yet, I've got the hash collision fix and a few others pending as
> > well).
> 
> You do realise that I just fetch your tree/branch each day, right?  So it
> will be in tomorrow's linux-next.

Yes, but I had pushed to that for-linus branch for Stefan to more easily
see the changes, and I wanted to make it clear I had just redone things
for the signed-off-by.

-chris
