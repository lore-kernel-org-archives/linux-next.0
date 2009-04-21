From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: sched tree build warning
Date: Tue, 21 Apr 2009 08:09:16 +0200
Message-ID: <20090421060916.GB18771@elte.hu>
References: <20090421102706.e19240a0.sfr@canb.auug.org.au> <20090421031049.GA4140@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:32902 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750811AbZDUGJd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 02:09:33 -0400
Content-Disposition: inline
In-Reply-To: <20090421031049.GA4140@in.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gautham R Shenoy <ego@in.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>


* Gautham R Shenoy <ego@in.ibm.com> wrote:

> On Tue, Apr 21, 2009 at 10:27:06AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next build (powerpc ppc64_defconfig) produced this new
> > warning:
> > 
> > kernel/sched.c: In function 'find_new_ilb':
> > kernel/sched.c:4355: warning: passing argument 1 of '__first_cpu' from incompatible pointer type
> > 
> > Possibly caused by commit f711f6090a81cbd396b63de90f415d33f563af9b
> > ("sched: Nominate idle load balancer from a semi-idle package") from the
> > sched tree.  Should this call to first_cpu be cpumask_first?
> 
> Yes, it should be cpumask_first. Patch appended.
> 
> -->
> sched: Replace first_cpu() with cpumask_first() in ILB nomination code.
> 
> From: Gautham R Shenoy <ego@in.ibm.com>
> 
> For !(CONFIG_SCHED_MC || CONFIG_SCHED_SMT), find_new_ilb() nominates the
> Idle load balancer as the first cpu from the nohz.cpu_mask.
> 
> This code uses the older API first_cpu(). Replace it with cpumask_first(),
> which is the correct API here.
> 
> Signed-off-by: Gautham R Shenoy <ego@in.ibm.com>
> ---
> 
>  kernel/sched.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> 
> diff --git a/kernel/sched.c b/kernel/sched.c
> index bbf367d..6df8dd5 100644
> --- a/kernel/sched.c
> +++ b/kernel/sched.c
> @@ -4344,7 +4344,7 @@ out_done:
>  #else /*  (CONFIG_SCHED_MC || CONFIG_SCHED_SMT) */
>  static inline int find_new_ilb(int call_cpu)
>  {
> -	return first_cpu(nohz.cpu_mask);
> +	return cpumask_first(nohz.cpu_mask);

Given that this is not an onstack cpumask the type mismatch is 
harmless in effect but obviously needs fixed.

I've applied your fix to tip:sched/core - thanks guys.

	Ingo
