From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Fri, 4 Mar 2016 07:04:15 -0800
Message-ID: <20160304150415.GO3577@linux.vnet.ibm.com>
References: <20160304151306.05e3bb36@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:45918 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756856AbcCDPEW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Mar 2016 10:04:22 -0500
Received: from localhost
	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 4 Mar 2016 08:04:22 -0700
Content-Disposition: inline
In-Reply-To: <20160304151306.05e3bb36@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>

On Fri, Mar 04, 2016 at 03:13:06PM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   kernel/rcu/tree.c
> 
> between commit:
> 
>   27d50c7eeb0f ("rcu: Make CPU_DYING_IDLE an explicit call")
> 
> from the tip tree and commit:
> 
>   67c583a7de34 ("RCU: Privatize rcu_node::lock")
> 
> from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thank you!  I have applied this resolution to -rcu and am testing it.

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc kernel/rcu/tree.c
> index 0bbc1497a0e4,55cea189783f..000000000000
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@@ -4227,43 -4246,6 +4224,43 @@@ static void rcu_prepare_cpu(int cpu
>   		rcu_init_percpu_data(cpu, rsp);
>   }
>   
>  +#ifdef CONFIG_HOTPLUG_CPU
>  +/*
>  + * The CPU is exiting the idle loop into the arch_cpu_idle_dead()
>  + * function.  We now remove it from the rcu_node tree's ->qsmaskinit
>  + * bit masks.
>  + */
>  +static void rcu_cleanup_dying_idle_cpu(int cpu, struct rcu_state *rsp)
>  +{
>  +	unsigned long flags;
>  +	unsigned long mask;
>  +	struct rcu_data *rdp = per_cpu_ptr(rsp->rda, cpu);
>  +	struct rcu_node *rnp = rdp->mynode;  /* Outgoing CPU's rdp & rnp. */
>  +
>  +	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU))
>  +		return;
>  +
>  +	/* Remove outgoing CPU from mask in the leaf rcu_node structure. */
>  +	mask = rdp->grpmask;
>  +	raw_spin_lock_irqsave_rcu_node(rnp, flags); /* Enforce GP memory-order guarantee. */
>  +	rnp->qsmaskinitnext &= ~mask;
> - 	raw_spin_unlock_irqrestore(&rnp->lock, flags);
> ++	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  +}
>  +
>  +void rcu_report_dead(unsigned int cpu)
>  +{
>  +	struct rcu_state *rsp;
>  +
>  +	/* QS for any half-done expedited RCU-sched GP. */
>  +	preempt_disable();
>  +	rcu_report_exp_rdp(&rcu_sched_state,
>  +			   this_cpu_ptr(rcu_sched_state.rda), true);
>  +	preempt_enable();
>  +	for_each_rcu_flavor(rsp)
>  +		rcu_cleanup_dying_idle_cpu(cpu, rsp);
>  +}
>  +#endif
>  +
>   /*
>    * Handle CPU online/offline notification events.
>    */
> 
