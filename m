From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Mon, 24 Nov 2008 14:20:41 +1100
Message-ID: <20081124142041.c9ba352f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60474 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751585AbYKXDU7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 23 Nov 2008 22:20:59 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Mike Travis <travis@sgi.com>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
kernel/irq/manage.c between commit
612e3684c1b7752d2890510e4f90115fd1eb2afb ("genirq: fix the affinity
setting in setup_irq") from the genirq tree and commit
5b03e170d524383a34a89fd73ec9d1bda0922d63
("cpumask:irq-functions-take-cpumask_t-ptr") from the rr tree.

I fixed it up (see below) and can carry it.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/irq/manage.c
index 4358612,7dc7563..0000000
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@@ -123,9 -119,10 +119,10 @@@ int do_irq_select_affinity(unsigned in
  	 * Preserve an userspace affinity setup, but make sure that
  	 * one of the targets is online.
  	 */
 -	if (desc->status & IRQ_AFFINITY_SET) {
 +	if (desc->status & (IRQ_AFFINITY_SET | IRQ_NO_BALANCING)) {
- 		if (cpus_intersects(desc->affinity, cpu_online_map))
- 			mask = desc->affinity;
+ 		if (cpumask_any_and(&desc->affinity, cpu_online_mask)
+ 		    < nr_cpu_ids)
+ 			goto set_affinity;
  		else
  			desc->status &= ~IRQ_AFFINITY_SET;
  	}
