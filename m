From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 17 Jul 2015 11:53:21 -0700
Message-ID: <20150717185321.GA10554@linux.vnet.ibm.com>
References: <20150716131423.4c849184@canb.auug.org.au>
 <20150716035138.GQ3717@linux.vnet.ibm.com>
 <20150717114046.GB5396@gmail.com>
 <20150717173528.GH3717@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150717173528.GH3717@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jul 17, 2015 at 10:35:28AM -0700, Paul E. McKenney wrote:
> On Fri, Jul 17, 2015 at 01:40:46PM +0200, Ingo Molnar wrote:
> > 
> > * Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> > 
> > > On Thu, Jul 16, 2015 at 01:14:23PM +1000, Stephen Rothwell wrote:
> > > > Hi Paul,
> > > > 
> > > > After merging the rcu tree, today's linux-next build (arm
> > > > multi_v7_defconfig) failed like this:
> > > > 
> > > > kernel/notifier.c: In function 'notify_die':
> > > > kernel/notifier.c:547:2: error: implicit declaration of function 'rcu_lockdep_assert' [-Werror=implicit-function-declaration]
> > > >   rcu_lockdep_assert(rcu_is_watching(),
> > > >   ^
> > > > 
> > > > Caused by commit
> > > > 
> > > >   02300fdb3e5f ("rcu: Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()")
> > > > 
> > > > interacting with commit
> > > > 
> > > >   e727c7d7a11e ("notifiers, RCU: Assert that RCU is watching in notify_die()")
> > > > 
> > > > [ and I also noted
> > > >   0333a209cbf6 ("x86/irq, context_tracking: Document how IRQ context tracking works and add an RCU assertion")
> > > > ]
> > > > 
> > > > from the tip tree.
> > > 
> > > Thank you in both cases!  I suspect that more will follow, so is there
> > > something I can do to make this easier?  (Hard for me to patch stuff
> > > that is not yet in the tree...)
> > 
> > So we could keep the old macro around as well for such cases, and then remove it 
> > in v4.4 or so?
> 
> Works for me!  Will do.

And here is a prototype patch, which I intend to merge with the existing
patch that renames rcu_lockdep_assert() to RCU_LOCKDEP_WARN().  I will
also queue a revert of the patch below for 4.4.

Thoughts?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 41c49b12fe6d..663d6e028c3d 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -536,9 +536,29 @@ static inline int rcu_read_lock_sched_held(void)
 
 #endif /* #else #ifdef CONFIG_DEBUG_LOCK_ALLOC */
 
+/* Deprecate the rcu_lockdep_assert() macro. */
+static inline void __attribute((deprecated)) deprecate_rcu_lockdep_assert(void)
+{
+}
+
 #ifdef CONFIG_PROVE_RCU
 
 /**
+ * rcu_lockdep_assert - emit lockdep splat if specified condition not met
+ * @c: condition to check
+ * @s: informative message
+ */
+#define rcu_lockdep_assert(c, s)					\
+	do {								\
+		static bool __section(.data.unlikely) __warned;		\
+		deprecate_rcu_lockdep_assert();				\
+		if (debug_lockdep_rcu_enabled() && !__warned && !(c)) {	\
+			__warned = true;				\
+			lockdep_rcu_suspicious(__FILE__, __LINE__, s);	\
+		}							\
+	} while (0)
+
+/**
  * RCU_LOCKDEP_WARN - emit lockdep splat if specified condition is met
  * @c: condition to check
  * @s: informative message
@@ -575,6 +595,7 @@ static inline void rcu_preempt_sleep_check(void)
 
 #else /* #ifdef CONFIG_PROVE_RCU */
 
+#define rcu_lockdep_assert(c, s) deprecate_rcu_lockdep_assert()
 #define RCU_LOCKDEP_WARN(c, s) do { } while (0)
 #define rcu_sleep_check() do { } while (0)
 
