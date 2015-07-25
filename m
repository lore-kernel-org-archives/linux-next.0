From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sat, 25 Jul 2015 14:24:02 -0700
Message-ID: <1437859442.3298.68.camel@stgolabs.net>
References: <20150724153334.543cfc7b@canb.auug.org.au>
	 <1437768965.3298.52.camel@stgolabs.net>
	 <20150724230902.GQ3717@linux.vnet.ibm.com> <20150725194739.GA9753@x>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41626 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754589AbbGYVYR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 25 Jul 2015 17:24:17 -0400
In-Reply-To: <20150725194739.GA9753@x>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2015-07-25 at 12:47 -0700, Josh Triplett wrote:
> I certainly agree that it doesn't make sense to make all architectures
> select SRCU, if an unremovable core kernel feature uses SRCU.  If
> possible, I'd really like to avoid seeing SRCU become mandatory again,
> though.

I find it very strange that srcu is not taken for granted like rcu is,
or even regular locking primitives. How much overhead does srcu add?

> Is there any chance at all of the shrinker mechanism becoming optional?
> At first glance, it seems reasonably separate from the rest of mm, in
> that if it didn't exist and shrinking didn't happen, the rest of mm
> still works.  If that happened, MM_SHRINKER could select SRCU.

Some mm functionality might very possibly rely on srcu in the future if
we expect any chances of scaling, ie: faults. So I'd rather not take a
short term solution here, as we'll probably be discussing this again
otherwise.

> If that's not possible, then for the moment, I'd suggest making a hidden
> symbol MM_SHRINKER that's always y and does "select SRCU", to preserve
> SRCU's modularity for the moment while not forcing every architecture to
> select it.

This is _very_ hacking. While tinyfication has its uses and
applications, I'd rather not have it in the way of normal kernels.

Thanks,
Davidlohr
