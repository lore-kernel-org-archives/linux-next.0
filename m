From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 11 Aug 2017 13:12:47 -0700
Message-ID: <20170811201247.GH3730@linux.vnet.ibm.com>
References: <20170811144352.585085e2@canb.auug.org.au>
 <20170811045453.GB3730@linux.vnet.ibm.com>
 <20170811091434.h6mkuuw3zcgkzg26@hirez.programming.kicks-ass.net>
 <20170811144150.26gowhxte7ri5fpk@hirez.programming.kicks-ass.net>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170811144150.26gowhxte7ri5fpk@hirez.programming.kicks-ass.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 11, 2017 at 04:41:50PM +0200, Peter Zijlstra wrote:
> On Fri, Aug 11, 2017 at 11:14:34AM +0200, Peter Zijlstra wrote:
> > On Thu, Aug 10, 2017 at 09:54:53PM -0700, Paul E. McKenney wrote:
> > > On Fri, Aug 11, 2017 at 02:43:52PM +1000, Stephen Rothwell wrote:
> > > 
> > > Looks like I need to rebase my patch on top of a9668cd6ee28, and
> > > than put an smp_mb__after_spinlock() between the lock and the unlock.
> > > 
> > > Peter, any objections to that approach?  Other suggestions?
> > 
> > Hurm.. I'll have to try and understand that comment there again it
> > seems.
> 
> OK, so per commit b5740f4b2cb3 ("sched: Fix ancient race in do_exit()")
> the race is with try_to_wake_up():
> 
> down_read()
> 	p->state = TASK_UNINTERRUPTIBLE;
> 
> 						try_to_wake_up(p)
> 							spin_lock(p->pi_lock);
> 							/* sees TASK_UNINTERRUPTIBLE */
> 							ttwu_remote()
> 	/* check stuff, no need to schedule() */
> 	p->state = TASK_RUNNING
> 
> 
> p->state = TASK_DEAD
> 
> 								p->state = TASK_RUNNING /* whoops! */
> 							spin_unlock(p->pi_lock);
> 
> __schedule(false);
> BUG();
> 
> 
> 
> 
> So given that, I think that:
> 
>   spin_lock(&current->pi_lock);
>   spin_unlock(&current->pi_lock);
> 
>   current->state = TASK_DEAD;
> 
> is sufficient. I don't see a need for an additional smp_mb here.
> 
> Either the concurrent ttwu is finished and we must observe its RUNNING
> store, or it will observe our RUNNING store.

Makes sense to me!  Please see below for the updated commit.

							Thanx, Paul

------------------------------------------------------------------------

commit 23a9b748a3d27f67cdb078fcb891a920285e75d9
Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Date:   Thu Jun 29 12:08:26 2017 -0700

    sched: Replace spin_unlock_wait() with lock/unlock pair
    
    There is no agreed-upon definition of spin_unlock_wait()'s semantics,
    and it appears that all callers could do just as well with a lock/unlock
    pair.  This commit therefore replaces the spin_unlock_wait() call in
    do_task_dead() with spin_lock() followed immediately by spin_unlock().
    This should be safe from a performance perspective because the lock is
    this tasks ->pi_lock, and this is called only after the task exits.
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    Cc: Ingo Molnar <mingo@redhat.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Will Deacon <will.deacon@arm.com>
    Cc: Alan Stern <stern@rowland.harvard.edu>
    Cc: Andrea Parri <parri.andrea@gmail.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    [ paulmck: Drop smp_mb() based on Peter Zijlstra's analysis:
      http://lkml.kernel.org/r/20170811144150.26gowhxte7ri5fpk@hirez.programming.kicks-ass.net ]

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 17c667b427b4..5d22323ae099 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3352,8 +3352,8 @@ void __noreturn do_task_dead(void)
 	 * To avoid it, we have to wait for releasing tsk->pi_lock which
 	 * is held by try_to_wake_up()
 	 */
-	smp_mb();
-	raw_spin_unlock_wait(&current->pi_lock);
+	raw_spin_lock_irq(&current->pi_lock);
+	raw_spin_unlock_irq(&current->pi_lock);
 
 	/* Causes final put_task_struct in finish_task_switch(): */
 	__set_current_state(TASK_DEAD);
