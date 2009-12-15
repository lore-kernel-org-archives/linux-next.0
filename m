From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [Next] CPU Hotplug test failures on powerpc
Date: Tue, 15 Dec 2009 11:43:47 +0100
Message-ID: <1260873827.4165.362.camel@twins>
References: <4B2224C7.1020908@in.ibm.com> <1260786122.4165.142.camel@twins>
	 <4B261D7A.9040802@in.ibm.com>  <1260793182.4165.223.camel@twins>
	 <1260825420.2217.40.camel@pasglop>  <4B275A6B.9030200@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40192 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759667AbZLOKny convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2009 05:43:54 -0500
In-Reply-To: <4B275A6B.9030200@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sachin Sant <sachinp@in.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Linux/PPC Development <linuxppc-dev@ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

On Tue, 2009-12-15 at 15:14 +0530, Sachin Sant wrote:
> Benjamin Herrenschmidt wrote:
> >> static void move_task_off_dead_cpu(int dead_cpu, struct task_struct *p)
> >> {
> >>         int dest_cpu;
> >>         const struct cpumask *nodemask = cpumask_of_node(cpu_to_node(dead_cpu));
> >>
> >> again:
> >>         /* Look for allowed, online CPU in same node. */
> >>         for_each_cpu_and(dest_cpu, nodemask, cpu_active_mask)
> >>                 if (cpumask_test_cpu(dest_cpu, &p->cpus_allowed))
> >>                         goto move;
> >>
> >>         /* Any allowed, online CPU? */
> >>         dest_cpu = cpumask_any_and(&p->cpus_allowed, cpu_active_mask);
> >>         if (dest_cpu < nr_cpu_ids)
> >>                 goto move;
> >>
> >>         /* No more Mr. Nice Guy. */
> >>         if (dest_cpu >= nr_cpu_ids) {
> >>                 cpuset_cpus_allowed_locked(p, &p->cpus_allowed);
> >> ====>           dest_cpu = cpumask_any_and(cpu_active_mask, &p->cpus_allowed);
> >>
> >>                 /*
> >>                  * Don't tell them about moving exiting tasks or
> >>                  * kernel threads (both mm NULL), since they never
> >>                  * leave kernel.
> >>                  */
> >>                 if (p->mm && printk_ratelimit()) {
> >>                         pr_info("process %d (%s) no longer affine to cpu%d\n",
> >>                                 task_pid_nr(p), p->comm, dead_cpu);
> >>                 }
> >>         }
> >>
> >> move:
> >>         /* It can have affinity changed while we were choosing. */
> >>         if (unlikely(!__migrate_task_irq(p, dead_cpu, dest_cpu)))
> >>                 goto again;
> >> }
> >>
> >> Both masks, p->cpus_allowed and cpu_active_mask are stable in that p
> >> won't go away since we hold the tasklist_lock (in migrate_list_tasks),
> >> and cpu_active_mask is static storage, so WTH is it going funny on?
> >>     
> I added some debug statements within the above code. 
> This is a 2 cpu machine.
> 
> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
> XMON dest_cpu = 1024 
> XMON dest_cpu = 1024 . dead_cpu = 1
> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
> XMON dest_cpu = 1024 
> XMON dest_cpu = 1024 . dead_cpu = 1
> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
> XMON dest_cpu = 1024 
> XMON dest_cpu = 1024 . dead_cpu = 1
> 
> Seems to me that the control is stuck in an infinite loop and hence the
> machine appears to be in hung state. The dest_cpu value is always 1024
> and never changes, which result in an infinite loop.
> 
> In working scenario the o/p is something on the following lines
> 
> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
> XMON dest_cpu = 0 
> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
> XMON dest_cpu = 0 
> XMON dest_cpu = 1024 . dead_cpu = 1 . nr_cpu_ids = 2
> XMON dest_cpu = 0 
> 
> Let me know if i should try to record any specific value ?

Could you possibly print the two masks themselves? cpumask_scnprintf()
and friend come in handy for this.

The dest_cpu=1024 thing seem to suggest the intersection between
p->cpus_allowed and cpu_active_mask is empty for some reason, even
though we forcefully reset p->cpus_allowed to the full set using
cpuset_cpus_allowed_locked().

/me goes re-read the cpu_active_map code, this really shouldn't happen.
