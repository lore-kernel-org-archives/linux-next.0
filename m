From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr_cpumask tree
Date: Fri, 2 Jan 2009 13:43:36 +1100
Message-ID: <20090102134336.b799ae75.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44584 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755550AbZABCnk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 1 Jan 2009 21:43:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Sebastien Dugue <sebastien.dugue@bull.net>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr_cpumask tree got a conflict in
kernel/time/tick-common.c between commit
5762ba1873b0bb9faa631aaa02f533c2b9837f82 ("hrtimers: allow the
hot-unplugging of all cpus") from the timers tree and commit
6b954823c24f04ed026a8517f6bab5abda279db8 ("cpumask: convert kernel time
functions") from the rr_cpumask tree.

I fixed it up (see below) and can carry the fix as necessary., 
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/time/tick-common.c
index b21410b,63e05d4..0000000
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@@ -274,21 -274,6 +274,21 @@@ out_bc
  }
  
  /*
 + * Transfer the do_timer job away from a dying cpu.
 + *
 + * Called with interrupts disabled.
 + */
 +static void tick_handover_do_timer(int *cpup)
 +{
 +	if (*cpup == tick_do_timer_cpu) {
- 		int cpu = first_cpu(cpu_online_map);
++		int cpu = cpumask_first(cpu_online_map);
 +
- 		tick_do_timer_cpu = (cpu != NR_CPUS) ? cpu :
++		tick_do_timer_cpu = (cpu < nr_cpu_ids) ? cpu :
 +			TICK_DO_TIMER_NONE;
 +	}
 +}
 +
 +/*
   * Shutdown an event device on a given cpu:
   *
   * This is called on a life CPU, when a CPU is dead. So we cannot
