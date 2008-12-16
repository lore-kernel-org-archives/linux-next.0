From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Tue, 16 Dec 2008 16:29:56 +1100
Message-ID: <20081216162956.8116762c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39775 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721AbYLPFaD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 00:30:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr tree got conflicts in kernel/sched.c
between commits abcd083a1a658d2bc1f7fced02632bfe03918002 ("sched: convert
sched.c from for_each_cpu_mask to for_each_cpu"),
3404c8d97c2d3eb87b1bf4aadad957bfb5235b14 ("sched: get rid of boutique
sched.c allocations, use cpumask_var_t"),
758b2cdc6f6a22c702bd8f2344382fb1270b2161 ("sched: wrap sched_group and
sched_domain cpumask accesses") and
96f874e26428ab5d2db681c100210c254775e154 ("sched: convert remaining
old-style cpumask operators") from the cpus4096 tree and commit
13d3341b638c61d2c69371b021c503c9a9c824bd
("cpumask:use-cpu_coregroup_mask") from the rr tree.

I fixed it up as best I could (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/sched.c
index dc97b8a,4292923..0000000
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@@ -7138,13 -7119,13 +7138,12 @@@ cpu_to_phys_group(int cpu, const struc
  {
  	int group;
  #ifdef CONFIG_SCHED_MC
- 	/* FIXME: Use cpu_coregroup_mask. */
- 	*mask = cpu_coregroup_map(cpu);
+ 	*mask = *cpu_coregroup_mask(cpu);
  	cpus_and(*mask, *mask, *cpu_map);
 -	group = first_cpu(*mask);
 +	group = cpumask_first(mask);
  #elif defined(CONFIG_SCHED_SMT)
 -	*mask = per_cpu(cpu_sibling_map, cpu);
 -	cpus_and(*mask, *mask, *cpu_map);
 -	group = first_cpu(*mask);
 +	cpumask_and(mask, &per_cpu(cpu_sibling_map, cpu), cpu_map);
 +	group = cpumask_first(mask);
  #else
  	group = cpu;
  #endif
@@@ -7476,12 -7482,11 +7475,12 @@@ static int __build_sched_domains(const 
  
  #ifdef CONFIG_SCHED_MC
  		p = sd;
 -		sd = &per_cpu(core_domains, i);
 +		sd = &per_cpu(core_domains, i).sd;
  		SD_INIT(sd, MC);
  		set_domain_attribute(sd, attr);
- 		*sched_domain_span(sd) = cpu_coregroup_map(i);
 -		sd->span = *cpu_coregroup_mask(i);
 -		cpus_and(sd->span, sd->span, *cpu_map);
++		*sched_domain_span(sd) = *cpu_coregroup_mask(i);
 +		cpumask_and(sched_domain_span(sd),
 +			    sched_domain_span(sd), cpu_map);
  		sd->parent = p;
  		p->child = sd;
  		cpu_to_core_group(i, cpu_map, &sd->groups, tmpmask);
@@@ -7516,11 -7524,13 +7515,10 @@@
  
  #ifdef CONFIG_SCHED_MC
  	/* Set up multi-core groups */
 -	for_each_cpu_mask_nr(i, *cpu_map) {
 -		SCHED_CPUMASK_VAR(this_core_map, allmasks);
 -		SCHED_CPUMASK_VAR(send_covered, allmasks);
 -
 +	for_each_cpu(i, cpu_map) {
- 		/* FIXME: Use cpu_coregroup_mask */
- 		*this_core_map = cpu_coregroup_map(i);
+ 		*this_core_map = *cpu_coregroup_mask(i);
  		cpus_and(*this_core_map, *this_core_map, *cpu_map);
 -		if (i != first_cpu(*this_core_map))
 +		if (i != cpumask_first(this_core_map))
  			continue;
  
  		init_sched_build_groups(this_core_map, cpu_map,
