From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the pci tree
Date: Wed, 28 Jun 2017 13:15:34 +1000
Message-ID: <20170628131534.1d549e19@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51193 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753603AbdF1DPg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jun 2017 23:15:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Hernandez <michael.hernandez@cavium.com>, Himanshu Madhani <himanshu.madhani@cavium.com>, Christoph Hellwig <hch@lst.de>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/irq/affinity.c

between commit:

  6f9a22bc5775 ("PCI/MSI: Ignore affinity if pre/post vector count is more than min_vecs")

from the pci tree and commit:

  9a0ef98e186d ("genirq/affinity: Assign vectors to all present CPUs")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/irq/affinity.c
index 9b71406d2eec,d2747f9c5707..000000000000
--- a/kernel/irq/affinity.c
+++ b/kernel/irq/affinity.c
@@@ -64,15 -108,8 +108,15 @@@ irq_create_affinity_masks(int nvecs, co
  	int last_affv = affv + affd->pre_vectors;
  	nodemask_t nodemsk = NODE_MASK_NONE;
  	struct cpumask *masks;
- 	cpumask_var_t nmsk;
+ 	cpumask_var_t nmsk, *node_to_present_cpumask;
  
 +	/*
 +	 * If there aren't any vectors left after applying the pre/post
 +	 * vectors don't bother with assigning affinity.
 +	 */
 +	if (!affv)
 +		return NULL;
 +
  	if (!zalloc_cpumask_var(&nmsk, GFP_KERNEL))
  		return NULL;
  
@@@ -155,15 -199,10 +207,13 @@@ int irq_calc_affinity_vectors(int minve
  {
  	int resv = affd->pre_vectors + affd->post_vectors;
  	int vecs = maxvec - resv;
- 	int cpus;
+ 	int ret;
  
 +	if (resv > minvec)
 +		return 0;
 +
- 	/* Stabilize the cpumasks */
  	get_online_cpus();
- 	cpus = cpumask_weight(cpu_online_mask);
+ 	ret = min_t(int, cpumask_weight(cpu_present_mask), vecs) + resv;
  	put_online_cpus();
- 
- 	return min(cpus, vecs) + resv;
+ 	return ret;
  }
