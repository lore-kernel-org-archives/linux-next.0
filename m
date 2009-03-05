From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the cpufreq tree
Date: Thu, 5 Mar 2009 14:59:39 +1100
Message-ID: <20090305145939.cd5cbbb1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33368 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752678AbZCEEYi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 23:24:38 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Dave Jones <davej@redhat.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/kernel/cpu/cpufreq/powernow-k8.c between commits
0e64a0c982c06a6b8f5e2a7f29eb108fdf257b2f ("[CPUFREQ] checkpatch cleanups
for powernow-k8") and 0cb8bc256093e716d2a0a4a721f36c625a3f7634
("[CPUFREQ] powernow-k8: Use a common exit path") from the cpufreq tree
and commit 174510a6a5388fb4eb4605e2e6452380c4888758
("cpumask:remove-cpumask-games-arch-x86-kernel-cpu-cpufreq-powernow-k8.c")
from the rr tree.

I tried to fix it up (see below) (the first of the cpufreq patches above
is just formatting changes and so its conflicting bits were discarded)
and can carry the patch as necessary.  Please check the result.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index a15ac94,864d5e6..0000000
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@@ -1216,9 -1160,7 +1235,8 @@@ static long __cpuinit powernowk8_cpu_in
  static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
  {
  	struct powernow_k8_data *data;
- 	cpumask_t oldmask;
  	int rc;
 +	static int print_once;
  
  	if (!cpu_online(pol->cpu))
  		return -ENODEV;
@@@ -1275,27 -1220,9 +1294,9 @@@
  		pol->cpuinfo.transition_latency = get_transition_latency(data);
  
  	/* only run on specific CPU from here on */
- 	oldmask = current->cpus_allowed;
- 	set_cpus_allowed_ptr(current, &cpumask_of_cpu(pol->cpu));
- 
- 	if (smp_processor_id() != pol->cpu) {
- 		printk(KERN_ERR PFX "limiting to cpu %u failed\n", pol->cpu);
+ 	rc = work_on_cpu(data->cpu, powernowk8_cpu_init_on_cpu, data);
+ 	if (rc != 0)
 -		goto err_out;
 +		goto err_out_unmask;
- 	}
- 
- 	if (pending_bit_stuck()) {
- 		printk(KERN_ERR PFX "failing init, change pending bit set\n");
- 		goto err_out_unmask;
- 	}
- 
- 	if (query_current_values_with_pending_wait(data))
- 		goto err_out_unmask;
- 
- 	if (cpu_family == CPU_OPTERON)
- 		fidvid_msr_init();
- 
- 	/* run on any CPU again */
- 	set_cpus_allowed_ptr(current, &oldmask);
  
  	if (cpu_family == CPU_HW_PSTATE)
  		cpumask_copy(pol->cpus, cpumask_of(pol->cpu));
@@@ -1332,11 -1257,9 +1333,10 @@@
  
  	return 0;
  
 -err_out:
 +err_out_unmask:
- 	set_cpus_allowed_ptr(current, &oldmask);
  	powernow_k8_cpu_exit_acpi(data);
  
 +err_out:
  	kfree(data);
  	return -ENODEV;
  }
