From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tracing tree with the cpus4096 tree
Date: Fri, 6 Mar 2009 12:04:42 +1100
Message-ID: <20090306120442.8b0cc445.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41093 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753289AbZCFBEq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 20:04:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Jason Baron <jbaron@redhat.com>

Hi all,

Today's linux-next merge of the tracing tree got a conflict in
kernel/irq/handle.c between commit
0fa0ebbf15addc1be8f73325d809c8547a9de304 ("irq: allocate irq_desc_ptrs
array based on nr_irqs") from the cpus4096 tree and commit
af39241b90a345556b8884adff87096afe71b050 ("tracing, genirq: add irq enter
and exit trace events") from the tracing tree.

Just overlapping additions. I fixed it up (see below) and can carry the
fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/irq/handle.c
index f51eaee,4709a7c..0000000
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@@ -17,7 -17,7 +17,8 @@@
  #include <linux/kernel_stat.h>
  #include <linux/rculist.h>
  #include <linux/hash.h>
 +#include <linux/bootmem.h>
+ #include <trace/irq.h>
  
  #include "internals.h"
  
