From: Yang Shi <yang.shi@linaro.org>
Subject: [linux-next PATCH] sched: cgroup: enable interrupt before calling threadgroup_change_begin
Date: Fri, 22 Apr 2016 20:56:28 -0700
Message-ID: <1461383788-15102-1-git-send-email-yang.shi@linaro.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:32990 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750757AbcDWEWX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 23 Apr 2016 00:22:23 -0400
Received: by mail-pf0-f172.google.com with SMTP id 184so47588672pff.0
        for <linux-next@vger.kernel.org>; Fri, 22 Apr 2016 21:22:23 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: tj@kernel.org, mingo@redhat.com, peterz@infradead.org, lizefan@huawei.com
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linaro-kernel@lists.linaro.org, yang.shi@linaro.org

When kernel oops happens in some kernel thread, i.e. kcompactd in the test,
the below bug might be triggered by the oops handler:

BUG: sleeping function called from invalid context at include/linux/sched.h:2858
in_atomic(): 0, irqs_disabled(): 1, pid: 110, name: kcompactd0
CPU: 6 PID: 110 Comm: kcompactd0 Tainted: G      D         4.6.0-rc4-next-20160420 #4
Hardware name: Intel Corporation S5520HC/S5520HC, BIOS S5500.86B.01.10.0025.030220091519 03/02/2009
 0000000000000000 ffff88036173f9e8 ffffffff8152666f 0000000000000000
 ffff880361732680 ffff88036173fa08 ffffffff81088b13 ffffffff81ee3372
 0000000000000b2a ffff88036173fa30 ffffffff81088bd9 ffff880361732680
Call Trace:
 [<ffffffff8152666f>] dump_stack+0x67/0x98
 [<ffffffff81088b13>] ___might_sleep+0x123/0x1a0
 [<ffffffff81088bd9>] __might_sleep+0x49/0x80
 [<ffffffff810706b4>] exit_signals+0x24/0x130
 [<ffffffff81063cc4>] do_exit+0xc4/0xca0
 [<ffffffff810201d9>] oops_end+0x89/0xc0
 [<ffffffff810518c4>] no_context+0x144/0x390
 [<ffffffff81542f17>] ? debug_smp_processor_id+0x17/0x20
 [<ffffffff81051c1d>] __bad_area_nosemaphore+0x10d/0x230
 [<ffffffff811769e9>] ? free_hot_cold_page_list+0x49/0xd0
 [<ffffffff81051d54>] bad_area_nosemaphore+0x14/0x20
 [<ffffffff81051f97>] __do_page_fault+0x237/0x570
 [<ffffffff810522f9>] do_page_fault+0x29/0x80
 [<ffffffff81be7b22>] page_fault+0x22/0x30
 [<ffffffff8119d2f8>] ? release_freepages+0x18/0xa0
 [<ffffffff8119f13d>] compact_zone+0x55d/0x9f0
 [<ffffffff81196239>] ? fragmentation_index+0x19/0x70
 [<ffffffff8119f92f>] kcompactd_do_work+0x10f/0x230
 [<ffffffff8119fae0>] kcompactd+0x90/0x1e0
 [<ffffffff810a3a40>] ? wait_woken+0xa0/0xa0
 [<ffffffff8119fa50>] ? kcompactd_do_work+0x230/0x230
 [<ffffffff810801ed>] kthread+0xdd/0x100
 [<ffffffff81be5ee2>] ret_from_fork+0x22/0x40
 [<ffffffff81080110>] ? kthread_create_on_node+0x180/0x180

Since the code path may be called in interrupt disabled context, so
the might_sleep in threadgroup_change_begin() may be triggered.

Before calling exit_signals(), it already checked if it is in hard IRQ handler,
so it sounds safe to reenable interrupt at that point.

Signed-off-by: Yang Shi <yang.shi@linaro.org>
---
 kernel/exit.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/exit.c b/kernel/exit.c
index 9e6e135..c6f8e37 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -679,6 +679,14 @@ void do_exit(long code)
 	validate_creds_for_do_exit(tsk);
 
 	/*
+	 * It is possible to get here with interrupt disabled when fault
+	 * happens in kernel thread. Enable interrupt to make threadgroup
+	 * happy.
+	 */
+	if (irqs_disabled())
+		local_irq_enable();
+
+	/*
 	 * We're taking recursive faults here in do_exit. Safest is to just
 	 * leave this task alone and wait for reboot.
 	 */
-- 
2.0.2
