From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: [PATCH] sched: add #ifdef around irq time accounting functions
Date: Fri, 25 Feb 2011 14:24:33 +0100
Message-ID: <20110225132432.GB7469@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([194.196.100.165]:51977 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932553Ab1BYNYf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Feb 2011 08:24:35 -0500
Received: from d06nrmr1707.portsmouth.uk.ibm.com (d06nrmr1707.portsmouth.uk.ibm.com [9.149.39.225])
	by mtagate5.uk.ibm.com (8.13.1/8.13.1) with ESMTP id p1PDOXA2007698
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 13:24:33 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com [9.149.37.212])
	by d06nrmr1707.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id p1PDOhZg1413364
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 13:24:43 GMT
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id p1PDOXHY009950
	for <linux-next@vger.kernel.org>; Fri, 25 Feb 2011 06:24:33 -0700
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Venkatesh Pallipadi <venki@google.com>, Peter Zijlstra <a.p.ziljstra@chello.nl>
Cc: linux-next@vger.kernel.org

From: Heiko Carstens <heiko.carstens@de.ibm.com>

Get rid of this:

kernel/sched.c:3731:13: warning: 'irqtime_account_idle_ticks' defined but not used
kernel/sched.c:3732:13: warning: 'irqtime_account_process_tick' defined but not used

Cc: Venkatesh Pallipadi <venki@google.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---

Patch is against linux-next.

 kernel/sched.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -3666,6 +3666,7 @@ void account_system_time(struct task_str
 	__account_system_time(p, cputime, cputime_scaled, target_cputime64);
 }
 
+#ifndef CONFIG_VIRT_CPU_ACCOUNTING
 #ifdef CONFIG_IRQ_TIME_ACCOUNTING
 /*
  * Account a tick to a process and cpustat
@@ -3732,6 +3733,7 @@ static void irqtime_account_idle_ticks(i
 static void irqtime_account_process_tick(struct task_struct *p, int user_tick,
 						struct rq *rq) {}
 #endif
+#endif /* !CONFIG_VIRT_CPU_ACCOUNTING */
 
 /*
  * Account for involuntary wait time.
