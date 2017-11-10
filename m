From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Fri, 10 Nov 2017 13:14:35 +1100
Message-ID: <20171110131435.5346c8b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755602AbdKJCOi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 9 Nov 2017 21:14:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frederic Weisbecker <frederic@kernel.org>

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree.c

between commit:

  b04db8e19fc2 ("rcu: Use lockdep to assert IRQs are disabled/enabled")

from the tip tree and various commits from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree.c
index f9c0ca2ccf0c,f1e3b6ebc978..000000000000
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@@ -771,21 -760,20 +760,20 @@@ static void rcu_eqs_enter(bool user
  {
  	struct rcu_state *rsp;
  	struct rcu_data *rdp;
- 	struct rcu_dynticks *rdtp = this_cpu_ptr(&rcu_dynticks);
+ 	struct rcu_dynticks *rdtp;
  
- 	lockdep_assert_irqs_disabled();
- 	trace_rcu_dyntick(TPS("Start"), rdtp->dynticks_nesting, 0);
- 	if (IS_ENABLED(CONFIG_RCU_EQS_DEBUG) &&
- 	    !user && !is_idle_task(current)) {
- 		struct task_struct *idle __maybe_unused =
- 			idle_task(smp_processor_id());
- 
- 		trace_rcu_dyntick(TPS("Error on entry: not idle task"), rdtp->dynticks_nesting, 0);
- 		rcu_ftrace_dump(DUMP_ORIG);
- 		WARN_ONCE(1, "Current pid: %d comm: %s / Idle pid: %d comm: %s",
- 			  current->pid, current->comm,
- 			  idle->pid, idle->comm); /* must be idle task! */
+ 	rdtp = this_cpu_ptr(&rcu_dynticks);
+ 	WRITE_ONCE(rdtp->dynticks_nmi_nesting, 0);
+ 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) &&
+ 		     rdtp->dynticks_nesting == 0);
+ 	if (rdtp->dynticks_nesting != 1) {
+ 		rdtp->dynticks_nesting--;
+ 		return;
  	}
+ 
 -	RCU_LOCKDEP_WARN(!irqs_disabled(), "rcu_eqs_enter() invoked with irqs enabled!!!");
++	lockdep_assert_irqs_disabled();
+ 	trace_rcu_dyntick(TPS("Start"), rdtp->dynticks_nesting, 0, rdtp->dynticks);
+ 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(current));
  	for_each_rcu_flavor(rsp) {
  		rdp = this_cpu_ptr(rsp->rda);
  		do_nocb_deferred_wakeup(rdp);
@@@ -887,23 -881,15 +881,15 @@@ void rcu_nmi_exit(void
   */
  void rcu_irq_exit(void)
  {
- 	struct rcu_dynticks *rdtp;
+ 	struct rcu_dynticks *rdtp = this_cpu_ptr(&rcu_dynticks);
  
 -	RCU_LOCKDEP_WARN(!irqs_disabled(), "rcu_irq_exit() invoked with irqs enabled!!!");
 +	lockdep_assert_irqs_disabled();
- 	rdtp = this_cpu_ptr(&rcu_dynticks);
- 
- 	/* Page faults can happen in NMI handlers, so check... */
- 	if (rdtp->dynticks_nmi_nesting)
- 		return;
  
- 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) &&
- 		     rdtp->dynticks_nesting < 1);
- 	if (rdtp->dynticks_nesting <= 1) {
- 		rcu_eqs_enter_common(true);
- 	} else {
- 		trace_rcu_dyntick(TPS("--="), rdtp->dynticks_nesting, rdtp->dynticks_nesting - 1);
- 		rdtp->dynticks_nesting--;
- 	}
+ 	if (rdtp->dynticks_nmi_nesting == 1)
+ 		rcu_prepare_for_idle();
+ 	rcu_nmi_exit();
+ 	if (rdtp->dynticks_nmi_nesting == 0)
+ 		rcu_dynticks_task_enter();
  }
  
  /*
@@@ -957,9 -918,9 +918,9 @@@ void rcu_irq_exit_irqson(void
  static void rcu_eqs_exit(bool user)
  {
  	struct rcu_dynticks *rdtp;
- 	long long oldval;
+ 	long oldval;
  
 -	RCU_LOCKDEP_WARN(!irqs_disabled(), "rcu_eqs_exit() invoked with irqs enabled!!!");
 +	lockdep_assert_irqs_disabled();
  	rdtp = this_cpu_ptr(&rcu_dynticks);
  	oldval = rdtp->dynticks_nesting;
  	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && oldval < 0);
@@@ -1122,26 -1037,28 +1037,28 @@@ void rcu_irq_enter(void
  {
  	struct rcu_dynticks *rdtp = this_cpu_ptr(&rcu_dynticks);
  
- 	/*
- 	 * Check for ->dynticks_nmi_nesting underflow and bad ->dynticks.
- 	 * (We are exiting an NMI handler, so RCU better be paying attention
- 	 * to us!)
- 	 */
- 	WARN_ON_ONCE(rdtp->dynticks_nmi_nesting <= 0);
- 	WARN_ON_ONCE(rcu_dynticks_curr_cpu_in_eqs());
 -	RCU_LOCKDEP_WARN(!irqs_disabled(), "rcu_irq_enter() invoked with irqs enabled!!!");
++	lockdep_assert_irqs_disabled();
  
- 	/*
- 	 * If the nesting level is not 1, the CPU wasn't RCU-idle, so
- 	 * leave it in non-RCU-idle state.
- 	 */
- 	if (rdtp->dynticks_nmi_nesting != 1) {
- 		rdtp->dynticks_nmi_nesting -= 2;
- 		return;
- 	}
+ 	if (rdtp->dynticks_nmi_nesting == 0)
+ 		rcu_dynticks_task_exit();
+ 	rcu_nmi_enter();
+ 	if (rdtp->dynticks_nmi_nesting == 1)
+ 		rcu_cleanup_after_idle();
+ }
  
- 	/* This NMI interrupted an RCU-idle CPU, restore RCU-idleness. */
- 	rdtp->dynticks_nmi_nesting = 0;
- 	rcu_dynticks_eqs_enter();
+ /*
+  * Wrapper for rcu_irq_enter() where interrupts are enabled.
+  *
+  * If you add or remove a call to rcu_irq_enter_irqson(), be sure to test
+  * with CONFIG_RCU_EQS_DEBUG=y.
+  */
+ void rcu_irq_enter_irqson(void)
+ {
+ 	unsigned long flags;
+ 
+ 	local_irq_save(flags);
+ 	rcu_irq_enter();
+ 	local_irq_restore(flags);
  }
  
  /**
