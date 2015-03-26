From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: build warnings after merge of the access_once tree
Date: Thu, 26 Mar 2015 15:08:45 +0000
Message-ID: <20150326150845.GG2805@arm.com>
References: <20150326193112.2c87eb39@canb.auug.org.au>
 <20150326103442.GV21418@twins.programming.kicks-ass.net>
 <20150326132750.GA2805@arm.com>
 <20150326142220.GY21418@twins.programming.kicks-ass.net>
 <20150326144153.GE2805@arm.com>
 <20150326145144.GZ21418@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150326145144.GZ21418@twins.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Christian Borntraeger <borntraeger@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Linus Torvalds <torvalds@linux-foundation.org>, Paul McKenney <paulmck@linux.vnet.ibm.com>
List-Id: linux-next.vger.kernel.org

On Thu, Mar 26, 2015 at 02:51:44PM +0000, Peter Zijlstra wrote:
> On Thu, Mar 26, 2015 at 02:41:54PM +0000, Will Deacon wrote:
> > > +++ b/lib/lockref.c
> > > @@ -18,7 +18,8 @@
> > >  #define CMPXCHG_LOOP(CODE, SUCCESS) do {					\
> > >  	struct lockref old;							\
> > >  	BUILD_BUG_ON(sizeof(old) != 8);						\
> > > -	old.lock_count = READ_ONCE(lockref->lock_count);			\
> > > +	barrier();								\
> > > +	old.lock_count = lockref->lock_count;					\
> > >  	while (likely(arch_spin_value_unlocked(old.lock.rlock.raw_lock))) {  	\
> > >  		struct lockref new = old, prev = old;				\
> > >  		CODE								\
> > 
> > Is ACCESS_ONCE actually going away? 
> 
> I've been arguing for that yes, having two APIs for the 'same' thing is
> confusing at best, and as the comment near the READ_ONCE() thing
> explains, ACCESS_ONCE() has serious, silent, issues.
> 
> > It has its problems, but I think it's
> > what we want here and reads better than magic barrier() imo.
> 
> Yeah, but its also misleading because we rely on silent fail. Part of
> the ACCESS_ONCE() semantics is that it should avoid split loads, and
> we're here actually relying on emitting just that.

In which case, on the premise that we comment the barrier():

  Acked-by: Will Deacon <will.deacon@arm.com>

As an aside, ARMv7 (32-bit) with LPAE *can* emit single-copy atomic 64-bit
memory accesses and we rely on that for things like atomic64_read and
writing ptes. If we see WRITE_ONCE(pte), then we'll have genuine issues
with the way it's currently implemented.

Will
