From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Mon, 31 Jul 2017 21:03:23 -0700
Message-ID: <20170801040323.GP3730@linux.vnet.ibm.com>
References: <20170731135029.479025ea@canb.auug.org.au>
 <20170731161341.GG3730@linux.vnet.ibm.com>
 <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 01, 2017 at 12:04:05AM +0000, Mathieu Desnoyers wrote:
> ----- On Jul 31, 2017, at 12:13 PM, Paul E. McKenney paulmck@linux.vnet.ibm.com wrote:
> 
> > On Mon, Jul 31, 2017 at 01:50:29PM +1000, Stephen Rothwell wrote:
> >> Hi Paul,
> >> 
> >> Today's linux-next merge of the rcu tree got a conflict in:
> >> 
> >>   arch/x86/mm/tlb.c
> >> 
> >> between commit:
> >> 
> >>   94b1b03b519b ("x86/mm: Rework lazy TLB mode and TLB freshness tracking")
> >> 
> >> from the tip tree and commit:
> >> 
> >>   d7713e8f8b23 ("membarrier: Expedited private command")
> >> 
> >> from the rcu tree.
> >> 
> >> I fixed it up (the former removed the comment and the load_cr3(), so I
> >> just dropped the commend change in the latter) and can carry the fix as
> >> necessary. This is now fixed as far as linux-next is concerned, but any
> >> non trivial conflicts should be mentioned to your upstream maintainer
> >> when your tree is submitted for merging.  You may also want to consider
> >> cooperating with the maintainer of the conflicting tree to minimise any
> >> particularly complex conflicts.
> > 
> > Thank you, Stephen!
> > 
> > Mathieu, Peter, our commit log reads as if removal of load_cr3() would
> > simply result in relying on the ordering provided by the atomic ops
> > in switch_mm() for mm_cpumask(), so that only the commit log and the
> > comment need changing.
> > 
> > Please let me know if I am missing something here.
> 
> I think you are right. Both load_cr3() and mm_cpumask update operations
> (LOCK prefixed) provide the appropriate barriers on x86. So it's just a
> matter of adapting the comment to the new reality.

Like this?

							Thanx, Paul

------------------------------------------------------------------------

commit fde19879b6bd1abc0c1d4d5f945efed61bf7eb8c
Author: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Date:   Fri Jul 28 16:40:40 2017 -0400

    membarrier: Expedited private command
    
    Implement MEMBARRIER_CMD_PRIVATE_EXPEDITED with IPIs using cpumask built
    from all runqueues for which current thread's mm is the same as the
    thread calling sys_membarrier. It executes faster than the non-expedited
    variant (no blocking). It also works on NOHZ_FULL configurations.
    
    Scheduler-wise, it requires a memory barrier before and after context
    switching between processes (which have different mm). The memory
    barrier before context switch is already present. For the barrier after
    context switch:
    
    * Our TSO archs can do RELEASE without being a full barrier. Look at
      x86 spin_unlock() being a regular STORE for example.  But for those
      archs, all atomics imply smp_mb and all of them have atomic ops in
      switch_mm() for mm_cpumask().
    
    * From all weakly ordered machines, only ARM64 and PPC can do RELEASE,
      the rest does indeed do smp_mb(), so there the spin_unlock() is a full
      barrier and we're good.
    
    * ARM64 has a very heavy barrier in switch_to(), which suffices.
    
    * PPC just removed its barrier from switch_to(), but appears to be
      talking about adding something to switch_mm(). So add a
      smp_mb__after_unlock_lock() for now, until this is settled on the PPC
      side.
    
    Changes since v3:
    - Properly document the memory barriers provided by each architecture.
    
    Changes since v2:
    - Address comments from Peter Zijlstra,
    - Add smp_mb__after_unlock_lock() after finish_lock_switch() in
      finish_task_switch() to add the memory barrier we need after storing
      to rq->curr. This is much simpler than the previous approach relying
      on atomic_dec_and_test() in mmdrop(), which actually added a memory
      barrier in the common case of switching between userspace processes.
    - Return -EINVAL when MEMBARRIER_CMD_SHARED is used on a nohz_full
      kernel, rather than having the whole membarrier system call returning
      -ENOSYS. Indeed, CMD_PRIVATE_EXPEDITED is compatible with nohz_full.
      Adapt the CMD_QUERY mask accordingly.
    
    Changes since v1:
    - move membarrier code under kernel/sched/ because it uses the
      scheduler runqueue,
    - only add the barrier when we switch from a kernel thread. The case
      where we switch from a user-space thread is already handled by
      the atomic_dec_and_test() in mmdrop().
    - add a comment to mmdrop() documenting the requirement on the implicit
      memory barrier.
    
    CC: Peter Zijlstra <peterz@infradead.org>
    CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    CC: Boqun Feng <boqun.feng@gmail.com>
    CC: Andrew Hunter <ahh@google.com>
    CC: Maged Michael <maged.michael@gmail.com>
    CC: gromer@google.com
    CC: Avi Kivity <avi@scylladb.com>
    CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
    CC: Paul Mackerras <paulus@samba.org>
    CC: Michael Ellerman <mpe@ellerman.id.au>
    Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
    Tested-by: Dave Watson <davejwatson@fb.com>

