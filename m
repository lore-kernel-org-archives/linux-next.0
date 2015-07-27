From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 27 Jul 2015 13:03:12 -0700
Message-ID: <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
References: <20150724153334.543cfc7b@canb.auug.org.au>
	<1437768965.3298.52.camel@stgolabs.net>
	<20150724230902.GQ3717@linux.vnet.ibm.com>
	<20150725194739.GA9753@x>
	<1437859442.3298.68.camel@stgolabs.net>
	<20150725223524.GA14593@x>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150725223524.GA14593@x>
Sender: linux-kernel-owner@vger.kernel.org
To: Josh Triplett <josh@joshtriplett.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Sat, 25 Jul 2015 15:35:24 -0700 Josh Triplett <josh@joshtriplett.org> wrote:

> > Some mm functionality might very possibly rely on srcu in the future if
> > we expect any chances of scaling, ie: faults. So I'd rather not take a
> > short term solution here, as we'll probably be discussing this again
> > otherwise.
> 
> What other mm functionality plans to use SRCU?
> 
> Among other things, no-mmu builds might still be able to omit it.

Yup.

It's pretty trivial to make the shrinker srcuification be a
Kconfigurable thing.  A few little helper functions and we're done. 
That way, non-SMP kernels can use the plain old rwsem if so desired.

otoh it's better to use the same mechanism on all kernels for reasons
of testing coverage, maintenance cost, etc.

The mm-srcu-ify-shrinkers.patch changelog is suspiciously lacking in
evidence-of-benefit.  We could just drop it?
