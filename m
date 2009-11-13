From: Gautham R Shenoy <ego@in.ibm.com>
Subject: Re: -next: Nov 12 - kernel BUG at kernel/sched.c:7359!
Date: Fri, 13 Nov 2009 15:28:01 +0530
Message-ID: <20091113095801.GA29977@in.ibm.com>
References: <20091112195101.63263490.sfr@canb.auug.org.au> <4AFBF73B.5040500@in.ibm.com> <1258027820.4039.129.camel@laptop> <4AFBFE3D.80507@in.ibm.com> <1258028831.4039.152.camel@laptop> <1258045831.4039.736.camel@laptop>
Reply-To: ego@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp07.in.ibm.com ([122.248.162.7]:33330 "EHLO
	e28smtp07.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755732AbZKMJ5w (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 13 Nov 2009 04:57:52 -0500
Content-Disposition: inline
In-Reply-To: <1258045831.4039.736.camel@laptop>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sachin Sant <sachinp@in.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Mike Galbraith <efault@gmx.de>

On Thu, Nov 12, 2009 at 06:10:31PM +0100, Peter Zijlstra wrote:
> 
> diff --git a/kernel/sched.c b/kernel/sched.c
> index 1f2e99d..62df61c 100644
> --- a/kernel/sched.c
> +++ b/kernel/sched.c
> @@ -2377,6 +2377,9 @@ static int try_to_wake_up(struct task_struct *p, unsigned int state,
>  	task_rq_unlock(rq, &flags);
> 

How about this ?

again:
  	cpu = p->sched_class->select_task_rq(p, SD_BALANCE_WAKE, wake_flags);
 	if (!cpu_online(cpu))
 		cpu = cpumask_any_and(&p->cpus_allowed, cpu_active_mask);
	if (!cpu) {
		set_task_affinity(); 
		goto again;
	}
> +
>  	if (cpu != orig_cpu) {
>  		local_irq_save(flags);
>  		rq = cpu_rq(cpu);

Will it help further narrow down the window ?
> 
> 
> Something I think Mike also tried and didn't deadlock for him..
> 
> Sachin, Mike, could you try the above snippet and verify if it does
> indeed solve your respective issues?
> 
> /me prays it does, because otherwise I'm fresh out of clue...

-- 
Thanks and Regards
gautham
