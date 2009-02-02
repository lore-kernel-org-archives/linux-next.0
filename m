From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Mon, 2 Feb 2009 11:46:27 +1100
Message-ID: <20090202114627.76f70d7d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47203 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752192AbZBBAqk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Feb 2009 19:46:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, David Daney <ddaney@caviumnetworks.com>, Yinghai Lu <yinghai@kernel.org>, Mike Travis <travis@sgi.com>

Hi all,

Today's linux-next merge of the tip-core tree got a conflict in
kernel/irq/handle.c between commit
97179fd46da7ddedd18e95388130ed3e06c5a0c7 ("cpumask fallout: Initialize
irq_default_affinity earlier") from Linus' tree and commits
9594949b060efe86ecaa1a66839232a3b9800bc9 ("irq: change references from
NR_IRQS to nr_irqs") and 4a046d1754ee6ebb6f399696805ed61ea0444d4c ("x86:
arch_probe_nr_irqs") from the tip-core tree.

Just overlapping additions.  I fixed it up as done in tip/master (see
below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/irq/handle.c
index 3aba8d1,375d68c..0000000
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@@ -146,8 -133,10 +145,12 @@@ int __init early_irq_init(void
  	int legacy_count;
  	int i;
  
 +	init_irq_default_affinity();
 +
+ 	 /* initialize nr_irqs based on nr_cpu_ids */
+ 	arch_probe_nr_irqs();
+ 	printk(KERN_INFO "NR_IRQS:%d nr_irqs:%d\n", NR_IRQS, nr_irqs);
+ 
  	desc = irq_desc_legacy;
  	legacy_count = ARRAY_SIZE(irq_desc_legacy);
  
@@@ -233,8 -229,8 +243,10 @@@ int __init early_irq_init(void
  	int count;
  	int i;
  
 +	init_irq_default_affinity();
 +
+ 	printk(KERN_INFO "NR_IRQS:%d\n", NR_IRQS);
+ 
  	desc = irq_desc;
  	count = ARRAY_SIZE(irq_desc);
  
