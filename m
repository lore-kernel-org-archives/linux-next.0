From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the x86/cpus4096 trees
Date: Thu, 5 Mar 2009 14:59:41 +1100
Message-ID: <20090305145941.e1cc00f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33373 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752890AbZCEEYk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Mar 2009 23:24:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/powerpc/kernel/irq.c between commit
e65e49d0f3714f4a6a42f6f6a19926ba33fcda75 ("irq: update all arches for new
irq_desc") from the x86 and cpus4096 trees and commit
1fd095952e0ed03be0cda5341501984bcfe57c22
("cpumask:all-ops-compare-against-nr_cpu_ids-powerpc") from the rr tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/powerpc/kernel/irq.c
index 1b55ffd,7573591..0000000
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@@ -231,8 -231,8 +231,8 @@@ void fixup_irqs(cpumask_t map
  		if (irq_desc[irq].status & IRQ_PER_CPU)
  			continue;
  
 -		cpus_and(mask, irq_desc[irq].affinity, map);
 +		cpumask_and(&mask, irq_desc[irq].affinity, &map);
- 		if (any_online_cpu(mask) == NR_CPUS) {
+ 		if (cpumask_any_and(&mask, cpu_online_mask) >= nr_cpu_ids) {
  			printk("Breaking affinity for irq %i\n", irq);
  			mask = map;
  		}
