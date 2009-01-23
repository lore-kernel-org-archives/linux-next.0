From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sparseirq tree with the cpus4096
 tree
Date: Fri, 23 Jan 2009 16:09:58 +1100
Message-ID: <20090123160958.0da33500.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60988 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750798AbZAWFKC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 23 Jan 2009 00:10:02 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Yinghai Lu <yinghai@kernel.org>

Hi Ingo,

Today's linux-next merge of the sparseirq tree got a conflict in
kernel/irq/handle.c between commit
7f7ace0cda64c99599c23785f8979a072e118058 ("cpumask: update irq_desc to
use cpumask_var_t") from the cpus4096 tree and commit
d7e51e66899f95dabc89b4d4c6674a6e50fa37fc ("sparseirq: make some func to
be used with genirq") from the sparseirq tree.

I fixed it up (see below) and can carry the fix as necessary.  I am not
sure if this needs something better.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/irq/handle.c
index 375d68c,48299a8..0000000
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@@ -236,8 -225,9 +237,10 @@@ int __init early_irq_init(void
  
  	for (i = 0; i < count; i++) {
  		desc[i].irq = i;
+ 		desc[i].kstat_irqs = kstat_irqs_all[i];
 +		init_alloc_desc_masks(&desc[i], 0, true);
  	}
+ 
  	return arch_early_irq_init();
  }
  
