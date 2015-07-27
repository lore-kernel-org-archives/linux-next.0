From: josh@joshtriplett.org
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 27 Jul 2015 13:27:58 -0700
Message-ID: <20150727202758.GA28119@cloud>
References: <20150724153334.543cfc7b@canb.auug.org.au>
 <1437768965.3298.52.camel@stgolabs.net>
 <20150724230902.GQ3717@linux.vnet.ibm.com>
 <20150725194739.GA9753@x>
 <1437859442.3298.68.camel@stgolabs.net>
 <20150725223524.GA14593@x>
 <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jul 27, 2015 at 01:03:12PM -0700, Andrew Morton wrote:
> On Sat, 25 Jul 2015 15:35:24 -0700 Josh Triplett <josh@joshtriplett.org> wrote:
> 
> > > Some mm functionality might very possibly rely on srcu in the future if
> > > we expect any chances of scaling, ie: faults. So I'd rather not take a
> > > short term solution here, as we'll probably be discussing this again
> > > otherwise.
> > 
> > What other mm functionality plans to use SRCU?
> > 
> > Among other things, no-mmu builds might still be able to omit it.
> 
> Yup.
> 
> It's pretty trivial to make the shrinker srcuification be a
> Kconfigurable thing.  A few little helper functions and we're done. 
> That way, non-SMP kernels can use the plain old rwsem if so desired.
> 
> otoh it's better to use the same mechanism on all kernels for reasons
> of testing coverage, maintenance cost, etc.

I agree with that.  I'm wondering if, rather than making the
SRCU-ification optional, shrinkers themselves could just be optional.
Unless I'm badly misunderstanding what shrinkers do, they seem like a
perfect example of something that could be omitted with little to no
impact.  (Stub them out, make them never called, and if you run out of
memory just be unhappy.  Ditto for the oom-killer, which really ought to
be optional.)

- Josh Triplett
