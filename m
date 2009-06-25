From: Paul Mundt <lethal@linux-sh.org>
Subject: [PATCH -next 1/2] ring-buffer: Really make it generic.
Date: Thu, 25 Jun 2009 14:30:12 +0900
Message-ID: <20090625053012.GB19944@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 124x34x33x190.ap124.ftth.ucom.ne.jp ([124.34.33.190]:42311 "EHLO
	master.linux-sh.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893AbZFYFbO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 25 Jun 2009 01:31:14 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@elte.hu>
Cc: Jon Masters <jcm@jonmasters.org>, linux-next@vger.kernel.org

In hunting down the cause for the hwlat_detector ring buffer spew in
my failed -next builds it became obvious that folks are now treating
ring_buffer as something that is generic independent of tracing and thus,
suitable for public driver consumption.

Given that there are only a few minor areas in ring_buffer that have any
reliance on CONFIG_TRACING or CONFIG_FUNCTION_TRACER, provide stubs for
those and make it generally available.

Signed-off-by: Paul Mundt <lethal@linux-sh.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@elte.hu>
Cc: Jon Masters <jcm@jonmasters.org>

---

 kernel/Makefile            |    1 +
 kernel/trace/ring_buffer.c |   11 +++++++++++
 kernel/trace/trace.h       |    7 +++++++
 3 files changed, 19 insertions(+)

diff --git a/kernel/Makefile b/kernel/Makefile
index 0a32cb2..0630e29 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_HAVE_GENERIC_DMA_COHERENT) += dma-coherent.o
 obj-$(CONFIG_FUNCTION_TRACER) += trace/
 obj-$(CONFIG_TRACING) += trace/
 obj-$(CONFIG_X86_DS) += trace/
+obj-$(CONFIG_RING_BUFFER) += trace/
 obj-$(CONFIG_SMP) += sched_cpupri.o
 obj-$(CONFIG_SLOW_WORK) += slow-work.o
 obj-$(CONFIG_PERF_COUNTERS) += perf_counter.o
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 04dac26..bf27bb7 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -1563,6 +1563,8 @@ rb_reserve_next_event(struct ring_buffer_per_cpu *cpu_buffer,
 	return NULL;
 }
 
+#ifdef CONFIG_TRACING
+
 #define TRACE_RECURSIVE_DEPTH 16
 
 static int trace_recursive_lock(void)
@@ -1593,6 +1595,13 @@ static void trace_recursive_unlock(void)
 	current->trace_recursion--;
 }
 
+#else
+
+#define trace_recursive_lock()		(0)
+#define trace_recursive_unlock()	do { } while (0)
+
+#endif
+
 static DEFINE_PER_CPU(int, rb_need_resched);
 
 /**
@@ -3104,6 +3113,7 @@ int ring_buffer_read_page(struct ring_buffer *buffer,
 }
 EXPORT_SYMBOL_GPL(ring_buffer_read_page);
 
+#ifdef CONFIG_TRACING
 static ssize_t
 rb_simple_read(struct file *filp, char __user *ubuf,
 	       size_t cnt, loff_t *ppos)
@@ -3171,6 +3181,7 @@ static __init int rb_init_debugfs(void)
 }
 
 fs_initcall(rb_init_debugfs);
+#endif
 
 #ifdef CONFIG_HOTPLUG_CPU
 static int rb_cpu_notify(struct notifier_block *self,
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 6e735d4..3548ae5 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -597,6 +597,7 @@ print_graph_function(struct trace_iterator *iter)
 
 extern struct pid *ftrace_pid_trace;
 
+#ifdef CONFIG_FUNCTION_TRACER
 static inline int ftrace_trace_task(struct task_struct *task)
 {
 	if (!ftrace_pid_trace)
@@ -604,6 +605,12 @@ static inline int ftrace_trace_task(struct task_struct *task)
 
 	return test_tsk_trace_trace(task);
 }
+#else
+static inline int ftrace_trace_task(struct task_struct *task)
+{
+	return 1;
+}
+#endif
 
 /*
  * trace_iterator_flags is an enumeration that defines bit