diff --git a/MAINTAINERS b/MAINTAINERS
index f66488dfdbc9..3b035584272f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8621,7 +8621,7 @@ M:	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
 M:	"Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
-F:	kernel/membarrier.c
+F:	kernel/sched/membarrier.c
 F:	include/uapi/linux/membarrier.h
 
 MEMORY MANAGEMENT
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 659ae8094ed5..c8f7d98d8cb9 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -360,6 +360,8 @@ __notrace_funcgraph struct task_struct *__switch_to(struct task_struct *prev,
 	/*
 	 * Complete any pending TLB or cache maintenance on this CPU in case
 	 * the thread migrates to a different CPU.
+	 * This full barrier is also required by the membarrier system
+	 * call.
 	 */
 	dsb(ish);
 
diff --git a/include/uapi/linux/membarrier.h b/include/uapi/linux/membarrier.h
index e0b108bd2624..6d47b3249d8a 100644
--- a/include/uapi/linux/membarrier.h
+++ b/include/uapi/linux/membarrier.h
@@ -40,14 +40,33 @@
  *                          (non-running threads are de facto in such a
  *                          state). This covers threads from all processes
  *                          running on the system. This command returns 0.
+ * @MEMBARRIER_CMD_PRIVATE_EXPEDITED:
+ *                          Execute a memory barrier on each running
+ *                          thread belonging to the same process as the current
+ *                          thread. Upon return from system call, the
+ *                          caller thread is ensured that all its running
+ *                          threads siblings have passed through a state
+ *                          where all memory accesses to user-space
+ *                          addresses match program order between entry
+ *                          to and return from the system call
+ *                          (non-running threads are de facto in such a
+ *                          state). This only covers threads from the
+ *                          same processes as the caller thread. This
+ *                          command returns 0. The "expedited" commands
+ *                          complete faster than the non-expedited ones,
+ *                          they never block, but have the downside of
+ *                          causing extra overhead.
  *
  * Command to be passed to the membarrier system call. The commands need to
  * be a single bit each, except for MEMBARRIER_CMD_QUERY which is assigned to
  * the value 0.
  */
 enum membarrier_cmd {
-	MEMBARRIER_CMD_QUERY = 0,
-	MEMBARRIER_CMD_SHARED = (1 << 0),
+	MEMBARRIER_CMD_QUERY			= 0,
+	MEMBARRIER_CMD_SHARED			= (1 << 0),
+	/* reserved for MEMBARRIER_CMD_SHARED_EXPEDITED (1 << 1) */
+	/* reserved for MEMBARRIER_CMD_PRIVATE (1 << 2) */
+	MEMBARRIER_CMD_PRIVATE_EXPEDITED	= (1 << 3),
 };
 
 #endif /* _UAPI_LINUX_MEMBARRIER_H */
diff --git a/kernel/Makefile b/kernel/Makefile
index 4cb8e8b23c6e..9c323a6daa46 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -108,7 +108,6 @@ obj-$(CONFIG_CRASH_DUMP) += crash_dump.o
 obj-$(CONFIG_JUMP_LABEL) += jump_label.o
 obj-$(CONFIG_CONTEXT_TRACKING) += context_tracking.o
 obj-$(CONFIG_TORTURE_TEST) += torture.o
-obj-$(CONFIG_MEMBARRIER) += membarrier.o
 
 obj-$(CONFIG_HAS_IOMEM) += memremap.o
 
diff --git a/kernel/membarrier.c b/kernel/membarrier.c
deleted file mode 100644
index 9f9284f37f8d..000000000000
--- a/kernel/membarrier.c
+++ /dev/null
@@ -1,70 +0,0 @@
-/*
- * Copyright (C) 2010, 2015 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
- *
- * membarrier system call
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#include <linux/syscalls.h>
-#include <linux/membarrier.h>
-#include <linux/tick.h>
-
-/*
- * Bitmask made from a "or" of all commands within enum membarrier_cmd,
- * except MEMBARRIER_CMD_QUERY.
- */
-#define MEMBARRIER_CMD_BITMASK	(MEMBARRIER_CMD_SHARED)
-
-/**
- * sys_membarrier - issue memory barriers on a set of threads
- * @cmd:   Takes command values defined in enum membarrier_cmd.
- * @flags: Currently needs to be 0. For future extensions.
- *
- * If this system call is not implemented, -ENOSYS is returned. If the
- * command specified does not exist, or if the command argument is invalid,
- * this system call returns -EINVAL. For a given command, with flags argument
- * set to 0, this system call is guaranteed to always return the same value
- * until reboot.
- *
- * All memory accesses performed in program order from each targeted thread
- * is guaranteed to be ordered with respect to sys_membarrier(). If we use
- * the semantic "barrier()" to represent a compiler barrier forcing memory
- * accesses to be performed in program order across the barrier, and
- * smp_mb() to represent explicit memory barriers forcing full memory
- * ordering across the barrier, we have the following ordering table for
- * each pair of barrier(), sys_membarrier() and smp_mb():
- *
- * The pair ordering is detailed as (O: ordered, X: not ordered):
- *
- *                        barrier()   smp_mb() sys_membarrier()
- *        barrier()          X           X            O
- *        smp_mb()           X           O            O
- *        sys_membarrier()   O           O            O
- */
-SYSCALL_DEFINE2(membarrier, int, cmd, int, flags)
-{
-	/* MEMBARRIER_CMD_SHARED is not compatible with nohz_full. */
-	if (tick_nohz_full_enabled())
-		return -ENOSYS;
-	if (unlikely(flags))
-		return -EINVAL;
-	switch (cmd) {
-	case MEMBARRIER_CMD_QUERY:
-		return MEMBARRIER_CMD_BITMASK;
-	case MEMBARRIER_CMD_SHARED:
-		if (num_online_cpus() > 1)
-			synchronize_sched();
-		return 0;
-	default:
-		return -EINVAL;
-	}
-}
diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index 53f0164ed362..78f54932ea1d 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_SCHED_DEBUG) += debug.o
 obj-$(CONFIG_CGROUP_CPUACCT) += cpuacct.o
 obj-$(CONFIG_CPU_FREQ) += cpufreq.o
 obj-$(CONFIG_CPU_FREQ_GOV_SCHEDUTIL) += cpufreq_schedutil.o
