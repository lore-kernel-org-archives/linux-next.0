From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Tue, 21 Oct 2008 12:43:05 +1100
Message-ID: <20081021124305.e6cdd2cc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43398 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751927AbYJUBnK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 21:43:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>

Hi all,

Today's linux-next merge of the timers tree got a conflict in
kernel/time/tick-sched.c between commit
c34bec5a44e9486597d78e7a686b2f9088a0564c ("") from Linus' tree and commit
cc584b213f252bf698849cf4be2377cd3ec7501a ("hrtimer: convert kernel/* to
the new hrtimer apis") from the timers tree.

The former moved the code that the latter modified.  I fixed it up (see
below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/time/tick-sched.c
index 0581c11,55b0e91..0000000
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@@ -377,32 -377,6 +377,32 @@@ ktime_t tick_nohz_get_sleep_length(void
  	return ts->sleep_length;
  }
  
 +static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
 +{
 +	hrtimer_cancel(&ts->sched_timer);
- 	ts->sched_timer.expires = ts->idle_tick;
++	hrtimer_set_expires(&ts->sched_timer, ts->idle_tick);
 +
 +	while (1) {
 +		/* Forward the time to expire in the future */
 +		hrtimer_forward(&ts->sched_timer, now, tick_period);
 +
 +		if (ts->nohz_mode == NOHZ_MODE_HIGHRES) {
- 			hrtimer_start(&ts->sched_timer,
- 				      ts->sched_timer.expires,
++			hrtimer_start_expires(&ts->sched_timer,
 +				      HRTIMER_MODE_ABS);
 +			/* Check, if the timer was already in the past */
 +			if (hrtimer_active(&ts->sched_timer))
 +				break;
 +		} else {
- 			if (!tick_program_event(ts->sched_timer.expires, 0))
++			if (!tick_program_event(
++				hrtimer_get_expires(&ts->sched_timer), 0))
 +				break;
 +		}
 +		/* Update jiffies and reread time */
 +		tick_do_update_jiffies64(now);
 +		now = ktime_get();
 +	}
 +}
 +
  /**
   * tick_nohz_restart_sched_tick - restart the idle tick from the idle task
   *
