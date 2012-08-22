From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 21 Aug 2012 22:05:40 -0700
Message-ID: <20120822050540.GC2531@linux.vnet.ibm.com>
References: <20120822142735.5366c9abdee5274329e65fe3@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:46735 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753911Ab2HVFGL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 22 Aug 2012 01:06:11 -0400
Received: from /spool/local
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 21 Aug 2012 23:06:11 -0600
Content-Disposition: inline
In-Reply-To: <20120822142735.5366c9abdee5274329e65fe3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>

On Wed, Aug 22, 2012 at 02:27:35PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in
> kernel/rcutree.h between commit 62ab7072476a ("rcu: Use
> smp_hotplug_thread facility for RCUs per-CPU kthread") from the tip tree
> and commit daa5d37ff51b ("rcu: Prevent force_quiescent_state() memory
> contention") from the rcu tree.
> 
> Just context changes (I think).  I fixed it up (see below) and can carry
> the fix as necessary.

This one also looks correct.

							Thanx, Paul

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc kernel/rcutree.h
> index 1224d4c,c2a3e7d..0000000
> --- a/kernel/rcutree.h
> +++ b/kernel/rcutree.h
> @@@ -196,6 -200,13 +200,7 @@@ struct rcu_node 
>   				/* Refused to boost: not sure why, though. */
>   				/*  This can happen due to race conditions. */
>   #endif /* #ifdef CONFIG_RCU_BOOST */
>  -	struct task_struct *node_kthread_task;
>  -				/* kthread that takes care of this rcu_node */
>  -				/*  structure, for example, awakening the */
>  -				/*  per-CPU kthreads as needed. */
>  -	unsigned int node_kthread_status;
>  -				/* State of node_kthread_task for tracing. */
> + 	raw_spinlock_t fqslock ____cacheline_internodealigned_in_smp;
>   } ____cacheline_internodealigned_in_smp;
>   
>   /*
