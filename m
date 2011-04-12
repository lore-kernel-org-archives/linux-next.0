From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: build failure after merge of the final tree (tip
 tree related)
Date: Tue, 12 Apr 2011 08:20:02 +0200
Message-ID: <20110412062002.GA31050@elte.hu>
References: <20110412140040.3020ef55.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:60857 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754504Ab1DLGUU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Apr 2011 02:20:20 -0400
Content-Disposition: inline
In-Reply-To: <20110412140040.3020ef55.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> kernel/sched.c:7140: error: 'cpu_coregroup_mask' undeclared here (not in a function)
> 
> Caused by commit 2c402dc3bb50 ("sched: Unify the sched_domain build
> functions").  On sparc64, cpu_coregroup_mask is a #define, not a function.
> 
> I applied tha patch below (idea stolen from s390) whcih could probably be
> better.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 12 Apr 2011 13:51:32 +1000
> Subject: [PATCH] sched: fix sparc64 for sched_domain changes
> 
> Fixes this compile error:
> 
> kernel/sched.c:7140: error: 'cpu_coregroup_mask' undeclared here (not in a function)
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/sparc/include/asm/topology_64.h |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/topology_64.h b/arch/sparc/include/asm/topology_64.h
> index 1c79f32..16f477d 100644
> --- a/arch/sparc/include/asm/topology_64.h
> +++ b/arch/sparc/include/asm/topology_64.h
> @@ -65,6 +65,10 @@ static inline int pcibus_to_node(struct pci_bus *pbus)
>  #define smt_capable()				(sparc64_multi_core)
>  #endif /* CONFIG_SMP */
>  
> -#define cpu_coregroup_mask(cpu)			(&cpu_core_map[cpu])
> +extern cpumask_t cpu_core_map[NR_CPUS];
> +static inline const struct cpumask *cpu_coregroup_mask(int cpu)
> +{
> +        return &cpu_core_map[cpu];
> +}

Dave, if this change is fine with you i'd like to queue it up in 
tip:sched/domains.

Thanks,

	Ingo
