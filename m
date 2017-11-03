From: Tal Shorer <tal.shorer@gmail.com>
Subject: [PATCH v3 1/2] main: kernel_start: move housekeeping_init() before workqueue_init_early()
Date: Fri,  3 Nov 2017 17:27:49 +0200
Message-ID: <1509722870-27618-1-git-send-email-tal.shorer@gmail.com>
References: <20171103135911.GS3252168@devbig577.frc2.facebook.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51023 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751381AbdKCP16 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Nov 2017 11:27:58 -0400
In-Reply-To: <20171103135911.GS3252168@devbig577.frc2.facebook.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tj@kernel.org
Cc: sfr@canb.auug.org.au, tglx@linutronix.de, mingo@elte.hu, hpa@zytor.com, peterz@infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, tal.shorer@gmail.com, frederic@kernel.org

This is needed in order to allow the unbound workqueue to take
housekeeping cpus into accounty

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
---
 init/main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 4610c99..af6ecd0 100644
--- a/init/main.c
+++ b/init/main.c
@@ -591,6 +591,12 @@ asmlinkage __visible void __init start_kernel(void)
 	radix_tree_init();
 
 	/*
+	 * Set up housekeeping before setting up workqueues to allow the unbound
+	 * workqueue to take non-housekeeping into account.
+	 */
+	housekeeping_init();
+
+	/*
 	 * Allow workqueue creation and work item queueing/cancelling
 	 * early.  Work item execution depends on kthreads and starts after
 	 * workqueue_init().
@@ -607,7 +613,6 @@ asmlinkage __visible void __init start_kernel(void)
 	early_irq_init();
 	init_IRQ();
 	tick_init();
-	housekeeping_init();
 	rcu_init_nohz();
 	init_timers();
 	hrtimers_init();
-- 
2.7.4
