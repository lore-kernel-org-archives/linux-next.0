From: Venkatesh Pallipadi <venki@google.com>
Subject: [PATCH] Fix linux-next warning from abb74cef
Date: Mon, 31 Jan 2011 11:12:43 -0800
Message-ID: <1296501163-31113-1-git-send-email-venki@google.com>
References: <AANLkTi=+VtHwRMkxq+BK3wRDE9fiAZCy=5dypn45o=Hz@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.44.51]:52770 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755479Ab1AaTNi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Jan 2011 14:13:38 -0500
Received: from wpaz5.hot.corp.google.com (wpaz5.hot.corp.google.com [172.24.198.69])
	by smtp-out.google.com with ESMTP id p0VJDcqu015136
	for <linux-next@vger.kernel.org>; Mon, 31 Jan 2011 11:13:38 -0800
Received: from iwr19 (iwr19.prod.google.com [10.241.69.83])
	by wpaz5.hot.corp.google.com with ESMTP id p0VJDatn014854
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-next@vger.kernel.org>; Mon, 31 Jan 2011 11:13:36 -0800
Received: by iwr19 with SMTP id 19so6786392iwr.37
        for <linux-next@vger.kernel.org>; Mon, 31 Jan 2011 11:13:36 -0800 (PST)
In-Reply-To: <AANLkTi=+VtHwRMkxq+BK3wRDE9fiAZCy=5dypn45o=Hz@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Jaswinder Singh <jaswinderlinux@gmail.com>, Venkatesh Pallipadi <venki@google.com>

Yes. Patch below should fix the problem.

Fix below warning -
 Introduced by commit abb74cefa9c682fb38ba86c17ca3c86fed6cc464 ("sched:
 Export ns irqtimes through /proc/stat").

After merging the tip tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings:

kernel/sched.c:3719: warning: 'irqtime_account_idle_ticks' defined but not =
used
kernel/sched.c:3720: warning: 'irqtime_account_process_tick' defined but no=
t used

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Venkatesh Pallipadi <venki@google.com>
---
 kernel/sched.c |   64 ++++++++++++++++++++++++++++----------------------------
 1 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/kernel/sched.c b/kernel/sched.c
index 477e1bc..9a552bd 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -3654,6 +3654,36 @@ void account_system_time(struct task_struct *p, int hardirq_offset,
 	__account_system_time(p, cputime, cputime_scaled, target_cputime64);
 }
 
+/*
+ * Account for involuntary wait time.
+ * @steal: the cpu time spent in involuntary wait
+ */
+void account_steal_time(cputime_t cputime)
+{
+	struct cpu_usage_stat *cpustat = &kstat_this_cpu.cpustat;
+	cputime64_t cputime64 = cputime_to_cputime64(cputime);
+
+	cpustat->steal = cputime64_add(cpustat->steal, cputime64);
+}
+
+/*
+ * Account for idle time.
+ * @cputime: the cpu time spent in idle wait
+ */
+void account_idle_time(cputime_t cputime)
+{
+	struct cpu_usage_stat *cpustat = &kstat_this_cpu.cpustat;
+	cputime64_t cputime64 = cputime_to_cputime64(cputime);
+	struct rq *rq = this_rq();
+
+	if (atomic_read(&rq->nr_iowait) > 0)
+		cpustat->iowait = cputime64_add(cpustat->iowait, cputime64);
+	else
+		cpustat->idle = cputime64_add(cpustat->idle, cputime64);
+}
+
+#ifndef CONFIG_VIRT_CPU_ACCOUNTING
+
 #ifdef CONFIG_IRQ_TIME_ACCOUNTING
 /*
  * Account a tick to a process and cpustat
@@ -3715,41 +3745,11 @@ static void irqtime_account_idle_ticks(int ticks)
 	for (i = 0; i < ticks; i++)
 		irqtime_account_process_tick(current, 0, rq);
 }
-#else
+#else /* CONFIG_IRQ_TIME_ACCOUNTING */
 static void irqtime_account_idle_ticks(int ticks) {}
 static void irqtime_account_process_tick(struct task_struct *p, int user_tick,
 						struct rq *rq) {}
-#endif
-
-/*
- * Account for involuntary wait time.
- * @steal: the cpu time spent in involuntary wait
- */
-void account_steal_time(cputime_t cputime)
-{
-	struct cpu_usage_stat *cpustat = &kstat_this_cpu.cpustat;
-	cputime64_t cputime64 = cputime_to_cputime64(cputime);
-
-	cpustat->steal = cputime64_add(cpustat->steal, cputime64);
-}
-
-/*
- * Account for idle time.
- * @cputime: the cpu time spent in idle wait
- */
-void account_idle_time(cputime_t cputime)
-{
-	struct cpu_usage_stat *cpustat = &kstat_this_cpu.cpustat;
-	cputime64_t cputime64 = cputime_to_cputime64(cputime);
-	struct rq *rq = this_rq();
-
-	if (atomic_read(&rq->nr_iowait) > 0)
-		cpustat->iowait = cputime64_add(cpustat->iowait, cputime64);
-	else
-		cpustat->idle = cputime64_add(cpustat->idle, cputime64);
-}
-
-#ifndef CONFIG_VIRT_CPU_ACCOUNTING
+#endif /* CONFIG_IRQ_TIME_ACCOUNTING */
 
 /*
  * Account a single tick of cpu time.
-- 
1.7.3.1
