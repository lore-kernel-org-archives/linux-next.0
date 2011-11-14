From: "Fenghua Yu" <fenghua.yu@intel.com>
Subject: [PATCH v2] kernel/cpu.c: Add right qualifiers for alloc_frozen_cpus() and cpu_hotplug_pm_sync_init()
Date: Mon, 14 Nov 2011 15:57:20 -0800
Message-ID: <1321315040-4644-1-git-send-email-fenghua.yu@intel.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:33939 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751475Ab1KOAOs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 14 Nov 2011 19:14:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Rafael J. Wyso
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Fenghua Yu <fenghua.yu@intel.com>

From: Fenghua Yu <fenghua.yu@intel.com>

Add __init for functions alloc_frozen_cpus() and cpu_hotplug_pm_sync_init()
because they are only called during boot time.

Add static for function cpu_hotplug_pm_sync_init() because its scope is limited
in this file only.

Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
---
v2: Change a function name typo in the title.

 kernel/cpu.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 563f136..cf915b8 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -470,7 +470,7 @@ out:
 	cpu_maps_update_done();
 }
 
-static int alloc_frozen_cpus(void)
+static int __init alloc_frozen_cpus(void)
 {
 	if (!alloc_cpumask_var(&frozen_cpus, GFP_KERNEL|__GFP_ZERO))
 		return -ENOMEM;
@@ -543,7 +543,7 @@ cpu_hotplug_pm_callback(struct notifier_block *nb,
 }
 
 
-int cpu_hotplug_pm_sync_init(void)
+static int __init cpu_hotplug_pm_sync_init(void)
 {
 	pm_notifier(cpu_hotplug_pm_callback, 0);
 	return 0;
-- 
1.6.0.3
