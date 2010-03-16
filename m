From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: [PATCH v3] perf: Fix unexported generic perf_arch_fetch_caller_regs
Date: Tue, 16 Mar 2010 01:05:02 +0100
Message-ID: <1268697902-9518-1-git-send-regression-fweisbec@gmail.com>
References: <20100316093355.071fde51.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f219.google.com ([209.85.220.219]:35843 "EHLO
	mail-fx0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965842Ab0CPAE7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Mar 2010 20:04:59 -0400
In-Reply-To: <20100316093355.071fde51.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>, "\\ \" H . Peter Anvin \\ \"" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Linux Next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, Paul Mackerras <paulus@samba.org>

perf_arch_fetch_caller_regs() is exported for the overriden x86
version, but not for the generic weak version.
As a general rule, weak functions should not have their symbol
exported in the same file they are defined.

So let's export it on trace_event_perf.c as it is used by trace
events only.

This fixes:
	ERROR: ".perf_arch_fetch_caller_regs" [fs/xfs/xfs.ko] undefined!
	ERROR: ".perf_arch_fetch_caller_regs" [arch/powerpc/platforms/cell/spufs/spufs.ko] undefined!

v2: And also only build it if trace events are enabled.
v3: Fix changelog mistake

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Frederic Weisbecker <fweisbec@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>
Cc: Paul Mackerras <paulus@samba.org>
---
 arch/x86/kernel/cpu/perf_event.c |    3 ++-
 kernel/perf_event.c              |    2 ++
 kernel/trace/trace_event_perf.c  |    2 ++
 3 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/perf_event.c b/arch/x86/kernel/cpu/perf_event.c
index 7645fae..60398a0 100644
--- a/arch/x86/kernel/cpu/perf_event.c
+++ b/arch/x86/kernel/cpu/perf_event.c
@@ -1702,6 +1702,7 @@ struct perf_callchain_entry *perf_callchain(struct pt_regs *regs)
 	return entry;
 }
 
+#ifdef CONFIG_EVENT_TRACING
 void perf_arch_fetch_caller_regs(struct pt_regs *regs, unsigned long ip, int skip)
 {
 	regs->ip = ip;
@@ -1713,4 +1714,4 @@ void perf_arch_fetch_caller_regs(struct pt_regs *regs, unsigned long ip, int ski
 	regs->cs = __KERNEL_CS;
 	local_save_flags(regs->flags);
 }
-EXPORT_SYMBOL_GPL(perf_arch_fetch_caller_regs);
+#endif
diff --git a/kernel/perf_event.c b/kernel/perf_event.c
index fb3031c..574ee58 100644
--- a/kernel/perf_event.c
+++ b/kernel/perf_event.c
@@ -2786,10 +2786,12 @@ __weak struct perf_callchain_entry *perf_callchain(struct pt_regs *regs)
 	return NULL;
 }
 
+#ifdef CONFIG_EVENT_TRACING
 __weak
 void perf_arch_fetch_caller_regs(struct pt_regs *regs, unsigned long ip, int skip)
 {
 }
+#endif
 
 /*
  * Output
diff --git a/kernel/trace/trace_event_perf.c b/kernel/trace/trace_event_perf.c
index 0709e4f..7d79a10 100644
--- a/kernel/trace/trace_event_perf.c
+++ b/kernel/trace/trace_event_perf.c
@@ -12,6 +12,8 @@
 DEFINE_PER_CPU(struct pt_regs, perf_trace_regs);
 EXPORT_PER_CPU_SYMBOL_GPL(perf_trace_regs);
 
+EXPORT_SYMBOL_GPL(perf_arch_fetch_caller_regs);
+
 static char *perf_trace_buf;
 static char *perf_trace_buf_nmi;
 
-- 
1.6.2.3
