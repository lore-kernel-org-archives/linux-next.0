From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 11 Aug 2017 16:41:50 +0200
Message-ID: <20170811144150.26gowhxte7ri5fpk@hirez.programming.kicks-ass.net>
References: <20170811144352.585085e2@canb.auug.org.au>
 <20170811045453.GB3730@linux.vnet.ibm.com>
 <20170811091434.h6mkuuw3zcgkzg26@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170811091434.h6mkuuw3zcgkzg26@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 11, 2017 at 11:14:34AM +0200, Peter Zijlstra wrote:
> On Thu, Aug 10, 2017 at 09:54:53PM -0700, Paul E. McKenney wrote:
> > On Fri, Aug 11, 2017 at 02:43:52PM +1000, Stephen Rothwell wrote:
> > 
> > Looks like I need to rebase my patch on top of a9668cd6ee28, and
> > than put an smp_mb__after_spinlock() between the lock and the unlock.
> > 
> > Peter, any objections to that approach?  Other suggestions?
> 
> Hurm.. I'll have to try and understand that comment there again it
> seems.

OK, so per commit b5740f4b2cb3 ("sched: Fix ancient race in do_exit()")
the race is with try_to_wake_up():

down_read()
	p->state = TASK_UNINTERRUPTIBLE;

						try_to_wake_up(p)
							spin_lock(p->pi_lock);
							/* sees TASK_UNINTERRUPTIBLE */
							ttwu_remote()
	/* check stuff, no need to schedule() */
	p->state = TASK_RUNNING


p->state = TASK_DEAD

								p->state = TASK_RUNNING /* whoops! */
							spin_unlock(p->pi_lock);

__schedule(false);
BUG();




So given that, I think that:

  spin_lock(&current->pi_lock);
  spin_unlock(&current->pi_lock);

  current->state = TASK_DEAD;

is sufficient. I don't see a need for an additional smp_mb here.

Either the concurrent ttwu is finished and we must observe its RUNNING
store, or it will observe our RUNNING store.
