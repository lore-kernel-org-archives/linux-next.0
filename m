From: Mike Travis <travis@sgi.com>
Subject: Re: [PATCH] cpumask:cpumask_of_node-ia64 fix
Date: Wed, 10 Dec 2008 20:15:51 -0800
Message-ID: <494093F7.5020000@sgi.com>
References: <20081210164659.9ebb8158.sfr@canb.auug.org.au> <20081211105721.4FEE.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.179.29]:48591 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751666AbYLKEPz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 23:15:55 -0500
In-Reply-To: <20081211105721.4FEE.KOSAKI.MOTOHIRO@jp.fujitsu.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

KOSAKI Motohiro wrote:
> ===
> Subject: [PATCH] cpumask:cpumask_of_node-ia64 fix
> Impact: bug fix
> 
> commit 07c636deede53ff3e96d54df0ece2c838e61951f introduce new CPU mask API and change cpu_mask variable type.
> 
> -----------------------------------------------
> -               cpumask_t cpu_mask;
> +               const struct cpumask *cpu_mask;
> --------------------------------------------------
> 
> 
> However, its change is incomplete. in build time, compiler output following type mismatch warnings.
> 
>   arch/ia64/kernel/iosapic.c:708: warning: passing argument 2 of '__cpu_clear' from incompatible pointer type
>   arch/ia64/kernel/iosapic.c:711: warning: passing argument 1 of '__cpus_weight' from incompatible pointer type
>   arch/ia64/kernel/iosapic.c:719: warning: passing argument 1 of '__first_cpu' from incompatible pointer type
>   arch/ia64/kernel/iosapic.c:720: warning: passing argument 2 of '__next_cpu' from incompatible pointer type

Good catch, however ...
> 
> 
> Signed-off-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
> CC: "Luck, Tony" <tony.luck@intel.com>
> CC: Rusty Russell <rusty@rustcorp.com.au>
> ---
>  arch/ia64/kernel/iosapic.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Index: b/arch/ia64/kernel/iosapic.c
> ===================================================================
> --- a/arch/ia64/kernel/iosapic.c
> +++ b/arch/ia64/kernel/iosapic.c
> @@ -695,7 +695,7 @@ get_target_cpu (unsigned int gsi, int ir
>  #ifdef CONFIG_NUMA
>  	{
>  		int num_cpus, cpu_index, iosapic_index, numa_cpu, i = 0;
> -		const struct cpumask *cpu_mask;
> +		struct cpumask *cpu_mask;
>  
>  		iosapic_index = find_iosapic(gsi);
>  		if (iosapic_index < 0 ||
> @@ -705,10 +705,10 @@ get_target_cpu (unsigned int gsi, int ir
>  		cpu_mask = cpumask_of_node(iosapic_lists[iosapic_index].node);
>  		for_each_cpu_and(numa_cpu, cpu_mask, &domain) {
>  			if (!cpu_online(numa_cpu))
> -				cpu_clear(numa_cpu, cpu_mask);
> +				cpu_clear(numa_cpu, *cpu_mask);

... you cannot modify the read-only cpumask_of_node map.  Suggested alternative below.

>  		}
>  
> -		num_cpus = cpus_weight(cpu_mask);
> +		num_cpus = cpus_weight(*cpu_mask);
>  
>  		if (!num_cpus)
>  			goto skip_numa_setup;
> @@ -716,8 +716,8 @@ get_target_cpu (unsigned int gsi, int ir
>  		/* Use irq assignment to distribute across cpus in node */
>  		cpu_index = irq % num_cpus;
>  
> -		for (numa_cpu = first_cpu(cpu_mask) ; i < cpu_index ; i++)
> -			numa_cpu = next_cpu(numa_cpu, cpu_mask);
> +		for (numa_cpu = first_cpu(*cpu_mask) ; i < cpu_index ; i++)
> +			numa_cpu = next_cpu(numa_cpu, *cpu_mask);
>  
>  		if (numa_cpu != NR_CPUS)
>  			return cpu_physical_id(numa_cpu);
> 
> 
> --
---
 arch/ia64/kernel/iosapic.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- linux-2.6-next.orig/arch/ia64/kernel/iosapic.c
+++ linux-2.6-next/arch/ia64/kernel/iosapic.c
@@ -703,23 +703,23 @@ get_target_cpu (unsigned int gsi, int ir
 			goto skip_numa_setup;
 
 		cpu_mask = cpumask_of_node(iosapic_lists[iosapic_index].node);
+		num_cpus = 0;
 		for_each_cpu_and(numa_cpu, cpu_mask, &domain) {
-			if (!cpu_online(numa_cpu))
-				cpu_clear(numa_cpu, cpu_mask);
+			if (cpu_online(numa_cpu))
+				num_cpus++;
 		}
 
-		num_cpus = cpus_weight(cpu_mask);
-
 		if (!num_cpus)
 			goto skip_numa_setup;
 
 		/* Use irq assignment to distribute across cpus in node */
 		cpu_index = irq % num_cpus;
 
-		for (numa_cpu = first_cpu(cpu_mask) ; i < cpu_index ; i++)
-			numa_cpu = next_cpu(numa_cpu, cpu_mask);
+		for_each_cpu_and(numa_cpu, cpu_mask, cpu_online_mask)
+			if (i++ >= cpu_index)
+				break;
 
-		if (numa_cpu != NR_CPUS)
+		if (numa_cpu < nr_cpu_ids)
 			return cpu_physical_id(numa_cpu);
 	}
 skip_numa_setup:
@@ -730,7 +730,7 @@ skip_numa_setup:
 	 * case of NUMA.)
 	 */
 	do {
-		if (++cpu >= NR_CPUS)
+		if (++cpu >= nr_cpu_ids)
 			cpu = 0;
 	} while (!cpu_online(cpu) || !cpu_isset(cpu, domain));
 
---

One aside, I'm not sure of ia64, but x86_64 keeps only online cpus in the cpumask_of_node_map.
IOW, if a cpu goes offline, it's removed from the map.  So the whole and'ing thing above may
be unnecessary. 
