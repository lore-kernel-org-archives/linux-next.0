From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] Introduce new cpu_mask APIs
Date: Thu, 3 Jul 2008 14:15:50 +1000
Message-ID: <20080703141550.de7f8f22.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47146 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751112AbYGCEPz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 00:15:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Travis <travis@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>

In linux-next there is a commit ("x86: Add performance variants of cpumask
operators") which, as part of the 4096 cpu support work adds some new
APIs for dealing with cpu masks.  Add thrivial versions of these now
so that subsystems can update in a timely manner and avoid conflicts in
linux-next and the next merge window.

Cc: Mike Travis <travis@sgi.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@elte.hu>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/cpumask.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 5df3db5..c24875b 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -353,6 +353,10 @@ static inline void __cpus_fold(cpumask_t *dstp, const cpumask_t *origp,
 	for ((cpu) = 0; (cpu) < 1; (cpu)++, (void)mask)
 #endif /* NR_CPUS */
 
+#define next_cpu_nr(n, src)		next_cpu(n, src)
+#define cpus_weight_nr(cpumask)		cpus_weight(cpumask)
+#define for_each_cpu_mask_nr(cpu, mask)	for_each_cpu_mask(cpu, mask)
+
 /*
  * The following particular system cpumasks and operations manage
  * possible, present and online cpus.  Each of them is a fixed size
-- 
1.5.6

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
