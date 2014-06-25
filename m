From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/6] irq_work: Implement remote queueing
Date: Wed, 25 Jun 2014 12:07:05 +0530
Message-ID: <53AA6E11.1000404@linux.vnet.ibm.com>
References: <1402413309-3415-1-git-send-email-fweisbec@gmail.com> <1402413309-3415-3-git-send-email-fweisbec@gmail.com> <53A9E0A5.5040402@wwwdotorg.org> <20140625051234.GD6758@twins.programming.kicks-ass.net> <20140625051721.GG3588@twins.programming.kicks-ass.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp07.au.ibm.com ([202.81.31.140]:40255 "EHLO
	e23smtp07.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751415AbaFYGi4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Jun 2014 02:38:56 -0400
Received: from /spool/local
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <srivatsa.bhat@linux.vnet.ibm.com>;
	Wed, 25 Jun 2014 16:38:54 +1000
In-Reply-To: <20140625051721.GG3588@twins.programming.kicks-ass.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Eric Dumazet <eric.dumazet@gmail.com>, Ingo Molnar <mingo@kernel.org>, Kevin Hilman <khilman@linaro.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On 06/25/2014 10:47 AM, Peter Zijlstra wrote:
> On Wed, Jun 25, 2014 at 07:12:34AM +0200, Peter Zijlstra wrote:
>> On Tue, Jun 24, 2014 at 02:33:41PM -0600, Stephen Warren wrote:
>>> On 06/10/2014 09:15 AM, Frederic Weisbecker wrote:
>>>> irq work currently only supports local callbacks. However its code
>>>> is mostly ready to run remote callbacks and we have some potential user.

[...]

>> Right you are.. I think I'll just remove the BUG_ON(), Frederic?
> 
> Something a little so like:
> 
> ---
> Subject: irq_work: Remove BUG_ON in irq_work_run_list()

I think this should be irq_work_run(), see below...

> From: Peter Zijlstra <peterz@infradead.org>
> Date: Wed Jun 25 07:13:07 CEST 2014
> 
> Because of a collision with 8d056c48e486 ("CPU hotplug, smp: flush any
> pending IPI callbacks before CPU offline"), which ends up calling
> hotplug_cfd()->flush_smp_call_function_queue()->run_irq_work(), which


s/run_irq_work/irq_work_run


> is not from IRQ context.
> 
> Cc: Frederic Weisbecker <fweisbec@gmail.com>
> Reported-by: Stephen Warren <swarren@wwwdotorg.org>
> Signed-off-by: Peter Zijlstra <peterz@infradead.org>
> ---
>  kernel/irq_work.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> --- a/kernel/irq_work.c
> +++ b/kernel/irq_work.c
> @@ -130,8 +130,6 @@ static void irq_work_run_list(struct lli
>  	struct irq_work *work;
>  	struct llist_node *llnode;
>  
> -	BUG_ON(!irqs_disabled());
> -

I don't think irqs_disabled() is the problematic condition, since
hotplug_cfg() invokes irq_work_run() from CPU_DYING context (which has
irqs disabled). I guess you meant to remove the in_irq() check inside
irq_work_run() instead?

Regards,
Srivatsa S. Bhat

>  	if (llist_empty(list))
>  		return;
>  
> 
