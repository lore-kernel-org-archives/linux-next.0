From: john.hubbard@gmail.com
Subject: [PATCH] cpuidle: Fix a watchdog crash in some configurations
Date: Sat,  2 May 2015 01:10:08 -0700
Message-ID: <1430554208-23588-1-git-send-email-jhubbard@nvidia.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:34696 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750866AbbEBIKo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 2 May 2015 04:10:44 -0400
Received: by pacyx8 with SMTP id yx8so112248194pac.1
        for <linux-next@vger.kernel.org>; Sat, 02 May 2015 01:10:43 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Metcalf <cmetcalf@ezchip.com>
Cc: Don Zickus <dzickus@redhat.com>, Ingo Molnar <mingo@kernel.org>, Ulrich Obergfell <uobergfe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>

From: John Hubbard <jhubbard@nvidia.com>

Commit 8fcf2cc768acd845c1fed837bf9cfe2d7106336d in linux-next
introduced a regression in some configurations. Specifically,
with CONFIG_NO_HZ_FULL set, and CONFIG_NO_HZ_FULL_ALL *not* set,
the kernel will crash in lockup_detector_init(), due to a
NULL tick_nohz_full_init pointer.

This is because the above commit uses tick_nohz_full_init
(in lockup_detector_init), if CONFIG_NO_HZ_FULL is set, but
tick_nohz_full_init only gets allocated if either:

    a) CONFIG_NO_HZ_FULL_ALL is set, or

    b) Someone passes in nohz_full=<any_value> on the boot
      args line.

To correct this, change the allocation site (case a, above):
allocate tick_nohz_full_init whenever CONFIG_NO_HZ_FULL is set.
Also, change the enclosing function name to more accurately
reflect its current role.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 kernel/time/tick-sched.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 9142591..b21ee28 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -326,11 +326,11 @@ static int tick_nohz_cpu_down_callback(struct notifier_block *nfb,
 	return NOTIFY_OK;
 }
 
-static int tick_nohz_init_all(void)
+static int tick_nohz_full_init(void)
 {
 	int err = -1;
 
-#ifdef CONFIG_NO_HZ_FULL_ALL
+#ifdef CONFIG_NO_HZ_FULL
 	if (!alloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL)) {
 		WARN(1, "NO_HZ: Can't allocate full dynticks cpumask\n");
 		return err;
@@ -347,7 +347,7 @@ void __init tick_nohz_init(void)
 	int cpu;
 
 	if (!tick_nohz_full_running) {
-		if (tick_nohz_init_all() < 0)
+		if (tick_nohz_full_init() < 0)
 			return;
 	}
 
-- 
2.3.7
