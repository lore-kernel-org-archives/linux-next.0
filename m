From: Ingo Molnar <mingo@kernel.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 17 Jul 2015 21:51:31 +0200
Message-ID: <20150717195131.GA27792@gmail.com>
References: <20150716131423.4c849184@canb.auug.org.au>
 <20150716035138.GQ3717@linux.vnet.ibm.com>
 <20150717114046.GB5396@gmail.com>
 <20150717173528.GH3717@linux.vnet.ibm.com>
 <20150717185321.GA10554@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:32874 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbbGQTvg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2015 15:51:36 -0400
Content-Disposition: inline
In-Reply-To: <20150717185321.GA10554@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>


* Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:

> And here is a prototype patch, which I intend to merge with the existing patch 
> that renames rcu_lockdep_assert() to RCU_LOCKDEP_WARN().  I will also queue a 
> revert of the patch below for 4.4.
> 
> Thoughts?
> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> index 41c49b12fe6d..663d6e028c3d 100644
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@ -536,9 +536,29 @@ static inline int rcu_read_lock_sched_held(void)
>  
>  #endif /* #else #ifdef CONFIG_DEBUG_LOCK_ALLOC */
>  
> +/* Deprecate the rcu_lockdep_assert() macro. */
> +static inline void __attribute((deprecated)) deprecate_rcu_lockdep_assert(void)
> +{
> +}
> +
>  #ifdef CONFIG_PROVE_RCU
>  
>  /**
> + * rcu_lockdep_assert - emit lockdep splat if specified condition not met
> + * @c: condition to check
> + * @s: informative message
> + */
> +#define rcu_lockdep_assert(c, s)					\
> +	do {								\
> +		static bool __section(.data.unlikely) __warned;		\
> +		deprecate_rcu_lockdep_assert();				\
> +		if (debug_lockdep_rcu_enabled() && !__warned && !(c)) {	\
> +			__warned = true;				\
> +			lockdep_rcu_suspicious(__FILE__, __LINE__, s);	\
> +		}							\

Btw., out of general macro paranoia I'd write such constructs as something like:

		if (!(c) && debug_lockdep_rcu_enabled() && !__warned) {	\

I.e. always evaluate 'c' even if debugging is off. This way if the construct is 
fed an expression with a side effect (bad idea!) then it still works regardless of 
whether the warning triggered already or not.

But this construct is OK too to me, so feel free to add my:

  Reviewed-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
