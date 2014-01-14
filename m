From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 14 Jan 2014 21:05:47 +0100
Message-ID: <20140114200547.GM7572@laptop.programming.kicks-ass.net>
References: <20140114142627.537a702607e703c6eff63640@canb.auug.org.au>
 <20140114141406.GD7572@laptop.programming.kicks-ass.net>
 <alpine.LRH.2.02.1401141400030.19206@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.02.1401141400030.19206@file01.intranet.prod.int.rdu2.redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, Jan 14, 2014 at 02:06:57PM -0500, Mikulas Patocka wrote:
> On Tue, 14 Jan 2014, Peter Zijlstra wrote:
> > > Caused by commit 62b94a08da1b ("sched/preempt: Take away
> > > preempt_enable_no_resched() from modules")

Read these two lines, then note that:

> Try adding #include <linux/preempt.h> to speedstep-lib.c. Does it help?

this obviously will not work as preempt_check_resched() and
preempt_enable_no_resched() are no longer available to modules.

> > I think that pm commit is a very good example of why the sched/preempt
> > patch is a very good idea.
> > 
> > Also that Changelog fails to explain why enabling interrupts helps. What
> > interrupt is required for progress, and how does it make the progress
> > happen.
> 
> There is no explanation. It's hardware issue and I have no documentation 
> for the hardware.

Rafael works for Intel, he ought to be able to figure out wtf the
hardware does/needs.

> The general problem is that if there are bus-master transfers running (or 
> possibly for other hardware reasons), the CPU refuses to change frequency. 
> You can wait a little bit and retry and maybe you succeed changing the 
> frequency next time.
> 
> If you enable interrupts, wait, disable interrupts and retry, you may 
> succeed. If you keep interrupts disabled and retry, you never succeed, no 
> matter how long do you wait. I found it experimentally, I don't know 
> reason for that.

Sounds like magic goo..

In any case, try the below, it does the same but is far less horrid.

---
 drivers/cpufreq/speedstep-smi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/cpufreq/speedstep-smi.c b/drivers/cpufreq/speedstep-smi.c
index 0f5326d6f79f..57d31538c248 100644
--- a/drivers/cpufreq/speedstep-smi.c
+++ b/drivers/cpufreq/speedstep-smi.c
@@ -188,6 +188,7 @@ static void speedstep_set_state(unsigned int state)
 		return;
 
 	/* Disable IRQs */
+	preempt_disable();
 	local_irq_save(flags);
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
@@ -200,7 +201,9 @@ static void speedstep_set_state(unsigned int state)
 		if (retry) {
 			pr_debug("retry %u, previous result %u, waiting...\n",
 					retry, result);
+			local_irq_restore(flags);
 			mdelay(retry * 50);
+			local_irq_save(flags);
 		}
 		retry++;
 		__asm__ __volatile__(
@@ -217,6 +220,7 @@ static void speedstep_set_state(unsigned int state)
 
 	/* enable IRQs */
 	local_irq_restore(flags);
+	preempt_enable();
 
 	if (new_state == state)
 		pr_debug("change to %u MHz succeeded after %u tries "
