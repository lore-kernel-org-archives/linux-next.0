From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Mon, 18 Jul 2016 20:00:45 -0700
Message-ID: <20160719030045.GR7094@linux.vnet.ibm.com>
References: <20160718152628.312b3e43@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49197 "EHLO
	mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752187AbcGSDAd (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 23:00:33 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id u6J2wfAg128198
	for <linux-next@vger.kernel.org>; Mon, 18 Jul 2016 23:00:32 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2495r91cph-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 18 Jul 2016 23:00:32 -0400
Received: from localhost
	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Mon, 18 Jul 2016 23:00:30 -0400
Content-Disposition: inline
In-Reply-To: <20160718152628.312b3e43@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anna-Maria Gleixner <anna-maria@linutronix.de>

On Mon, Jul 18, 2016 at 03:26:28PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree.c
> 
> between commit:
> 
>   4df8374254ea ("rcu: Convert rcutree to hotplug state machine")
> 
> from the tip tree and commit:
> 
>   2a84cde733b0 ("rcu: Exact CPU-online tracking for RCU")
> 
> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Ah, that is in -tip now?  Easier to test, then!

Thank you, the patch looks good at first glance, but will beat it up
a bit.

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree.c
> index e5164deb51e1,5663d1e899d3..000000000000
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@@ -3812,54 -3809,34 +3809,80 @@@ int rcutree_prepare_cpu(unsigned int cp
>   
>   	for_each_rcu_flavor(rsp)
>   		rcu_init_percpu_data(cpu, rsp);
>  +
>  +	rcu_prepare_kthreads(cpu);
>  +	rcu_spawn_all_nocb_kthreads(cpu);
>  +
>  +	return 0;
>  +}
>  +
>  +static void rcutree_affinity_setting(unsigned int cpu, int outgoing)
>  +{
>  +	struct rcu_data *rdp = per_cpu_ptr(rcu_state_p->rda, cpu);
>  +
>  +	rcu_boost_kthread_setaffinity(rdp->mynode, outgoing);
>  +}
>  +
>  +int rcutree_online_cpu(unsigned int cpu)
>  +{
>  +	sync_sched_exp_online_cleanup(cpu);
>  +	rcutree_affinity_setting(cpu, -1);
>  +	return 0;
>  +}
>  +
>  +int rcutree_offline_cpu(unsigned int cpu)
>  +{
>  +	rcutree_affinity_setting(cpu, cpu);
>  +	return 0;
>  +}
>  +
>  +
>  +int rcutree_dying_cpu(unsigned int cpu)
>  +{
>  +	struct rcu_state *rsp;
>  +
>  +	for_each_rcu_flavor(rsp)
>  +		rcu_cleanup_dying_cpu(rsp);
>  +	return 0;
>  +}
>  +
>  +int rcutree_dead_cpu(unsigned int cpu)
>  +{
>  +	struct rcu_state *rsp;
>  +
>  +	for_each_rcu_flavor(rsp) {
>  +		rcu_cleanup_dead_cpu(cpu, rsp);
>  +		do_nocb_deferred_wakeup(per_cpu_ptr(rsp->rda, cpu));
>  +	}
>  +	return 0;
>   }
>   
> + /*
> +  * Mark the specified CPU as being online so that subsequent grace periods
> +  * (both expedited and normal) will wait on it.  Note that this means that
> +  * incoming CPUs are not allowed to use RCU read-side critical sections
> +  * until this function is called.  Failing to observe this restriction
> +  * will result in lockdep splats.
> +  */
> + void rcu_cpu_starting(unsigned int cpu)
> + {
> + 	unsigned long flags;
> + 	unsigned long mask;
> + 	struct rcu_data *rdp;
> + 	struct rcu_node *rnp;
> + 	struct rcu_state *rsp;
> + 
> + 	for_each_rcu_flavor(rsp) {
> + 		rdp = this_cpu_ptr(rsp->rda);
> + 		rnp = rdp->mynode;
> + 		mask = rdp->grpmask;
> + 		raw_spin_lock_irqsave_rcu_node(rnp, flags);
> + 		rnp->qsmaskinitnext |= mask;
> + 		rnp->expmaskinitnext |= mask;
> + 		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
> + 	}
> + }
> + 
>   #ifdef CONFIG_HOTPLUG_CPU
>   /*
>    * The CPU is exiting the idle loop into the arch_cpu_idle_dead()
> @@@ -4208,9 -4231,12 +4231,11 @@@ void __init rcu_init(void
>   	 * this is called early in boot, before either interrupts
>   	 * or the scheduler are operational.
>   	 */
>  -	cpu_notifier(rcu_cpu_notify, 0);
>   	pm_notifier(rcu_pm_notify, 0);
> - 	for_each_online_cpu(cpu)
> + 	for_each_online_cpu(cpu) {
>  -		rcu_cpu_notify(NULL, CPU_UP_PREPARE, (void *)(long)cpu);
>  +		rcutree_prepare_cpu(cpu);
> + 		rcu_cpu_starting(cpu);
> + 	}
>   }
>   
>   #include "tree_exp.h"
> 
