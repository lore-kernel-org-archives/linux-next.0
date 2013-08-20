From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [RFC PATCH next]cpufreq:  fix bad unlock balance on !CONFIG_SMP
Date: Tue, 20 Aug 2013 13:11:50 +0800
Message-ID: <1376975510.3788.9.camel@ThinkPad-T5421>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp04.in.ibm.com ([122.248.162.4]:40824 "EHLO
	e28smtp04.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751959Ab3HTFMB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 20 Aug 2013 01:12:01 -0400
Received: from /spool/local
	by e28smtp04.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Tue, 20 Aug 2013 10:34:01 +0530
Received: from d28relay02.in.ibm.com (d28relay02.in.ibm.com [9.184.220.59])
	by d28dlp01.in.ibm.com (Postfix) with ESMTP id 40C84E0053
	for <linux-next@vger.kernel.org>; Tue, 20 Aug 2013 10:42:22 +0530 (IST)
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay02.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id r7K5DPvg9371842
	for <linux-next@vger.kernel.org>; Tue, 20 Aug 2013 10:43:25 +0530
Received: from d28av04.in.ibm.com (localhost [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id r7K5BrlB019962
	for <linux-next@vger.kernel.org>; Tue, 20 Aug 2013 10:41:53 +0530
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next list <linux-next@vger.kernel.org>
Cc: viresh.kumar@linaro.org, rafael.j.wysocki@intel.com

This patch tries to fix lockdep complaint attached below.

It seems that we should always read acquire the cpufreq_rwsem, whether
CONFIG_SMP is enabled or not. And CONFIG_HOTPLUG_CPU depends on
CONFIG_SMP, so it seems we don't need CONFIG_SMP for the code enabled by
CONFIG_HOTPLUG_CPU.

[    0.504191] =====================================
[    0.504627] [ BUG: bad unlock balance detected! ]
[    0.504627] 3.11.0-rc6-next-20130819 #1 Not tainted
[    0.504627] -------------------------------------
[    0.504627] swapper/1 is trying to release lock (cpufreq_rwsem) at:
[    0.504627] [<ffffffff813d927a>] cpufreq_add_dev+0x13a/0x3e0
[    0.504627] but there are no more locks to release!
[    0.504627] 
[    0.504627] other info that might help us debug this:
[    0.504627] 1 lock held by swapper/1:
[    0.504627]  #0:  (subsys mutex#4){+.+.+.}, at: [<ffffffff8134a7bf>] subsys_interface_register+0x4f/0xe0
[    0.504627] 
[    0.504627] stack backtrace:
[    0.504627] CPU: 0 PID: 1 Comm: swapper Not tainted 3.11.0-rc6-next-20130819 #1
[    0.504627] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
[    0.504627]  ffffffff813d927a ffff88007f847c98 ffffffff814c062b ffff88007f847cc8
[    0.504627]  ffffffff81098bce ffff88007f847cf8 ffffffff81aadc30 ffffffff813d927a
[    0.504627]  00000000ffffffff ffff88007f847d68 ffffffff8109d0be 0000000000000006
[    0.504627] Call Trace:
[    0.504627]  [<ffffffff813d927a>] ? cpufreq_add_dev+0x13a/0x3e0
[    0.504627]  [<ffffffff814c062b>] dump_stack+0x19/0x1b
[    0.504627]  [<ffffffff81098bce>] print_unlock_imbalance_bug+0xfe/0x110
[    0.504627]  [<ffffffff813d927a>] ? cpufreq_add_dev+0x13a/0x3e0
[    0.504627]  [<ffffffff8109d0be>] lock_release_non_nested+0x1ee/0x310
[    0.504627]  [<ffffffff81099d0e>] ? mark_held_locks+0xae/0x120
[    0.504627]  [<ffffffff811510cb>] ? kfree+0xcb/0x1d0
[    0.504627]  [<ffffffff813d77ea>] ? cpufreq_policy_free+0x4a/0x60
[    0.504627]  [<ffffffff813d927a>] ? cpufreq_add_dev+0x13a/0x3e0
[    0.504627]  [<ffffffff8109d2a4>] lock_release+0xc4/0x250
[    0.504627]  [<ffffffff8106c9f3>] up_read+0x23/0x40
[    0.504627]  [<ffffffff813d927a>] cpufreq_add_dev+0x13a/0x3e0
[    0.504627]  [<ffffffff8134a809>] subsys_interface_register+0x99/0xe0
[    0.504627]  [<ffffffff81b19f3b>] ? cpufreq_gov_dbs_init+0x12/0x12
[    0.504627]  [<ffffffff813d7f0d>] cpufreq_register_driver+0x9d/0x1d0
[    0.504627]  [<ffffffff81b19f3b>] ? cpufreq_gov_dbs_init+0x12/0x12
[    0.504627]  [<ffffffff81b1a039>] acpi_cpufreq_init+0xfe/0x1f8
[    0.504627]  [<ffffffff810002ba>] do_one_initcall+0xda/0x180
[    0.504627]  [<ffffffff81ae301e>] kernel_init_freeable+0x12c/0x1bb
[    0.504627]  [<ffffffff81ae2841>] ? do_early_param+0x8c/0x8c
[    0.504627]  [<ffffffff814b4dd0>] ? rest_init+0x140/0x140
[    0.504627]  [<ffffffff814b4dde>] kernel_init+0xe/0xf0
[    0.504627]  [<ffffffff814d029a>] ret_from_fork+0x7a/0xb0
[    0.504627]  [<ffffffff814b4dd0>] ? rest_init+0x140/0x140

Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
---
 drivers/cpufreq/cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index c0ef84d..8408957 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -986,6 +986,7 @@ static int __cpufreq_add_dev(struct device *dev, struct subsys_interface *sif,
 		cpufreq_cpu_put(policy);
 		return 0;
 	}
+#endif
 
 	if (!down_read_trylock(&cpufreq_rwsem))
 		return 0;
@@ -1004,7 +1005,6 @@ static int __cpufreq_add_dev(struct device *dev, struct subsys_interface *sif,
 	}
 	read_unlock_irqrestore(&cpufreq_driver_lock, flags);
 #endif
-#endif
 
 	if (frozen)
 		/* Restore the saved policy when doing light-weight init */
