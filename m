From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Wed, 25 Jun 2008 18:33:20 +1000
Message-ID: <200806251833.21248.rusty@rustcorp.com.au>
References: <20080625162731.94f69298.sfr@canb.auug.org.au> <20080625074733.GA16692@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:37902 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753124AbYFYIf7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 04:35:59 -0400
In-Reply-To: <20080625074733.GA16692@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wednesday 25 June 2008 17:47:33 Ingo Molnar wrote:
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Rusty,
> >
> > Today's linux-next merge of the rr tree got a conflict in
> > kernel/stop_machine.c between commit
> > 961ccddd59d627b89bd3dc284b6517833bbdf25d ("sched: add new API
> > sched_setscheduler_nocheck: add a flag to control access") from the
> > sched tree (which is also in the rr tree) and commit
> > 179da75b083a098ba6192c0900611a92091abfc9 ("stop_machine:simplify")
> > from the rr tree.
> >
> > I just took the rr tree version since the former is in both trees.
>
> Rusty, there's a new -tip toy/feature i've applied when creating that
> commit 2 days ago, to eliminate this (predictable) conflict.
>
> Since this is a scheduler infrastructure change, i've put this change
> into a separate topic branch in -tip:
>
>    tip/sched/new-API-sched_setscheduler
>
> This new topic branch is based off upstream -git so you can pick up that
> change alone via a single git-pull, without picking up any other
> scheduler changes. (any further enhancements to that change should be
> done in that topic branches as well)
>
> This topic is integrated into tip/auto-sched-next, so any changes to the
> topic will be propagated into linux-next as well. I think this is the
> right model for doing infrastructure changes - separating them into
> standalone trees so that other subsystem maintainers can pull them when
> they run into conflicts.
>
> Please use that commit and remove 179da75b083a09 so that there's no
> overlap in the sha1 space and no conflicts. -tip can be picked up via:
> http://people.redhat.com/mingo/tip.git/README .

That would probably work, but I don't use git.

Stephen's already resolved it; AFAICT getting the exact same patch from two 
places is not a real problem for him anyway.

In this case, I'm tempted to just throw the stop_machine patch into your tree; 
that's the only reason I care about this change.  I haven't done that yet 
because I suspect that I broke hotplug CPU.

Cheers,
Rusty.
