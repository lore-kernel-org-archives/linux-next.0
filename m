From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the cpus4096 tree
Date: Thu, 19 Mar 2009 16:49:44 +1100
Message-ID: <20090319164944.a7b6e5fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44211 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758786AbZCSFts (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Mar 2009 01:49:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

Hi Rusty,

Today's linux-next merge of the rr tree got conflicts in
arch/x86/include/asm/topology.h between commits
23c5c9c66263311de1295b42382e5bc1e7c36c47 ("cpumask: remove
cpu_coregroup_map: x86") and 4f0628963c86d2f97b8cb9acc024a7fe288a6a57
("cpumask: use new cpumask functions throughout x86") from the cpus4096
tree and commit 673089d95b0414f80ccf1bbf3fe9280653a47d07
("cpumask:remove-node_to_first_cpu") from the rr tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/include/asm/topology.h
index e3f4198,a1315a9..0000000
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@@ -157,44 -192,33 +157,32 @@@ extern int __node_distance(int, int)
  
  #else /* !CONFIG_NUMA */
  
 -#define numa_node_id()		0
 -#define	cpu_to_node(cpu)	0
 -#define	early_cpu_to_node(cpu)	0
 +static inline int numa_node_id(void)
 +{
 +	return 0;
 +}
 +
 +static inline int cpu_to_node(int cpu)
 +{
 +	return 0;
 +}
  
 -static inline const cpumask_t *cpumask_of_node(int node)
 +static inline int early_cpu_to_node(int cpu)
  {
 -	return &cpu_online_map;
 +	return 0;
  }
 -static inline cpumask_t node_to_cpumask(int node)
 +
 +static inline const struct cpumask *cpumask_of_node(int node)
  {
 -	return cpu_online_map;
 +	return cpu_online_mask;
  }
- static inline int node_to_first_cpu(int node)
- {
- 	return cpumask_first(cpu_online_mask);
- }
  
 -/*
 - * Replace default node_to_cpumask_ptr with optimized version
 - * Deprecated: use "const struct cpumask *mask = cpumask_of_node(node)"
 - */
 -#define node_to_cpumask_ptr(v, node)		\
 -		const cpumask_t *v = cpumask_of_node(node)
 +static inline void setup_node_to_cpumask_map(void) { }
  
 -#define node_to_cpumask_ptr_next(v, node)	\
 -			   v = cpumask_of_node(node)
  #endif
  
  #include <asm-generic/topology.h>
  
- #ifdef CONFIG_NUMA
- /* Returns the number of the first CPU on Node 'node'. */
- static inline int node_to_first_cpu(int node)
- {
- 	return cpumask_first(cpumask_of_node(node));
- }
- #endif
- 
 -extern cpumask_t cpu_coregroup_map(int cpu);
  extern const struct cpumask *cpu_coregroup_mask(int cpu);
  
  #ifdef ENABLE_TOPO_DEFINES
