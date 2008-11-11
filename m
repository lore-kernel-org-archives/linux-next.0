From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cputime tree
Date: Tue, 11 Nov 2008 17:56:21 +1100
Message-ID: <20081111175621.7a21e7aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48745 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754694AbYKKG4b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 11 Nov 2008 01:56:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>

Hi Martin,

Today's linux-next merge of the cputime tree got a conflict in
kernel/time/tick-sched.c between commit
26105f6432b27212ad5563c4d32826f7b778f0b8 ("tick: cleanup idle checks")
from the timers tree and commit 84dd5d04573c132ff107cf9d5d311d93c6ac6b61
("[PATCH] idle cputime accounting") from the cputime tree.

Just context.  I fixed it up (see below) and can carry it for now.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/time/tick-sched.c
index 35a775e,1bcbca6..0000000
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@@ -410,11 -412,13 +410,13 @@@ void tick_nohz_restart_sched_tick(void
  {
  	int cpu = smp_processor_id();
  	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
+ #ifndef CONFIG_VIRT_CPU_ACCOUNTING
  	unsigned long ticks;
+ #endif
 -	ktime_t now;
 +	ktime_t now = ktime_get();
  
  	local_irq_disable();
 -	tick_nohz_stop_idle(cpu);
 +	tick_nohz_stop_idle(ts, now);
  
  	if (!ts->inidle || !ts->tick_stopped) {
  		ts->inidle = 0;
