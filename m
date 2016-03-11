From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pm tree
Date: Fri, 11 Mar 2016 12:57:46 +1100
Message-ID: <20160311125746.42e35ea8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49261 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933260AbcCKB5t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 10 Mar 2016 20:57:49 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/sched/sched.h

between commit:

  adaf9fcd1369 ("cpufreq: Move scheduler-related code to the sched directory")

from the pm tree and commit:

  e9532e69b8d1 ("sched/cputime: Fix steal time accounting vs. CPU hotplug")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/sched/sched.h
index faf7e2758dd0,e6d4a3fa3660..000000000000
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@@ -1739,50 -1794,15 +1794,63 @@@ static inline u64 irq_time_read(int cpu
  #endif /* CONFIG_64BIT */
  #endif /* CONFIG_IRQ_TIME_ACCOUNTING */
  
 +#ifdef CONFIG_CPU_FREQ
 +DECLARE_PER_CPU(struct update_util_data *, cpufreq_update_util_data);
 +
 +/**
 + * cpufreq_update_util - Take a note about CPU utilization changes.
 + * @time: Current time.
 + * @util: Current utilization.
 + * @max: Utilization ceiling.
 + *
 + * This function is called by the scheduler on every invocation of
 + * update_load_avg() on the CPU whose utilization is being updated.
 + *
 + * It can only be called from RCU-sched read-side critical sections.
 + */
 +static inline void cpufreq_update_util(u64 time, unsigned long util, unsigned long max)
 +{
 +       struct update_util_data *data;
 +
 +       data = rcu_dereference_sched(*this_cpu_ptr(&cpufreq_update_util_data));
 +       if (data)
 +               data->func(data, time, util, max);
 +}
 +
 +/**
 + * cpufreq_trigger_update - Trigger CPU performance state evaluation if needed.
 + * @time: Current time.
 + *
 + * The way cpufreq is currently arranged requires it to evaluate the CPU
 + * performance state (frequency/voltage) on a regular basis to prevent it from
 + * being stuck in a completely inadequate performance level for too long.
 + * That is not guaranteed to happen if the updates are only triggered from CFS,
 + * though, because they may not be coming in if RT or deadline tasks are active
 + * all the time (or there are RT and DL tasks only).
 + *
 + * As a workaround for that issue, this function is called by the RT and DL
 + * sched classes to trigger extra cpufreq updates to prevent it from stalling,
 + * but that really is a band-aid.  Going forward it should be replaced with
 + * solutions targeted more specifically at RT and DL tasks.
 + */
 +static inline void cpufreq_trigger_update(u64 time)
 +{
 +	cpufreq_update_util(time, ULONG_MAX, 0);
 +}
 +#else
 +static inline void cpufreq_update_util(u64 time, unsigned long util, unsigned long max) {}
 +static inline void cpufreq_trigger_update(u64 time) {}
 +#endif /* CONFIG_CPU_FREQ */
++
+ static inline void account_reset_rq(struct rq *rq)
+ {
+ #ifdef CONFIG_IRQ_TIME_ACCOUNTING
+ 	rq->prev_irq_time = 0;
+ #endif
+ #ifdef CONFIG_PARAVIRT
+ 	rq->prev_steal_time = 0;
+ #endif
+ #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+ 	rq->prev_steal_time_rq = 0;
+ #endif
+ }
