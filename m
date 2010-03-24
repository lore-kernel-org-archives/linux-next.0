From: Neil Brown <neilb@suse.de>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 24 Mar 2010 12:37:23 +1100
Message-ID: <20100324123723.43d24a42@notabene.brown>
References: <20100317154145.bd9fca16.sfr@canb.auug.org.au>
	<20100317182136.0f2ab805@notabene.brown>
	<Pine.LNX.4.64.1003170847110.25675@cobra.newdream.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:59758 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753696Ab0CXBhd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Mar 2010 21:37:33 -0400
In-Reply-To: <Pine.LNX.4.64.1003170847110.25675@cobra.newdream.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sage Weil <sage@newdream.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 17 Mar 2010 08:51:49 -0700 (PDT)
Sage Weil <sage@newdream.net> wrote:


> > It is a pity that this code cannot use mempool_t....
> > What if mempool_t were changed to only re-alloc the vector of pointers when
> > it grew, or when it shrank to less than 1/2 it's current size.  Would that
> > reduce the frequency of allocations enough for you to be comfortable with it? 
> > i.e. always make the vector a power-of-2 size (which is what is probably
> > allocated anyway) while the pool size might be less.
> > ??
> 
> That would improve the situation, but still mean potentially large 
> allocations (the pools can grow pretty big) that aren't strictly 
> necessary.  I can imagine a more modular mempool_t with an ops vector for 
> adding/removing from the pool to cope with situations like this, but I'm 
> not sure it's worth the effort?

How big?
mempools (and equivalents) should just be large enough to get you through a
tight spot.  The working assumption is that they will not normally be used.
So 2 or 3 should normally be plenty.

(looks at code)

The only time you resize a ceph_mempool is in ceph_monc_do_statfs
where you increment it, perform a synchronous statfs call on the 
network, then decrement the size of the mempool.
How many concurrent statfs calls does it even make sense to make.
I'm probably missing something obvious, but wouldn't it make sense to
put that all under a mutex so there was only ever one outstanding statfs (per
filesystem) - or maybe under a counting semaphore to allow some small number,
and make sure to prime the mempool to cover that number.
Then you would never resize a mempool at all.

I notice that all other mempools that ceph uses are sensibly quite small and
stay that way.

NeilBrown
