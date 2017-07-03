From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the block tree
Date: Mon, 3 Jul 2017 13:56:16 +1000
Message-ID: <20170703135616.3e49cab1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45485 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752200AbdGCD4T (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 23:56:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Jens Axboe <axboe@kernel.dk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Max Gurtovoy <maxg@mellanox.com>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  block/blk-mq-cpumap.c

between commit:

  fe631457ff3e ("blk-mq: map all HWQ also in hyperthreaded system")

from the block tree and commit:

  5f042e7cbd9e ("blk-mq: Include all present CPUs in the default queue mapping")

from the tip tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc block/blk-mq-cpumap.c
index 2cca4fc43f45,5eaecd40f701..000000000000
--- a/block/blk-mq-cpumap.c
+++ b/block/blk-mq-cpumap.c
@@@ -14,15 -14,10 +14,14 @@@
  #include "blk.h"
  #include "blk-mq.h"
  
- static int cpu_to_queue_index(unsigned int nr_queues, const int cpu,
- 			      const struct cpumask *online_mask)
 -static int cpu_to_queue_index(unsigned int nr_cpus, unsigned int nr_queues,
 -			      const int cpu)
++static int cpu_to_queue_index(unsigned int nr_queues, const int cpu)
  {
 -	return cpu * nr_queues / nr_cpus;
 +	/*
- 	 * Non online CPU will be mapped to queue index 0.
++	 * Non present CPU will be mapped to queue index 0.
 +	 */
- 	if (!cpumask_test_cpu(cpu, online_mask))
++	if (!cpumask_test_cpu(cpu, cpu_present_mask))
 +		return 0;
 +	return cpu % nr_queues;
  }
  
  static int get_first_sibling(unsigned int cpu)
@@@ -40,27 -35,55 +39,26 @@@ int blk_mq_map_queues(struct blk_mq_tag
  {
  	unsigned int *map = set->mq_map;
  	unsigned int nr_queues = set->nr_hw_queues;
- 	const struct cpumask *online_mask = cpu_online_mask;
 -	unsigned int i, nr_cpus, nr_uniq_cpus, queue, first_sibling;
 -	cpumask_var_t cpus;
 -
 -	if (!alloc_cpumask_var(&cpus, GFP_ATOMIC))
 -		return -ENOMEM;
 -
 -	cpumask_clear(cpus);
 -	nr_cpus = nr_uniq_cpus = 0;
 -	for_each_present_cpu(i) {
 -		nr_cpus++;
 -		first_sibling = get_first_sibling(i);
 -		if (!cpumask_test_cpu(first_sibling, cpus))
 -			nr_uniq_cpus++;
 -		cpumask_set_cpu(i, cpus);
 -	}
 -
 -	queue = 0;
 -	for_each_possible_cpu(i) {
 -		if (!cpumask_test_cpu(i, cpu_present_mask)) {
 -			map[i] = 0;
 -			continue;
 -		}
 +	unsigned int cpu, first_sibling;
  
 +	for_each_possible_cpu(cpu) {
  		/*
 -		 * Easy case - we have equal or more hardware queues. Or
 -		 * there are no thread siblings to take into account. Do
 -		 * 1:1 if enough, or sequential mapping if less.
 +		 * First do sequential mapping between CPUs and queues.
 +		 * In case we still have CPUs to map, and we have some number of
 +		 * threads per cores then map sibling threads to the same queue for
 +		 * performace optimizations.
  		 */
 -		if (nr_queues >= nr_cpus || nr_cpus == nr_uniq_cpus) {
 -			map[i] = cpu_to_queue_index(nr_cpus, nr_queues, queue);
 -			queue++;
 -			continue;
 +		if (cpu < nr_queues) {
- 			map[cpu] = cpu_to_queue_index(nr_queues, cpu, online_mask);
++			map[cpu] = cpu_to_queue_index(nr_queues, cpu)
 +		} else {
 +			first_sibling = get_first_sibling(cpu);
 +			if (first_sibling == cpu)
- 				map[cpu] = cpu_to_queue_index(nr_queues, cpu, online_mask);
++				map[cpu] = cpu_to_queue_index(nr_queues, cpu)
 +			else
 +				map[cpu] = map[first_sibling];
  		}
 -
 -		/*
 -		 * Less then nr_cpus queues, and we have some number of
 -		 * threads per cores. Map sibling threads to the same
 -		 * queue.
 -		 */
 -		first_sibling = get_first_sibling(i);
 -		if (first_sibling == i) {
 -			map[i] = cpu_to_queue_index(nr_uniq_cpus, nr_queues,
 -							queue);
 -			queue++;
 -		} else
 -			map[i] = map[first_sibling];
  	}
  
 -	free_cpumask_var(cpus);
  	return 0;
  }
  EXPORT_SYMBOL_GPL(blk_mq_map_queues);
