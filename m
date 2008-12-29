From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Mon, 29 Dec 2008 13:02:24 +1100
Message-ID: <20081229130224.e792474a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43695 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750929AbYL2CCb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 21:02:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, "Woodruff, Richard" <r-woodruff2@ti.com>, Andrew Morton <akpm@linux-foundation.org>

Hi all,

Today's linux-next merge of the timers tree got a conflict in
kernel/time/tick-sched.c between commit
6a7b3dc3440f7b5a9b67594af01ed562cdeb41e4 ("sched: convert nohz_cpu_mask
to cpumask_var_t") from the cpus4096 tree and commit
001474491fabeca233168a8598f721c808040f90 ("nohz: suppress needless timer
reprogramming") from the timers tree.

Just context changing.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/time/tick-sched.c
index 70f872c,8f3fc25..0000000
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@@ -282,8 -282,31 +282,31 @@@ void tick_nohz_stop_sched_tick(int inid
  	/* Schedule the tick, if we are at least one jiffie off */
  	if ((long)delta_jiffies >= 1) {
  
+ 		/*
+ 		* calculate the expiry time for the next timer wheel
+ 		* timer
+ 		*/
+ 		expires = ktime_add_ns(last_update, tick_period.tv64 *
+ 				   delta_jiffies);
+ 
+ 		/*
+ 		 * If this cpu is the one which updates jiffies, then
+ 		 * give up the assignment and let it be taken by the
+ 		 * cpu which runs the tick timer next, which might be
+ 		 * this cpu as well. If we don't drop this here the
+ 		 * jiffies might be stale and do_timer() never
+ 		 * invoked.
+ 		 */
+ 		if (cpu == tick_do_timer_cpu)
+ 			tick_do_timer_cpu = TICK_DO_TIMER_NONE;
+ 
  		if (delta_jiffies > 1)
 -			cpu_set(cpu, nohz_cpu_mask);
 +			cpumask_set_cpu(cpu, nohz_cpu_mask);
+ 
+ 		/* Skip reprogram of event if its not changed */
+ 		if (ts->tick_stopped && ktime_equal(expires, dev->next_event))
+ 			goto out;
+ 
  		/*
  		 * nohz_stop_sched_tick can be called several times before
  		 * the nohz_restart_sched_tick is called. This happens when
