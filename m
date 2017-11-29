From: Lihao Liang <lianglihao@huawei.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Date: Wed, 29 Nov 2017 10:48:19 +0800
Message-ID: <0d3da4c4-1eb3-bcdc-690b-7f864ab35073@huawei.com>
References: <20171129115151.40b72764@canb.auug.org.au>
 <20171129011429.GB3624@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:39189 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752682AbdK2CtV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 21:49:21 -0500
In-Reply-To: <20171129011429.GB3624@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>

Hi Paul,

Signed-off-by: Lihao Liang <lihao.liang@gmail.com>

Many thanks,
Lihao.

On 2017/11/29 9:14, Paul E. McKenney wrote:
> On Wed, Nov 29, 2017 at 11:51:51AM +1100, Stephen Rothwell wrote:
>> Hi Paul,
>>
>> Commit
>>
>>   d7e182c9c324 ("rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data()")
>>
>> is missing a Signed-off-by from its author.
> 
> Good catch, Stephen!
> 
> Lihao, would you please get me you Signed-off-by?  The patch is below.
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit d7e182c9c32480c1f579dd888ac50e88bfb39596
> Author: Liang Lihao <lianglihao@huawei.com>
> Date:   Wed Nov 22 19:00:55 2017 +0000
> 
>     rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data()
>     
>     Since rcu_boot_init_percpu_data() is only called at boot time,
>     there is no data race and spinlock is not needed.
>     
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 69722817d6d6..0abe1db53d70 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -3636,12 +3636,9 @@ static void rcu_init_new_rnp(struct rcu_node *rnp_leaf)
>  static void __init
>  rcu_boot_init_percpu_data(int cpu, struct rcu_state *rsp)
>  {
> -	unsigned long flags;
>  	struct rcu_data *rdp = per_cpu_ptr(rsp->rda, cpu);
> -	struct rcu_node *rnp = rcu_get_root(rsp);
>  
>  	/* Set up local state, ensuring consistent view of global state. */
> -	raw_spin_lock_irqsave_rcu_node(rnp, flags);
>  	rdp->grpmask = leaf_node_cpu_bit(rdp->mynode, cpu);
>  	rdp->dynticks = &per_cpu(rcu_dynticks, cpu);
>  	WARN_ON_ONCE(rdp->dynticks->dynticks_nesting != 1);
> @@ -3649,7 +3646,6 @@ rcu_boot_init_percpu_data(int cpu, struct rcu_state *rsp)
>  	rdp->cpu = cpu;
>  	rdp->rsp = rsp;
>  	rcu_boot_init_nocb_percpu_data(rdp);
> -	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  }
>  
>  /*
> 
> 
> 
