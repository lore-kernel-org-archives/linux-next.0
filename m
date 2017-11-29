From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the rcu tree
Date: Tue, 28 Nov 2017 17:14:29 -0800
Message-ID: <20171129011429.GB3624@linux.vnet.ibm.com>
References: <20171129115151.40b72764@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:42820 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751402AbdK2BOe (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Nov 2017 20:14:34 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vAT1EJ2D013790
        for <linux-next@vger.kernel.org>; Tue, 28 Nov 2017 20:14:33 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ehg54665x-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 28 Nov 2017 20:14:33 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 28 Nov 2017 20:14:32 -0500
Content-Disposition: inline
In-Reply-To: <20171129115151.40b72764@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Liang Lihao <lianglihao@huawei.com>

On Wed, Nov 29, 2017 at 11:51:51AM +1100, Stephen Rothwell wrote:
> Hi Paul,
> 
> Commit
> 
>   d7e182c9c324 ("rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data()")
> 
> is missing a Signed-off-by from its author.

Good catch, Stephen!

Lihao, would you please get me you Signed-off-by?  The patch is below.

							Thanx, Paul

------------------------------------------------------------------------

commit d7e182c9c32480c1f579dd888ac50e88bfb39596
Author: Liang Lihao <lianglihao@huawei.com>
Date:   Wed Nov 22 19:00:55 2017 +0000

    rcu: Remove unnecessary spinlock in rcu_boot_init_percpu_data()
    
    Since rcu_boot_init_percpu_data() is only called at boot time,
    there is no data race and spinlock is not needed.
    
    Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 69722817d6d6..0abe1db53d70 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -3636,12 +3636,9 @@ static void rcu_init_new_rnp(struct rcu_node *rnp_leaf)
 static void __init
 rcu_boot_init_percpu_data(int cpu, struct rcu_state *rsp)
 {
-	unsigned long flags;
 	struct rcu_data *rdp = per_cpu_ptr(rsp->rda, cpu);
-	struct rcu_node *rnp = rcu_get_root(rsp);
 
 	/* Set up local state, ensuring consistent view of global state. */
-	raw_spin_lock_irqsave_rcu_node(rnp, flags);
 	rdp->grpmask = leaf_node_cpu_bit(rdp->mynode, cpu);
 	rdp->dynticks = &per_cpu(rcu_dynticks, cpu);
 	WARN_ON_ONCE(rdp->dynticks->dynticks_nesting != 1);
@@ -3649,7 +3646,6 @@ rcu_boot_init_percpu_data(int cpu, struct rcu_state *rsp)
 	rdp->cpu = cpu;
 	rdp->rsp = rsp;
 	rcu_boot_init_nocb_percpu_data(rdp);
-	raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
 }
 
 /*
