From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Sat, 18 Jul 2015 04:40:02 +0200
Message-ID: <20150718024002.GA13059@gmail.com>
References: <20150716131423.4c849184@canb.auug.org.au>
 <20150716035138.GQ3717@linux.vnet.ibm.com>
 <20150717114046.GB5396@gmail.com>
 <20150717173528.GH3717@linux.vnet.ibm.com>
 <20150717185321.GA10554@linux.vnet.ibm.com>
 <20150717195131.GA27792@gmail.com>
 <20150717213336.GL3717@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150717213336.GL3717@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org


* Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:

> On Fri, Jul 17, 2015 at 09:51:31PM +0200, Ingo Molnar wrote:
> > 
> > * Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> > 
> > > And here is a prototype patch, which I intend to merge with the existing patch 
> > > that renames rcu_lockdep_assert() to RCU_LOCKDEP_WARN().  I will also queue a 
> > > revert of the patch below for 4.4.
> > > 
> > > Thoughts?
> > > 
> > > 							Thanx, Paul
> > > 
> > > ------------------------------------------------------------------------
> > > 
> > > diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> > > index 41c49b12fe6d..663d6e028c3d 100644
> > > --- a/include/linux/rcupdate.h
> > > +++ b/include/linux/rcupdate.h
> > > @@ -536,9 +536,29 @@ static inline int rcu_read_lock_sched_held(void)
> > >  
> > >  #endif /* #else #ifdef CONFIG_DEBUG_LOCK_ALLOC */
> > >  
> > > +/* Deprecate the rcu_lockdep_assert() macro. */
> > > +static inline void __attribute((deprecated)) deprecate_rcu_lockdep_assert(void)
> > > +{
> > > +}
> > > +
> > >  #ifdef CONFIG_PROVE_RCU
> > >  
> > >  /**
> > > + * rcu_lockdep_assert - emit lockdep splat if specified condition not met
> > > + * @c: condition to check
> > > + * @s: informative message
> > > + */
> > > +#define rcu_lockdep_assert(c, s)					\
> > > +	do {								\
> > > +		static bool __section(.data.unlikely) __warned;		\
> > > +		deprecate_rcu_lockdep_assert();				\
> > > +		if (debug_lockdep_rcu_enabled() && !__warned && !(c)) {	\
> > > +			__warned = true;				\
> > > +			lockdep_rcu_suspicious(__FILE__, __LINE__, s);	\
> > > +		}							\
> > 
> > Btw., out of general macro paranoia I'd write such constructs as something like:
> > 
> > 		if (!(c) && debug_lockdep_rcu_enabled() && !__warned) {	\
> > 
> > I.e. always evaluate 'c' even if debugging is off. This way if the construct is 
> > fed an expression with a side effect (bad idea!) then it still works regardless of 
> > whether the warning triggered already or not.
> 
> If you feel strongly about this, I will need to make lockdep_is_held()
> be defined when lockdep is disabled. [...]

No need - if it goes deeper then I wouldn't worry.

Thanks,

	Ingo
