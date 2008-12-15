From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr_cpumask tree
Date: Mon, 15 Dec 2008 17:09:55 +1100
Message-ID: <20081215170955.0e24ea9f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60435 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751044AbYLOGJ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 01:09:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr_cpumask tree got conflicts in
kernel/sched.c and kernel/sched_stats.h between commits
sched_domain_debug_one ("sched: wrap sched_group and sched_domain cpumask
accesses") and dcc30a35f71bcf51f1e9b336dc5e41923071509a ("sched: convert
cpu_isolated_map to cpumask_var_t") from the cpus4096 tree and commit
29c0177e6a4ac094302bed54a1d4bbb6b740a9ef ("cpumask: change
cpumask_scnprintf, cpumask_parse_user, cpulist_parse, and
cpulist_scnprintf to take pointers") from the rr_cpumask tree.

Overlapping changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/sched.c
index b6b60dd,d2d16d1..0000000
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@@ -6637,8 -6666,8 +6637,8 @@@ static int sched_domain_debug_one(struc
  	struct sched_group *group = sd->groups;
  	char str[256];
  
- 	cpulist_scnprintf(str, sizeof(str), *sched_domain_span(sd));
 -	cpulist_scnprintf(str, sizeof(str), &sd->span);
 -	cpus_clear(*groupmask);
++	cpulist_scnprintf(str, sizeof(str), sched_domain_span(sd));
 +	cpumask_clear(groupmask);
  
  	printk(KERN_DEBUG "%*s domain %d: ", level, "", level);
  
@@@ -6688,9 -6718,9 +6688,9 @@@
  			break;
  		}
  
 -		cpus_or(*groupmask, *groupmask, group->cpumask);
 +		cpumask_or(groupmask, groupmask, sched_group_cpus(group));
  
- 		cpulist_scnprintf(str, sizeof(str), *sched_group_cpus(group));
 -		cpulist_scnprintf(str, sizeof(str), &group->cpumask);
++		cpulist_scnprintf(str, sizeof(str), sched_group_cpus(group));
  		printk(KERN_CONT " %s", str);
  
  		group = group->next;
@@@ -6932,7 -6922,14 +6932,7 @@@ static cpumask_var_t cpu_isolated_map
  /* Setup the mask of cpus configured for isolated domains */
  static int __init isolated_cpu_setup(char *str)
  {
- 	cpulist_parse(str, *cpu_isolated_map);
 -	static int __initdata ints[NR_CPUS];
 -	int i;
 -
 -	str = get_options(str, ARRAY_SIZE(ints), ints);
 -	cpus_clear(cpu_isolated_map);
 -	for (i = 1; i <= ints[0]; i++)
 -		if (ints[i] < NR_CPUS)
 -			cpu_set(ints[i], cpu_isolated_map);
++	cpulist_parse(str, cpu_isolated_map);
  	return 1;
  }
  
diff --cc kernel/sched_stats.h
index ce34083,6beff1e..0000000
--- a/kernel/sched_stats.h
+++ b/kernel/sched_stats.h
@@@ -42,8 -42,7 +42,8 @@@ static int show_schedstat(struct seq_fi
  		for_each_domain(cpu, sd) {
  			enum cpu_idle_type itype;
  
 -			cpumask_scnprintf(mask_str, mask_len, &sd->span);
 +			cpumask_scnprintf(mask_str, mask_len,
- 					  *sched_domain_span(sd));
++					  sched_domain_span(sd));
  			seq_printf(seq, "domain%d %s", dcount++, mask_str);
  			for (itype = CPU_IDLE; itype < CPU_MAX_IDLE_TYPES;
  					itype++) {
