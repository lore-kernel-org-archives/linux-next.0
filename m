From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: [PATCH] cpumask:cpumask_of_node-ia64 fix
Date: Thu, 11 Dec 2008 10:58:50 +0900 (JST)
Message-ID: <20081211105721.4FEE.KOSAKI.MOTOHIRO@jp.fujitsu.com>
References: <20081210164659.9ebb8158.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37]:40528 "EHLO
	fgwmail7.fujitsu.co.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754048AbYLKB64 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Dec 2008 20:58:56 -0500
In-Reply-To: <20081210164659.9ebb8158.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: kosaki.motohiro@jp.fujitsu.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

===
Subject: [PATCH] cpumask:cpumask_of_node-ia64 fix
Impact: bug fix

commit 07c636deede53ff3e96d54df0ece2c838e61951f introduce new CPU mask API and change cpu_mask variable type.

-----------------------------------------------
-               cpumask_t cpu_mask;
+               const struct cpumask *cpu_mask;
--------------------------------------------------


However, its change is incomplete. in build time, compiler output following type mismatch warnings.

  arch/ia64/kernel/iosapic.c:708: warning: passing argument 2 of '__cpu_clear' from incompatible pointer type
  arch/ia64/kernel/iosapic.c:711: warning: passing argument 1 of '__cpus_weight' from incompatible pointer type
  arch/ia64/kernel/iosapic.c:719: warning: passing argument 1 of '__first_cpu' from incompatible pointer type
  arch/ia64/kernel/iosapic.c:720: warning: passing argument 2 of '__next_cpu' from incompatible pointer type


Signed-off-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
CC: "Luck, Tony" <tony.luck@intel.com>
CC: Rusty Russell <rusty@rustcorp.com.au>
---
 arch/ia64/kernel/iosapic.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

Index: b/arch/ia64/kernel/iosapic.c
===================================================================
--- a/arch/ia64/kernel/iosapic.c
+++ b/arch/ia64/kernel/iosapic.c
@@ -695,7 +695,7 @@ get_target_cpu (unsigned int gsi, int ir
 #ifdef CONFIG_NUMA
 	{
 		int num_cpus, cpu_index, iosapic_index, numa_cpu, i = 0;
-		const struct cpumask *cpu_mask;
+		struct cpumask *cpu_mask;
 
 		iosapic_index = find_iosapic(gsi);
 		if (iosapic_index < 0 ||
@@ -705,10 +705,10 @@ get_target_cpu (unsigned int gsi, int ir
 		cpu_mask = cpumask_of_node(iosapic_lists[iosapic_index].node);
 		for_each_cpu_and(numa_cpu, cpu_mask, &domain) {
 			if (!cpu_online(numa_cpu))
-				cpu_clear(numa_cpu, cpu_mask);
+				cpu_clear(numa_cpu, *cpu_mask);
 		}
 
-		num_cpus = cpus_weight(cpu_mask);
+		num_cpus = cpus_weight(*cpu_mask);
 
 		if (!num_cpus)
 			goto skip_numa_setup;
@@ -716,8 +716,8 @@ get_target_cpu (unsigned int gsi, int ir
 		/* Use irq assignment to distribute across cpus in node */
 		cpu_index = irq % num_cpus;
 
-		for (numa_cpu = first_cpu(cpu_mask) ; i < cpu_index ; i++)
-			numa_cpu = next_cpu(numa_cpu, cpu_mask);
+		for (numa_cpu = first_cpu(*cpu_mask) ; i < cpu_index ; i++)
+			numa_cpu = next_cpu(numa_cpu, *cpu_mask);
 
 		if (numa_cpu != NR_CPUS)
 			return cpu_physical_id(numa_cpu);
