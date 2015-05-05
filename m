From: john.hubbard@gmail.com
Subject: [PATCH v3] watchdog: Fix a watchdog crash in some configurations
Date: Tue,  5 May 2015 13:20:45 -0700
Message-ID: <1430857245-16927-1-git-send-email-jhubbard@nvidia.com>
References: <55491ef8.oLKEdMAPkQJVpO38%akpm@linux-foundation.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:35571 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031127AbbEEUVT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 May 2015 16:21:19 -0400
In-Reply-To: <55491ef8.oLKEdMAPkQJVpO38%akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, mm-commits@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>

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
a runtime check instead of the ifdef check. This fix is
simpler than my original proposed fix, thanks to Chris Metcalf
for that.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 kernel/watchdog.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 40fda2f..e8caf09 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -920,14 +920,13 @@ void __init lockup_detector_init(void)
 {
 	set_sample_period();
 
-#ifdef CONFIG_NO_HZ_FULL
-	if (!cpumask_empty(tick_nohz_full_mask))
-		pr_info("Disabling watchdog on nohz_full cores by default\n");
-	cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
-		       tick_nohz_full_mask);
-#else
-	cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
-#endif
+	if (tick_nohz_full_enabled()) {
+		if (!cpumask_empty(tick_nohz_full_mask))
+			pr_info("Disabling watchdog on nohz_full cores by default\n");
+		cpumask_andnot(&watchdog_cpumask, cpu_possible_mask,
+			       tick_nohz_full_mask);
+	} else
+		cpumask_copy(&watchdog_cpumask, cpu_possible_mask);
 
 	if (watchdog_enabled)
 		watchdog_enable_all_cpus();
-- 
2.3.7
