From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 27 Jul 2015 13:20:02 -0700
Message-ID: <1438028402.25997.58.camel@stgolabs.net>
References: <20150724153334.543cfc7b@canb.auug.org.au>
	 <1437768965.3298.52.camel@stgolabs.net>
	 <20150724230902.GQ3717@linux.vnet.ibm.com> <20150725194739.GA9753@x>
	 <1437859442.3298.68.camel@stgolabs.net> <20150725223524.GA14593@x>
	 <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52010 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751749AbbG0UUO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Jul 2015 16:20:14 -0400
In-Reply-To: <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Josh Triplett <josh@joshtriplett.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2015-07-27 at 13:03 -0700, Andrew Morton wrote:
> On Sat, 25 Jul 2015 15:35:24 -0700 Josh Triplett <josh@joshtriplett.org> wrote:
> 
> > > Some mm functionality might very possibly rely on srcu in the future if
> > > we expect any chances of scaling, ie: faults. So I'd rather not take a
> > > short term solution here, as we'll probably be discussing this again
> > > otherwise.
> > 
> > What other mm functionality plans to use SRCU?

Right now I have (unpublished) patches that use srcu as a way to avoid
mmap_sem when faulting across the entire path. Previous alternatives
also use it, as ie, can involve IO and lots of other sleeping
operations. Yes, you can argue that they're not published all you want,
but I'm talking beyond my specific use case. Linux VM is known to scale,
why should we hide a core scalability tool from it?

> > Among other things, no-mmu builds might still be able to omit it.
> 
> Yup.

Makes sense.

> 
> It's pretty trivial to make the shrinker srcuification be a
> Kconfigurable thing.  A few little helper functions and we're done. 
> That way, non-SMP kernels can use the plain old rwsem if so desired.
> 
> otoh it's better to use the same mechanism on all kernels for reasons
> of testing coverage, maintenance cost, etc.
> 
> The mm-srcu-ify-shrinkers.patch changelog is suspiciously lacking in
> evidence-of-benefit.  We could just drop it?

That's up to you, but I feel we should have srcu available in mm.
Dropping this particular patch is only a band-aid, imo.

Thanks,
Davidlohr
