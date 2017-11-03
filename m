From: Tal Shorer <tal.shorer@gmail.com>
Subject: [PATCH v3 2/2] workqueue: respect isolated cpus when queueing an unbound work
Date: Fri,  3 Nov 2017 17:27:50 +0200
Message-ID: <1509722870-27618-2-git-send-email-tal.shorer@gmail.com>
References: <20171103135911.GS3252168@devbig577.frc2.facebook.com>
 <1509722870-27618-1-git-send-email-tal.shorer@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1509722870-27618-1-git-send-email-tal.shorer@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tj@kernel.org
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tal.shorer@gmail.com, frederic@kernel.org
List-Id: linux-next.vger.kernel.org

Initialize wq_unbound_cpumask to exclude cpus that were isolated by
the cmdline's isolcpus parameter.

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
---
 kernel/workqueue.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 64d0edf..a355e9d 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -48,6 +48,7 @@
 #include <linux/nodemask.h>
 #include <linux/moduleparam.h>
 #include <linux/uaccess.h>
+#include <linux/sched/isolation.h>
 
 #include "workqueue_internal.h"
 
@@ -4980,6 +4981,10 @@ int workqueue_set_unbound_cpumask(cpumask_var_t cpumask)
 	if (!zalloc_cpumask_var(&saved_cpumask, GFP_KERNEL))
 		return -ENOMEM;
 
+	/*
+	 * Not excluding isolated cpus on purpose.
+	 * If the user wishes to include them, we allow that.
+	 */
 	cpumask_and(cpumask, cpumask, cpu_possible_mask);
 	if (!cpumask_empty(cpumask)) {
 		apply_wqattrs_lock();
@@ -5579,7 +5584,7 @@ int __init workqueue_init_early(void)
 	WARN_ON(__alignof__(struct pool_workqueue) < __alignof__(long long));
 
 	BUG_ON(!alloc_cpumask_var(&wq_unbound_cpumask, GFP_KERNEL));
-	cpumask_copy(wq_unbound_cpumask, cpu_possible_mask);
+	cpumask_copy(wq_unbound_cpumask, housekeeping_cpumask(HK_FLAG_DOMAIN));
 
 	pwq_cache = KMEM_CACHE(pool_workqueue, SLAB_PANIC);
 
-- 
2.7.4
