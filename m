From: Gautham R Shenoy <ego@in.ibm.com>
Subject: Re: linux-next: sched tree build warning
Date: Tue, 21 Apr 2009 08:40:49 +0530
Message-ID: <20090421031049.GA4140@in.ibm.com>
References: <20090421102706.e19240a0.sfr@canb.auug.org.au>
Reply-To: ego@in.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp06.in.ibm.com ([59.145.155.6]:44907 "EHLO
	e28smtp06.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753034AbZDUDLF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 Apr 2009 23:11:05 -0400
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
	by e28smtp06.in.ibm.com (8.13.1/8.13.1) with ESMTP id n3L3B0N9012819
	for <linux-next@vger.kernel.org>; Tue, 21 Apr 2009 08:41:00 +0530
Received: from d28av01.in.ibm.com (d28av01.in.ibm.com [9.184.220.63])
	by d28relay02.in.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n3L36pQP2363520
	for <linux-next@vger.kernel.org>; Tue, 21 Apr 2009 08:36:51 +0530
Received: from d28av01.in.ibm.com (loopback [127.0.0.1])
	by d28av01.in.ibm.com (8.13.1/8.13.3) with ESMTP id n3L3AxkK025635
	for <linux-next@vger.kernel.org>; Tue, 21 Apr 2009 08:41:00 +0530
Content-Disposition: inline
In-Reply-To: <20090421102706.e19240a0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On Tue, Apr 21, 2009 at 10:27:06AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next build (powerpc ppc64_defconfig) produced this new
> warning:
> 
> kernel/sched.c: In function 'find_new_ilb':
> kernel/sched.c:4355: warning: passing argument 1 of '__first_cpu' from incompatible pointer type
> 
> Possibly caused by commit f711f6090a81cbd396b63de90f415d33f563af9b
> ("sched: Nominate idle load balancer from a semi-idle package") from the
> sched tree.  Should this call to first_cpu be cpumask_first?

Yes, it should be cpumask_first. Patch appended.

-->
sched: Replace first_cpu() with cpumask_first() in ILB nomination code.

From: Gautham R Shenoy <ego@in.ibm.com>

For !(CONFIG_SCHED_MC || CONFIG_SCHED_SMT), find_new_ilb() nominates the
Idle load balancer as the first cpu from the nohz.cpu_mask.

This code uses the older API first_cpu(). Replace it with cpumask_first(),
which is the correct API here.

Signed-off-by: Gautham R Shenoy <ego@in.ibm.com>
---

 kernel/sched.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)


diff --git a/kernel/sched.c b/kernel/sched.c
index bbf367d..6df8dd5 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -4344,7 +4344,7 @@ out_done:
 #else /*  (CONFIG_SCHED_MC || CONFIG_SCHED_SMT) */
 static inline int find_new_ilb(int call_cpu)
 {
-	return first_cpu(nohz.cpu_mask);
+	return cpumask_first(nohz.cpu_mask);
 }
 #endif
 

> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> http://www.canb.auug.org.au/~sfr/



-- 
Thanks and Regards
gautham
