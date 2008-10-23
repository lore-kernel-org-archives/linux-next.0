From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Thu, 23 Oct 2008 15:01:30 +1100
Message-ID: <20081023150130.f8fdfd5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38659 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751812AbYJWFB4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 01:01:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@elte.hu>, Mike Travis <travis@sgi.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in kernel/sched.c
between commit tg_shares_up ("sched: optimize group load balancer") from
the sched tree and commit 1a39c64ec96acde2a0f43bbe408efc328541a73e
("cpumask:for_each_cpu") from the rr tree.

Overlapping changes.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/sched.c
index 2d76674,c7da251..0000000
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@@ -1538,8 -1527,14 +1538,8 @@@ static int tg_shares_up(struct task_gro
  	if (!rq_weight)
  		rq_weight = cpus_weight(sd->span) * NICE_0_LOAD;
  
- 	for_each_cpu_mask(i, sd->span)
 -	for_each_cpu(i, &sd->span) {
 -		struct rq *rq = cpu_rq(i);
 -		unsigned long flags;
 -
 -		spin_lock_irqsave(&rq->lock, flags);
 -		__update_group_shares_cpu(tg, i, shares, rq_weight);
 -		spin_unlock_irqrestore(&rq->lock, flags);
 -	}
++	for_each_cpu(i, &sd->span)
 +		update_group_shares_cpu(tg, i, shares, rq_weight);
  
  	return 0;
  }
