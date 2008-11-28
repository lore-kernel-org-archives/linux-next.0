From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: proc tree build failure
Date: Fri, 28 Nov 2008 02:25:17 -0800 (PST)
Message-ID: <20081128.022517.12021740.davem@davemloft.net>
References: <20081124181559.3896a756.sfr@canb.auug.org.au>
	<20081128080555.GC3495@x200.localdomain>
	<20081128.010025.224611672.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:37576
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750770AbYK1KZU (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 28 Nov 2008 05:25:20 -0500
In-Reply-To: <20081128.010025.224611672.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: adobriyan@gmail.com
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, kenchen@google.com, mingo@elte.hu

From: David Miller <davem@davemloft.net>
Date: Fri, 28 Nov 2008 01:00:25 -0800 (PST)

> From: Alexey Dobriyan <adobriyan@gmail.com>
> Date: Fri, 28 Nov 2008 11:05:55 +0300
> 
> > David, can you implement save_stack_trace_tsk() for sparc64? I have
> > no idea how to do it or is it doable at all.
> 
> Sure thing Alexey.

I just pushed the following patch into sparc-next-2.6, so it
should show up in the next tree that Stephen builds:

sparc64: Add save_stack_trace_tsk().

And this allows us to indicate HAVE_LATENCYTOP_SUPPORT.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 arch/sparc/Kconfig               |    4 ++++
 arch/sparc64/kernel/stacktrace.c |   32 +++++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 10945c3..e162535 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -72,6 +72,10 @@ config LOCKDEP_SUPPORT
 	bool
 	default y if SPARC64
 
+config HAVE_LATENCYTOP_SUPPORT
+	bool
+	default y if SPARC64
+
 config AUDIT_ARCH
 	bool
 	default y if SPARC64
diff --git a/arch/sparc64/kernel/stacktrace.c b/arch/sparc64/kernel/stacktrace.c
index 4e21d4a..acb12f6 100644
--- a/arch/sparc64/kernel/stacktrace.c
+++ b/arch/sparc64/kernel/stacktrace.c
@@ -7,17 +7,18 @@
 
 #include "kstack.h"
 
-void save_stack_trace(struct stack_trace *trace)
+static void __save_stack_trace(struct thread_info *tp,
+			       struct stack_trace *trace,
+			       bool skip_sched)
 {
-	struct thread_info *tp = task_thread_info(current);
 	unsigned long ksp, fp;
 
-	stack_trace_flush();
-
-	__asm__ __volatile__(
-		"mov	%%fp, %0"
-		: "=r" (ksp)
-	);
+	if (tp == current_thread_info()) {
+		stack_trace_flush();
+		__asm__ __volatile__("mov %%fp, %0" : "=r" (ksp));
+	} else {
+		ksp = tp->ksp;
+	}
 
 	fp = ksp + STACK_BIAS;
 	do {
@@ -43,8 +44,21 @@ void save_stack_trace(struct stack_trace *trace)
 
 		if (trace->skip > 0)
 			trace->skip--;
-		else
+		else if (!skip_sched || !in_sched_functions(pc))
 			trace->entries[trace->nr_entries++] = pc;
 	} while (trace->nr_entries < trace->max_entries);
 }
+
+void save_stack_trace(struct stack_trace *trace)
+{
+	__save_stack_trace(current_thread_info(), trace, false);
+}
 EXPORT_SYMBOL_GPL(save_stack_trace);
+
+void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *trace)
+{
+	struct thread_info *tp = task_thread_info(tsk);
+
+	__save_stack_trace(tp, trace, true);
+}
+EXPORT_SYMBOL_GPL(save_stack_trace_tsk);
-- 
1.5.6.5
