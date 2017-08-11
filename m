From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Thu, 10 Aug 2017 21:54:53 -0700
Message-ID: <20170811045453.GB3730@linux.vnet.ibm.com>
References: <20170811144352.585085e2@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60354 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750796AbdHKEy7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Aug 2017 00:54:59 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7B4sRUs056917
        for <linux-next@vger.kernel.org>; Fri, 11 Aug 2017 00:54:59 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2c93r3cy9a-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Fri, 11 Aug 2017 00:54:58 -0400
Received: from localhost
        by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 11 Aug 2017 00:54:57 -0400
Content-Disposition: inline
In-Reply-To: <20170811144352.585085e2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Aug 11, 2017 at 02:43:52PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the rcu tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> kernel/sched/core.c: In function 'do_task_dead':
> kernel/sched/core.c:3385:2: error: implicit declaration of function 'smp_mb__before_spinlock' [-Werror=implicit-function-declaration]
>   smp_mb__before_spinlock();
>   ^
> cc1: some warnings being treated as errors
> 
> Caused by commit
> 
>   4a6fc6107e90 ("sched: Replace spin_unlock_wait() with lock/unlock pair")
> 
> Interacting with commit
> 
>   a9668cd6ee28 ("locking: Remove smp_mb__before_spinlock()")
> 
> from the tip tree.
> 
> I applied this patch for now, but I assume something better is required.

Looks like I need to rebase my patch on top of a9668cd6ee28, and
than put an smp_mb__after_spinlock() between the lock and the unlock.

Peter, any objections to that approach?  Other suggestions?

							Thanx, Paul

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 11 Aug 2017 14:32:10 +1000
> Subject: [PATCH] sched: temporary hack for locking: Remove smp_mb__before_spinlock()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/sched/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2bd00feaea15..a4f4ba2e3be6 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3382,7 +3382,7 @@ void __noreturn do_task_dead(void)
>  	 * To avoid it, we have to wait for releasing tsk->pi_lock which
>  	 * is held by try_to_wake_up()
>  	 */
> -	smp_mb__before_spinlock();
> +	smp_mb();
>  	raw_spin_lock_irq(&current->pi_lock);
>  	raw_spin_unlock_irq(&current->pi_lock);
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
