From: josh@joshtriplett.org
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 27 Jul 2015 13:31:10 -0700
Message-ID: <20150727203110.GB28119@cloud>
References: <20150724153334.543cfc7b@canb.auug.org.au>
 <1437768965.3298.52.camel@stgolabs.net>
 <20150724230902.GQ3717@linux.vnet.ibm.com>
 <20150725194739.GA9753@x>
 <1437859442.3298.68.camel@stgolabs.net>
 <20150725223524.GA14593@x>
 <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
 <1438028402.25997.58.camel@stgolabs.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44327 "EHLO
	relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915AbbG0UbP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2015 16:31:15 -0400
Content-Disposition: inline
In-Reply-To: <1438028402.25997.58.camel@stgolabs.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Davidlohr Bueso <dave@stgolabs.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 27, 2015 at 01:20:02PM -0700, Davidlohr Bueso wrote:
> On Mon, 2015-07-27 at 13:03 -0700, Andrew Morton wrote:
> > On Sat, 25 Jul 2015 15:35:24 -0700 Josh Triplett <josh@joshtriplett.org> wrote:
> > 
> > > > Some mm functionality might very possibly rely on srcu in the future if
> > > > we expect any chances of scaling, ie: faults. So I'd rather not take a
> > > > short term solution here, as we'll probably be discussing this again
> > > > otherwise.
> > > 
> > > What other mm functionality plans to use SRCU?
> 
> Right now I have (unpublished) patches that use srcu as a way to avoid
> mmap_sem when faulting across the entire path. Previous alternatives
> also use it, as ie, can involve IO and lots of other sleeping
> operations.

That sounds interesting!  mmap_sem is definitely a performance
bottleneck.  How do you handle writes versus reads?

> Yes, you can argue that they're not published all you want,
> but I'm talking beyond my specific use case. Linux VM is known to scale,
> why should we hide a core scalability tool from it?

In the case of mmap_sem, does it help at all if tiny kernels were 1)
non-preemptible and 2) non-SMP?  Tiny kernels don't necessarily care
about scaling.

> > > Among other things, no-mmu builds might still be able to omit it.
> > 
> > Yup.
> 
> Makes sense.

Thanks.

- Josh Triplett
