From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sat, 25 Jul 2015 12:47:40 -0700
Message-ID: <20150725194739.GA9753@x>
References: <20150724153334.543cfc7b@canb.auug.org.au>
 <1437768965.3298.52.camel@stgolabs.net>
 <20150724230902.GQ3717@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:46645 "EHLO
	slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964780AbbGYTvj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Jul 2015 15:51:39 -0400
Content-Disposition: inline
In-Reply-To: <20150724230902.GQ3717@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 24, 2015 at 04:09:02PM -0700, Paul E. McKenney wrote:
> On Fri, Jul 24, 2015 at 01:16:05PM -0700, Davidlohr Bueso wrote:
> > On Fri, 2015-07-24 at 15:33 +1000, Stephen Rothwell wrote:
> > > Hi Andrew,
> > > 
> > > After merging the akpm-current tree, today's linux-next build (powerpc
> > > allnoconfig) failed like this:
> > > 
> > > mm/built-in.o: In function `shrink_slab.part.73.constprop.83':
> > > vmscan.c:(.text+0xf760): undefined reference to `__srcu_read_lock'
> > > vmscan.c:(.text+0xf924): undefined reference to `__srcu_read_unlock'
> > > mm/built-in.o: In function `unregister_shrinker':
> > > (.text+0xfa60): undefined reference to `synchronize_srcu'
> > > mm/built-in.o:(.data+0x1e8): undefined reference to `process_srcu'
> > > 
> > > Caused by commit
> > > 
> > >   dab937da82f9 ("mm: srcu-ify shrinkers")
> > > 
> > > I have reverted that commit for today.
> > 
> > Adding paulmck.
> > 
> > I'm not entirely sure what is the fix here. Paul G also reported it
> > failing for arm. I was able to reproduce with powerpc, and the following
> > fixes the issue, but I doubt it is the correct way to address this. The
> > idea was based on how we do it for x86.
> > 
> > Also, having SRCU in mm is, lets say, more than convenient, beyond
> > MMU_NOTIFIERS which explicitly selects SRCU.
> > 
> > Paul?
> 
> SRCU was made optional as part of the kernel tinification project,
> so adding Josh on CC.  The hope would be that the feature needing SRCU
> could add the "select" rather than having major architectures doing so.
> 
> I guess if SRCU is needed everywhere, it is needed everywhere, but...

I certainly agree that it doesn't make sense to make all architectures
select SRCU, if an unremovable core kernel feature uses SRCU.  If
possible, I'd really like to avoid seeing SRCU become mandatory again,
though.

Is there any chance at all of the shrinker mechanism becoming optional?
At first glance, it seems reasonably separate from the rest of mm, in
that if it didn't exist and shrinking didn't happen, the rest of mm
still works.  If that happened, MM_SHRINKER could select SRCU.

If that's not possible, then for the moment, I'd suggest making a hidden
symbol MM_SHRINKER that's always y and does "select SRCU", to preserve
SRCU's modularity for the moment while not forcing every architecture to
select it.

- Josh Triplett
