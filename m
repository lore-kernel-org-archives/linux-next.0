From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the tip tree
Date: Wed, 3 Feb 2010 16:38:22 +1100
Message-ID: <20100203163822.2742bcc5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <fweisbec@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
include/linux/ftrace_event.h, include/trace/ftrace.h,
kernel/trace/trace_kprobe.c, kernel/trace/trace_syscalls.c and
kernel/trace/trace_event_profile.c between commit
430ad5a600a83956749307b13257c464c3826b55 ("perf: Factorize trace events
raw sample buffer operations") from the tip tree and commit
eeb721be6bc03fe37755e69ab5c3ba2fe9897fd9 ("percpu: add __percpu sparse
annotations to trace") from the percpu tree.

I attempted to fix them up (see below) but someone should check the
result carefully.  (The apparently unchanged files below used the tip
tree versions.)

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/ftrace_event.h
index 6b7c444,72fccdd..0000000
--- a/include/linux/ftrace_event.h
+++ b/include/linux/ftrace_event.h
diff --cc include/trace/ftrace.h
index fb2c5bd,210d421..0000000
--- a/include/trace/ftrace.h
+++ b/include/trace/ftrace.h
diff --cc kernel/trace/trace_event_profile.c
index f0d6930,4b16312..0000000
--- a/kernel/trace/trace_event_profile.c
+++ b/kernel/trace/trace_event_profile.c
@@@ -10,8 -9,11 +10,8 @@@
  #include "trace.h"
  
  
- static char *perf_trace_buf;
- static char *perf_trace_buf_nmi;
 -char __percpu *perf_trace_buf;
 -EXPORT_PER_CPU_SYMBOL_GPL(perf_trace_buf);
 -
 -char __percpu *perf_trace_buf_nmi;
 -EXPORT_PER_CPU_SYMBOL_GPL(perf_trace_buf_nmi);
++static char __percpu *perf_trace_buf;
++static char __percpu *perf_trace_buf_nmi;
  
  typedef typeof(char [FTRACE_MAX_PROFILE_SIZE]) perf_trace_t ;
  
@@@ -118,47 -120,3 +118,48 @@@ void ftrace_profile_disable(int event_i
  	}
  	mutex_unlock(&event_mutex);
  }
 +
 +__kprobes void *ftrace_perf_buf_prepare(int size, unsigned short type,
 +					int *rctxp, unsigned long *irq_flags)
 +{
 +	struct trace_entry *entry;
- 	char *trace_buf, *raw_data;
++	char __percpu *trace_buf;
++	char *raw_data;
 +	int pc, cpu;
 +
 +	pc = preempt_count();
 +
 +	/* Protect the per cpu buffer, begin the rcu read side */
 +	local_irq_save(*irq_flags);
 +
 +	*rctxp = perf_swevent_get_recursion_context();
 +	if (*rctxp < 0)
 +		goto err_recursion;
 +
 +	cpu = smp_processor_id();
 +
 +	if (in_nmi())
 +		trace_buf = rcu_dereference(perf_trace_buf_nmi);
 +	else
 +		trace_buf = rcu_dereference(perf_trace_buf);
 +
 +	if (!trace_buf)
 +		goto err;
 +
 +	raw_data = per_cpu_ptr(trace_buf, cpu);
 +
 +	/* zero the dead bytes from align to not leak stack to user */
 +	*(u64 *)(&raw_data[size - sizeof(u64)]) = 0ULL;
 +
 +	entry = (struct trace_entry *)raw_data;
 +	tracing_generic_entry_update(entry, *irq_flags, pc);
 +	entry->type = type;
 +
 +	return raw_data;
 +err:
 +	perf_swevent_put_recursion_context(*rctxp);
 +err_recursion:
 +	local_irq_restore(*irq_flags);
 +	return NULL;
 +}
 +EXPORT_SYMBOL_GPL(ftrace_perf_buf_prepare);
diff --cc kernel/trace/trace_kprobe.c
index 9d085d3,4567950..0000000
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
diff --cc kernel/trace/trace_syscalls.c
index 6cce6a8,9f7de51..0000000
--- a/kernel/trace/trace_syscalls.c
+++ b/kernel/trace/trace_syscalls.c
