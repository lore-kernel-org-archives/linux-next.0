From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the modules and
 tip trees
Date: Thu, 28 May 2015 10:03:21 -0700
Message-ID: <20150528170321.GH5989@linux.vnet.ibm.com>
References: <20150528172507.31f6fc8c@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e32.co.us.ibm.com ([32.97.110.150]:51188 "EHLO
	e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753704AbbE1RDa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2015 13:03:30 -0400
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 28 May 2015 11:03:29 -0600
Content-Disposition: inline
In-Reply-To: <20150528172507.31f6fc8c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, May 28, 2015 at 05:25:07PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in
> include/linux/rcupdate.h between commits 0a04b0166929 ("rcu: Move
> lockless_dereference() out of rcupdate.h") from the modules tree and
> c1ad348b452a ("tick: Nohz: Rework next timer evaluation") from the tip
> tree and commits 7d0ae8086b82 ("rcu: Convert ACCESS_ONCE() to
> READ_ONCE() and WRITE_ONCE()") and 3382adbc1bb8 ("rcu: Eliminate a few
> CONFIG_RCU_NOCB_CPU_ALL #ifdefs") from the rcu tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thank you, Stephen!

Ingo, I can send you a pull request as is or I can merge c1ad348b452a
with v4.1-rc3, rebase my commits on top of that, and do another cycle
through -next.  If I don't hear otherwise, I will be lazy and send as is,
so if you would prefer something different, please let me know.

							Thanx, Paul

> I also had to add this merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 28 May 2015 17:20:58 +1000
> Subject: [PATCH] rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and
>  WRITE_ONCE()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/compiler.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index ba91e5c88a32..f7e7235f3a91 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -483,7 +483,7 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
>   */
>  #define lockless_dereference(p) \
>  ({ \
> -	typeof(p) _________p1 = ACCESS_ONCE(p); \
> +	typeof(p) _________p1 = READ_ONCE(p); \
>  	smp_read_barrier_depends(); /* Dependency order vs. p above. */ \
>  	(_________p1); \
>  })
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc include/linux/rcupdate.h
> index ed5f66464ab3,3a4d1bf430b1..000000000000
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@@ -1140,13 -1063,13 +1050,13 @@@ static inline notrace void rcu_read_unl
>   #define kfree_rcu(ptr, rcu_head)					\
>   	__kfree_rcu(&((ptr)->rcu_head), offsetof(typeof(*(ptr)), rcu_head))
>   
> - #if defined(CONFIG_TINY_RCU) || defined(CONFIG_RCU_NOCB_CPU_ALL)
> + #ifdef CONFIG_TINY_RCU
>  -static inline int rcu_needs_cpu(unsigned long *delta_jiffies)
>  +static inline int rcu_needs_cpu(u64 basemono, u64 *nextevt)
>   {
>  -	*delta_jiffies = ULONG_MAX;
>  +	*nextevt = KTIME_MAX;
>   	return 0;
>   }
> - #endif /* #if defined(CONFIG_TINY_RCU) || defined(CONFIG_RCU_NOCB_CPU_ALL) */
> + #endif /* #ifdef CONFIG_TINY_RCU */
>   
>   #if defined(CONFIG_RCU_NOCB_CPU_ALL)
>   static inline bool rcu_is_nocb_cpu(int cpu) { return true; }
