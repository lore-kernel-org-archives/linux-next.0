From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 2/6] irq_work: Implement remote queueing
Date: Tue, 24 Jun 2014 14:33:41 -0600
Message-ID: <53A9E0A5.5040402@wwwdotorg.org>
References: <1402413309-3415-1-git-send-email-fweisbec@gmail.com> <1402413309-3415-3-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1402413309-3415-3-git-send-email-fweisbec@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet <eric.dumazet@gmail.com>, Ingo Molnar <mingo@kernel.org>, Kevin Hilman <khilman@linaro.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 06/10/2014 09:15 AM, Frederic Weisbecker wrote:
> irq work currently only supports local callbacks. However its code
> is mostly ready to run remote callbacks and we have some potential user.
> 
> The full nohz subsystem currently open codes its own remote irq work
> on top of the scheduler ipi when it wants a CPU to reevaluate its next
> tick. However this ad hoc solution bloats the scheduler IPI.
> 
> Lets just extend the irq work subsystem to support remote queuing on top
> of the generic SMP IPI to handle this kind of user. This shouldn't add
> noticeable overhead.

I'm running next-20140624 on an ARM system, and this patch causes CPU
hot(un)plug to Oops for me; the following fires:

void irq_work_run(void)
{
	BUG_ON(!in_irq());

I found that Linus's master (8b8f5d971584 "Merge tag 'compress-3.16-rc3'
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core")
works fine. I found that this commit inside the tip(?) tree works fine
(478850160636 "irq_work: Implement remote queueing"). However, if I
merge the two together, I hit that BUG_ON.

I think the issue is:

This commit adds a call from
generic_smp_call_function_single_interrupt() to irq_work_run().

Srivatsa's patch adds a call from hotplug_cfd() to
flush_smp_call_function_queue() to, which I imagine happens in
non-interrupt context. Note that this patch moves most of the body of
generic_smp_call_function_single_interrupt() into
flush_smp_call_function_queue().
