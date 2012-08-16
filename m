From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Thu, 16 Aug 2012 12:46:51 -0700
Message-ID: <20120816194651.GK2445@linux.vnet.ibm.com>
References: <20120816131236.13013e1ec18b1f1074f6dc92@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e4.ny.us.ibm.com ([32.97.182.144]:52356 "EHLO e4.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933187Ab2HPTrP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 16 Aug 2012 15:47:15 -0400
Received: from /spool/local
	by e4.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Thu, 16 Aug 2012 15:47:14 -0400
Content-Disposition: inline
In-Reply-To: <20120816131236.13013e1ec18b1f1074f6dc92@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Namhyung Kim <namhyung@kernel.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>

On Thu, Aug 16, 2012 at 01:12:36PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/infiniband/hw/ehca/ehca_irq.c: In function 'find_next_online_cpu':
> drivers/infiniband/hw/ehca/ehca_irq.c:672:2: error: expected ';' before 'spin_unlock_irqrestore'
> 
> Caused by commit 81942621bd6b ("infiniband: Ehca: Use hotplug thread
> infrastructure").
> 
> I have used the tip tree from next-20120814 for today.

My first reaction was "we tested that!!!", but I see the conversion
from while(1) to do-while.  Does the following cure it?

							Thanx, Paul

------------------------------------------------------------------------

infiniband: ehca: Fix while->do-while conversion typo

This commit just adds a needed semicolon.

Signed-off-by: Paul E. McKenney <paul.mckenney@linaro.org>
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/drivers/infiniband/hw/ehca/ehca_irq.c b/drivers/infiniband/hw/ehca/ehca_irq.c
index 4eeac40..83a0095 100644
--- a/drivers/infiniband/hw/ehca/ehca_irq.c
+++ b/drivers/infiniband/hw/ehca/ehca_irq.c
@@ -668,7 +668,7 @@ static int find_next_online_cpu(struct ehca_comp_pool *pool)
 		if (cpu >= nr_cpu_ids)
 			cpu = cpumask_first(cpu_online_mask);
 		pool->last_cpu = cpu;
-	} while (!per_cpu_ptr(pool->cpu_comp_tasks, cpu)->active)
+	} while (!per_cpu_ptr(pool->cpu_comp_tasks, cpu)->active);
 	spin_unlock_irqrestore(&pool->last_cpu_lock, flags);
 
 	return cpu;
