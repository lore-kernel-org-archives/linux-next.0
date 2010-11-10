From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for November 10 (kernel/rcutiny)
Date: Wed, 10 Nov 2010 15:36:52 -0800
Message-ID: <4CDB2C94.4010007@oracle.com>
References: <20101110140719.139ebe51.sfr@canb.auug.org.au> <20101110091926.dc834e84.randy.dunlap@oracle.com> <20101110230708.GV4032@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:26089 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757507Ab0KJXid (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Nov 2010 18:38:33 -0500
In-Reply-To: <20101110230708.GV4032@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 11/10/10 15:07, Paul E. McKenney wrote:
> On Wed, Nov 10, 2010 at 09:19:26AM -0800, Randy Dunlap wrote:
>> On Wed, 10 Nov 2010 14:07:19 +1100 Stephen Rothwell wrote:
>>
>>> Hi all,
>>>
>>> Changes since 20101109:
>>
>>
>> when CONFIG_RCU_BOOST is not enabled:
>>
>> In file included from linux-next-20101110/kernel/rcutiny.c:53:
>> linux-next-20101110/kernel/rcutiny_plugin.h: In function 'rcu_preempt_cpu_qs':
>> linux-next-20101110/kernel/rcutiny_plugin.h:413: error: 'struct rcu_preempt_ctrlblk' has no member named 'n_normal_balk_blkd_tasks'
> 
> Hello, Randy,
> 
> Good catch!  Could you please try the following patch?

(you tested this build, didn't you?)

> 							Thanx, Paul

Yes, this builds.  Thanks.

Acked-by: Randy Dunlap <randy.dunlap@oracle.com>


> ------------------------------------------------------------------------
> 
> diff --git a/kernel/rcutiny_plugin.h b/kernel/rcutiny_plugin.h
> index 297aa35..8cd197c 100644
> --- a/kernel/rcutiny_plugin.h
> +++ b/kernel/rcutiny_plugin.h
> @@ -297,9 +297,17 @@ static int rcu_boost(void)
>   * the current grace period, and, if so, tell the rcu_kthread_task to
>   * start boosting them.  If there is an expedited boost in progress,
>   * we wait for it to complete.
> + *
> + * If there are no blocked readers blocking the current grace period,
> + * return 0 to let the caller know, otherwise return 1.  Note that this
> + * return value is independent of whether or not boosting was done.
>   */
> -static void rcu_initiate_boost(void)
> +static int rcu_initiate_boost(void)
>  {
> +	if (!rcu_preempt_blocked_readers_cgp()) {
> +		RCU_TRACE(rcu_preempt_ctrlblk.n_normal_balk_blkd_tasks++);
> +		return 0;
> +	}
>  	if (rcu_preempt_ctrlblk.gp_tasks != NULL &&
>  	    rcu_preempt_ctrlblk.boost_tasks == NULL &&
>  	    rcu_preempt_ctrlblk.boosted_this_gp == 0 &&
> @@ -309,6 +317,7 @@ static void rcu_initiate_boost(void)
>  		RCU_TRACE(rcu_preempt_ctrlblk.n_normal_boosts++);
>  	} else
>  		RCU_TRACE(rcu_initiate_boost_trace());
> +	return 1;
>  }
>  
>  /*
> @@ -353,10 +362,13 @@ static int rcu_boost(void)
>  }
>  
>  /*
> - * If there is no RCU priority boosting, we don't initiate boosting.
> + * If there is no RCU priority boosting, we don't initiate boosting,
> + * but we do indicate whether there are blocked readers blocking the
> + * current grace period.
>   */
> -static void rcu_initiate_boost(void)
> +static int rcu_initiate_boost(void)
>  {
> +	return rcu_preempt_blocked_readers_cgp();
>  }
>  
>  /*
> @@ -405,12 +417,12 @@ static void rcu_preempt_cpu_qs(void)
>  	/* If there is no GP then there is nothing more to do.  */
>  	if (!rcu_preempt_gp_in_progress())
>  		return;
> -	/* If there are blocked readers, go check up on boosting. */
> -	if (rcu_preempt_blocked_readers_cgp()) {
> -		rcu_initiate_boost();
> +	/*
> +	 * Check up on boosting.  If there are no readers blocking the
> +	 * current grace period, leave.
> +	 */
> +	if (rcu_initiate_boost())
>  		return;
> -	} else
> -		RCU_TRACE(rcu_preempt_ctrlblk.n_normal_balk_blkd_tasks++);
>  
>  	/* Advance callbacks. */
>  	rcu_preempt_ctrlblk.completed = rcu_preempt_ctrlblk.gpnum;


-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
