From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: is the weeks before -rc1 the time to really be working on
 -next?
Date: Wed, 15 Oct 2008 16:41:39 -0700
Message-ID: <20081015164139.ebcd24c6.akpm@linux-foundation.org>
References: <20081015145606.2af3baf1.akpm@linux-foundation.org>
	<20081015233607.54c1d6b8@lxorguk.ukuu.org.uk>
	<20081015155353.f15a996e.akpm@linux-foundation.org>
	<20081015.160821.143702739.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:51407 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751973AbYJOXl5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Oct 2008 19:41:57 -0400
In-Reply-To: <20081015.160821.143702739.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: alan@lxorguk.ukuu.org.uk, greg@kroah.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 15 Oct 2008 16:08:21 -0700 (PDT)
David Miller <davem@davemloft.net> wrote:

> From: Andrew Morton <akpm@linux-foundation.org>
> Date: Wed, 15 Oct 2008 15:53:53 -0700
> 
> > But the problem here is that once linux-next merges your patches, you
> > no longer have a tree on which to base your patches!  You need to get
> > your hands on "linux-next without my stuff" to maintain them.
> 
> I know this doesn't work for you, but if you ran -mm just like any
> other GIT tree it might mesh a whole lot better.

A lot of -mm is "small random subsystem trees", maybe 100 in total. 
They'd work fine as git trees.

There are also 100-odd "trees" in -mm (many of which have zero length)
which are "things to bug a subsystem maintainer with".  Alas, subsystem
maintainers like to fumble the patches I send them, then merge other
stuff which breaks the patches which I'm maintaining for them.  So in
reality each of those 100-odd trees is based on and tracks a separate
git tree.  Or, of course, on linux-next..  Sometimes I end up
maintaining these for a *long* time - years.

Then there are the nasty ones - patches which weren't factored into
"core patch followed by per-maintainer patches" and which need to go in
as a single hit.  Fortuntely these are relatively rare and we _could_
push harder to break them into core-plus-per-maintainer form.  Or I
could just lose the emails ;) They often tend to not be terribly
important.

> And in reality that kind of situation isn't a big deal in the
> context of -next.  People are rebasing their trees all the time
> there, and it mostly seems to work itself out.
> 
> It's a lot more work for a contributor to do work against -mm,
> since the response to "which -mm should I work against and where
> do I get it from" is a bit more involved that just "pull from
> this GIT tree and do your work on top of that."
> 
> And just like networking we could have Stephen treat the -mm
> GIT tree as "important" which roughly means that other conflicting
> trees will be knocked out of a -next release in deference to -mm.
> 
> Those people will have to fix their stuff, not you.  And you'll
> always therefore get coverage in -next.

Yes, but then people would end up being based on linux-next, and that's
a pretty rubbery target with all the rebasing and trees getting
dropped, etc.  And they'd accidentally end up having to actually
compile and run linux-next, shock-horror-oh-the-humanity.

> Unlike the general sentiment expressed here, I think -next is helping.
> Even if only because Stephen pokes people with trees causing problems
> on a daily basis.

yup.  Plus the runtime testing.

I doubt if the world would end if we just stopped trying to run any of
these uber-trees.  Everyone bases their work on mainline and then
everything goes smash/bang/curse during the merge window.  It wouldn't
be pretty, but it'd sure make people merge their trees promptly ;)
