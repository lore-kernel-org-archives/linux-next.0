From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Wed, 15 Jul 2015 20:51:38 -0700
Message-ID: <20150716035138.GQ3717@linux.vnet.ibm.com>
References: <20150716131423.4c849184@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:40878 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbbGPDvu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 15 Jul 2015 23:51:50 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 15 Jul 2015 21:51:50 -0600
Content-Disposition: inline
In-Reply-To: <20150716131423.4c849184@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

On Thu, Jul 16, 2015 at 01:14:23PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> kernel/notifier.c: In function 'notify_die':
> kernel/notifier.c:547:2: error: implicit declaration of function 'rcu_lockdep_assert' [-Werror=implicit-function-declaration]
>   rcu_lockdep_assert(rcu_is_watching(),
>   ^
> 
> Caused by commit
> 
>   02300fdb3e5f ("rcu: Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()")
> 
> interacting with commit
> 
>   e727c7d7a11e ("notifiers, RCU: Assert that RCU is watching in notify_die()")
> 
> [ and I also noted
>   0333a209cbf6 ("x86/irq, context_tracking: Document how IRQ context tracking works and add an RCU assertion")
> ]
> 
> from the tip tree.

Thank you in both cases!  I suspect that more will follow, so is there
something I can do to make this easier?  (Hard for me to patch stuff
that is not yet in the tree...)

							Thanx, Paul

> I added the following merge fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 16 Jul 2015 13:08:50 +1000
> Subject: [PATCH] rcu: merge fix for Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kernel/irq.c | 2 +-
>  kernel/notifier.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/irq.c b/arch/x86/kernel/irq.c
> index 30dbf35bc90b..f9cd81825187 100644
> --- a/arch/x86/kernel/irq.c
> +++ b/arch/x86/kernel/irq.c
> @@ -234,7 +234,7 @@ __visible unsigned int __irq_entry do_IRQ(struct pt_regs *regs)
>  	entering_irq();
> 
>  	/* entering_irq() tells RCU that we're not quiescent.  Check it. */
> -	rcu_lockdep_assert(rcu_is_watching(), "IRQ failed to wake up RCU");
> +	RCU_LOCKDEP_WARN(!rcu_is_watching(), "IRQ failed to wake up RCU");
> 
>  	irq = __this_cpu_read(vector_irq[vector]);
> 
> diff --git a/kernel/notifier.c b/kernel/notifier.c
> index 980e4330fb59..fd2c9acbcc19 100644
> --- a/kernel/notifier.c
> +++ b/kernel/notifier.c
> @@ -544,7 +544,7 @@ int notrace notify_die(enum die_val val, const char *str,
>  		.signr	= sig,
> 
>  	};
> -	rcu_lockdep_assert(rcu_is_watching(),
> +	RCU_LOCKDEP_WARN(!rcu_is_watching(),
>  			   "notify_die called but RCU thinks we're quiescent");
>  	return atomic_notifier_call_chain(&die_chain, val, &args);
>  }
> -- 
> 2.1.4
> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
