From: john.hubbard@gmail.com
Subject: [PATCH v4] watchdog: Fix a watchdog crash in some configurations
Date: Tue,  5 May 2015 16:00:24 -0700
Message-ID: <1430866824-30313-1-git-send-email-jhubbard@nvidia.com>
References: <55494857.90404@ezchip.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:36835 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101AbbEEXAe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2015 19:00:34 -0400
Received: by pdea3 with SMTP id a3so211922279pde.3
        for <linux-next@vger.kernel.org>; Tue, 05 May 2015 16:00:33 -0700 (PDT)
In-Reply-To: <55494857.90404@ezchip.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@ezchip.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Don Zickus <dzickus@redhat.com>, Ingo Molnar <mingo@kernel.org>, Ulrich Obergfell <uobergfe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Weisbecker <fweisbec@gmail.com>, linux-next@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>

From: John Hubbard <jhubbard@nvidia.com>

Commit <8fcf2cc768acd845c> in linux-next
introduced a regression in some configurations. Specifically,
with CONFIG_NO_HZ_FULL set, and CONFIG_NO_HZ_FULL_ALL *not* set,
the kernel will crash in lockup_detector_init(), due to a
NULL tick_nohz_full_mask pointer.

This is because the above commit uses tick_nohz_full_mask
(in lockup_detector_init), if CONFIG_NO_HZ_FULL is set, but
tick_nohz_full_mask only gets allocated if either:

    a) CONFIG_NO_HZ_FULL_ALL is set, or

    b) Someone passes in nohz_full=<any_value> on the boot
      args line.

To correct this, change lockup_detector_init so that it does
a runtime check in addition to the ifdef check. This fix is
simpler than my original proposed fix, thanks to Chris Metcalf
for that.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 kernel/watchdog.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 40fda2f..be34f7f 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -921,10 +921,13 @@ void __init lockup_detector_init(void)
 	set_sample_period();
 
 #ifdef CONFIG_NO_HZ_FULL
-	if (!cpumask_empty(tick_nohz_full_mask))
-		pr_info("Disabling watchdog on nohz_full cores by default\n");
-	cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
-		       tick_nohz_full_mask);
+	if (tick_nohz_full_enabled()) {
+		if (!cpumask_empty(tick_nohz_full_mask))
+			pr_info("Disabling watchdog on nohz_full cores by default\n");
+		cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
+			       tick_nohz_full_mask);
+	} else
+		cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
 #else
 	cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
 #endif
-- 
2.3.7
