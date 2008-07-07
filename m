From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpus4096 tree
Date: Mon, 7 Jul 2008 16:20:10 +1000
Message-ID: <20080707162010.58305a91.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52981 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751460AbYGGGUO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Jul 2008 02:20:14 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

Hi all,

Today's linux-next merge of the cpus4096 tree needed the fixup below.  As
you know, Linus' tree now has trivial definitions of next_cpu_nr,
cpus_weight_nr and for_each_cpu_mask_nr.  The merge mechanics did not
notice this automatically so I had to remove the old definitions from
cpumask.h.

It would be nice if you could do the merge with Linus' tree
yourself and fix this within the cpus4096 tree tree.

Also, it would be nice if some of the other subsystems that need changing
could be sent the patches to do that.  It would reduce the conflicts in
linux-next and during the merge window for Linus.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 0b848f997ba0ef132356c829114d898e0a51c045 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 7 Jul 2008 15:59:04 +1000
Subject: [PATCH] cpumask: fixup API change merge

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/cpumask.h |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 47418b1..80226e7 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -394,10 +394,6 @@ int __next_cpu_nr(int n, const cpumask_t *srcp);
 
 #endif /* NR_CPUS > 64 */
 
-#define next_cpu_nr(n, src)		next_cpu(n, src)
-#define cpus_weight_nr(cpumask)		cpus_weight(cpumask)
-#define for_each_cpu_mask_nr(cpu, mask)	for_each_cpu_mask(cpu, mask)
-
 /*
  * The following particular system cpumasks and operations manage
  * possible, present and online cpus.  Each of them is a fixed size
-- 
1.5.6
