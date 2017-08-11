From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 11 Aug 2017 16:45:36 +0200
Message-ID: <20170811144536.qw3ufue2uvm2r6wk@hirez.programming.kicks-ass.net>
References: <20170811144352.585085e2@canb.auug.org.au>
 <20170811045453.GB3730@linux.vnet.ibm.com>
 <20170811091434.h6mkuuw3zcgkzg26@hirez.programming.kicks-ass.net>
 <20170811143917.GD3730@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170811143917.GD3730@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 11, 2017 at 07:39:17AM -0700, Paul E. McKenney wrote:
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
> My reasoning is as follows:
> 
> 1.	The critical section is empty, so any prior references
> 	would be ordered only against later critical sections.
> 
> 2.	A full barrier within the critical section will order those
> 	prior references against later critical sections just
> 	as easily as would one prior to the critical section.
> 
> Does that make sense, I should I have stayed away from the keyboard
> at this early hour?  ;-)

So I think we can do away with 2 because our prior and later stores have
an address dependency (they are to the same variable) and thus must be
ordered already.

Basically:

	CPU0				CPU1

	p->state = TASK_UNINTERRUPTIBLE;
					 try_to_wake_up(p)
	p->state = TASK_RUNNING
	spin_lock(&p->pi_lock);
	spin_unlock(&p->pi_lock);
	p->state = TASK_DEAD

Now, the ttwu(p) NO-OPs unless it sees (UN)INTERRUPTIBLE, so either
RUNNING or DEAD are fine. However if it sees (UN)INTERRUPTIBLE it will
do another (competing) RUNNING store which must not overwrite DEAD.