+obj-$(CONFIG_MEMBARRIER) += membarrier.o
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index bfee6ea7db49..f77269c6c2f8 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2640,6 +2640,16 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	prev_state = prev->state;
 	vtime_task_switch(prev);
 	perf_event_task_sched_in(prev, current);
+	/*
+	 * The membarrier system call requires a full memory barrier
+	 * after storing to rq->curr, before going back to user-space.
+	 *
+	 * TODO: This smp_mb__after_unlock_lock can go away if PPC end
+	 * up adding a full barrier to switch_mm(), or we should figure
+	 * out if a smp_mb__after_unlock_lock is really the proper API
+	 * to use.
+	 */
+	smp_mb__after_unlock_lock();
 	finish_lock_switch(rq, prev);
 	finish_arch_post_lock_switch();
 
@@ -3329,6 +3339,21 @@ static void __sched notrace __schedule(bool preempt)
 	if (likely(prev != next)) {
 		rq->nr_switches++;
 		rq->curr = next;
+		/*
+		 * The membarrier system call requires each architecture
+		 * to have a full memory barrier after updating
+		 * rq->curr, before returning to user-space. For TSO
+		 * (e.g. x86), the architecture must provide its own
+		 * barrier in switch_mm(). For weakly ordered machines
+		 * for which spin_unlock() acts as a full memory
+		 * barrier, finish_lock_switch() in common code takes
+		 * care of this barrier. For weakly ordered machines for
+		 * which spin_unlock() acts as a RELEASE barrier (only
+		 * arm64 and PowerPC), arm64 has a full barrier in
+		 * switch_to(), and PowerPC has
+		 * smp_mb__after_unlock_lock() before
+		 * finish_lock_switch().
+		 */
 		++*switch_count;
 
 		trace_sched_switch(preempt, prev, next);
diff --git a/kernel/sched/membarrier.c b/kernel/sched/membarrier.c
new file mode 100644
index 000000000000..a92fddc22747
--- /dev/null
+++ b/kernel/sched/membarrier.c
@@ -0,0 +1,152 @@
+/*
+ * Copyright (C) 2010-2017 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+ *
+ * membarrier system call
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/syscalls.h>
+#include <linux/membarrier.h>
+#include <linux/tick.h>
+#include <linux/cpumask.h>
+
+#include "sched.h"	/* for cpu_rq(). */
+
+/*
+ * Bitmask made from a "or" of all commands within enum membarrier_cmd,
+ * except MEMBARRIER_CMD_QUERY.
+ */
+#define MEMBARRIER_CMD_BITMASK	\
+	(MEMBARRIER_CMD_SHARED | MEMBARRIER_CMD_PRIVATE_EXPEDITED)
+
+static void ipi_mb(void *info)
+{
+	smp_mb();	/* IPIs should be serializing but paranoid. */
+}
+
+static void membarrier_private_expedited(void)
+{
+	int cpu;
+	bool fallback = false;
+	cpumask_var_t tmpmask;
+
+	if (num_online_cpus() == 1)
+		return;
+
+	/*
+	 * Matches memory barriers around rq->curr modification in
+	 * scheduler.
+	 */
+	smp_mb();	/* system call entry is not a mb. */
+
+	/*
+	 * Expedited membarrier commands guarantee that they won't
+	 * block, hence the GFP_NOWAIT allocation flag and fallback
+	 * implementation.
+	 */
+	if (!zalloc_cpumask_var(&tmpmask, GFP_NOWAIT)) {
+		/* Fallback for OOM. */
+		fallback = true;
+	}
+
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		struct task_struct *p;
+
+		/*
+		 * Skipping the current CPU is OK even through we can be
+		 * migrated at any point. The current CPU, at the point
+		 * where we read raw_smp_processor_id(), is ensured to
+		 * be in program order with respect to the caller
+		 * thread. Therefore, we can skip this CPU from the
+		 * iteration.
+		 */
+		if (cpu == raw_smp_processor_id())
+			continue;
+		rcu_read_lock();
+		p = task_rcu_dereference(&cpu_rq(cpu)->curr);
+		if (p && p->mm == current->mm) {
+			if (!fallback)
+				__cpumask_set_cpu(cpu, tmpmask);
+			else
+				smp_call_function_single(cpu, ipi_mb, NULL, 1);
+		}
+		rcu_read_unlock();
+	}
+	if (!fallback) {
+		smp_call_function_many(tmpmask, ipi_mb, NULL, 1);
+		free_cpumask_var(tmpmask);
+	}
+	cpus_read_unlock();
+
+	/*
+	 * Memory barrier on the caller thread _after_ we finished
+	 * waiting for the last IPI. Matches memory barriers around
+	 * rq->curr modification in scheduler.
+	 */
+	smp_mb();	/* exit from system call is not a mb */
+}
+
+/**
+ * sys_membarrier - issue memory barriers on a set of threads
+ * @cmd:   Takes command values defined in enum membarrier_cmd.
+ * @flags: Currently needs to be 0. For future extensions.
+ *
+ * If this system call is not implemented, -ENOSYS is returned. If the
+ * command specified does not exist, not available on the running
+ * kernel, or if the command argument is invalid, this system call
+ * returns -EINVAL. For a given command, with flags argument set to 0,
+ * this system call is guaranteed to always return the same value until
+ * reboot.
+ *
+ * All memory accesses performed in program order from each targeted thread
+ * is guaranteed to be ordered with respect to sys_membarrier(). If we use
+ * the semantic "barrier()" to represent a compiler barrier forcing memory
+ * accesses to be performed in program order across the barrier, and
+ * smp_mb() to represent explicit memory barriers forcing full memory
+ * ordering across the barrier, we have the following ordering table for
+ * each pair of barrier(), sys_membarrier() and smp_mb():
+ *
+ * The pair ordering is detailed as (O: ordered, X: not ordered):
+ *
+ *                        barrier()   smp_mb() sys_membarrier()
+ *        barrier()          X           X            O
+ *        smp_mb()           X           O            O
+ *        sys_membarrier()   O           O            O
+ */
+SYSCALL_DEFINE2(membarrier, int, cmd, int, flags)
+{
+	if (unlikely(flags))
+		return -EINVAL;
+	switch (cmd) {
+	case MEMBARRIER_CMD_QUERY:
+	{
+		int cmd_mask = MEMBARRIER_CMD_BITMASK;
+
+		if (tick_nohz_full_enabled())
+			cmd_mask &= ~MEMBARRIER_CMD_SHARED;
+		return cmd_mask;
+	}
+	case MEMBARRIER_CMD_SHARED:
+		/* MEMBARRIER_CMD_SHARED is not compatible with nohz_full. */
+		if (tick_nohz_full_enabled())
+			return -EINVAL;
+		if (num_online_cpus() > 1)
+			synchronize_sched();
+		return 0;
+	case MEMBARRIER_CMD_PRIVATE_EXPEDITED:
+		membarrier_private_expedited();
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
