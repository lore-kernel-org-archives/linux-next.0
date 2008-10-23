From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 23 Oct 2008 09:17:27 +0200
Message-ID: <1224746247.834.4.camel@twins>
References: <20081023150130.f8fdfd5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from viefep18-int.chello.at ([213.46.255.22]:12296 "EHLO
	viefep18-int.chello.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751872AbYJWHRk (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 03:17:40 -0400
In-Reply-To: <20081023150130.f8fdfd5e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Mike Travis <travis@sgi.com>

On Thu, 2008-10-23 at 15:01 +1100, Stephen Rothwell wrote:
> 
> Hi Rusty,
> 
> Today's linux-next merge of the rr tree got a conflict in
> kernel/sched.c
> between commit tg_shares_up ("sched: optimize group load balancer")
> from
> the sched tree and commit 1a39c64ec96acde2a0f43bbe408efc328541a73e
> ("cpumask:for_each_cpu") from the rr tree.
> 
> Overlapping changes.  I fixed it up (see below) and can carry the fix.

Looks good, thanks!

> diff --cc kernel/sched.c
> index 2d76674,c7da251..0000000
> --- a/kernel/sched.c
> +++ b/kernel/sched.c
> @@@ -1538,8 -1527,14 +1538,8 @@@ static int tg_shares_up(struct
> task_gro
>         if (!rq_weight)
>                 rq_weight = cpus_weight(sd->span) * NICE_0_LOAD;
>   
> -       for_each_cpu_mask(i, sd->span)
>  -      for_each_cpu(i, &sd->span) {
>  -              struct rq *rq = cpu_rq(i);
>  -              unsigned long flags;
>  -
>  -              spin_lock_irqsave(&rq->lock, flags);
>  -              __update_group_shares_cpu(tg, i, shares, rq_weight);
>  -              spin_unlock_irqrestore(&rq->lock, flags);
>  -      }
> ++      for_each_cpu(i, &sd->span)
>  +              update_group_shares_cpu(tg, i, shares, rq_weight);
>   
>         return 0;
>   }
