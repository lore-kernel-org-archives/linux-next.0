From: Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Fri, 24 Aug 2018 20:47:56 +0900
Message-ID: <20180824204756.e787765461975cd1e27502dc@kernel.org>
References: <20180824133206.4218c2e5@canb.auug.org.au>
        <20180824172053.20fa197294f51496dcec5605@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824172053.20fa197294f51496dcec5605@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 24 Aug 2018 17:20:53 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Fri, 24 Aug 2018 13:32:06 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > After merging the origin tree, today's linux-next build (powerpc
> > allyesconfig) produced these warnings:
> > 
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_selftest_dynamic.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_kprobe_selftest.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_clock.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/ftrace.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/ring_buffer.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/ring_buffer_benchmark.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_output.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_seq.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_stat.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_printk.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/tracing_map.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_sched_switch.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_functions.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_preemptirq.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_irqsoff.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_sched_wakeup.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_hwlat.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_nop.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_stack.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_functions_graph.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/blktrace.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_export.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_syscalls.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_event_perf.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events_filter.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events_trigger.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_events_hist.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/bpf_trace.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_kprobe.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/power-traces.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/rpm-traces.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_kdb.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_probe.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_uprobe.o' being placed in section `.data..LPBX1'
> > ld: warning: orphan section `.data..LPBX1' from `kernel/trace/trace_benchmark.o' being placed in section `.data..LPBX1'
> > 
> > Maybe introduced by commit
> > 
> >   6b7dca401cb1 ("tracing: Allow gcov profiling on only ftrace subsystem")
> > 
> > I am guessing, but that is the only new thing that affects all of
> > kernel/trace ...
> 
> Yes, I agree. But I just followed Documentation/dev-tools/gcov.rst
> to enable profiling in kernel/trace. Hmm, doesn't ppc64 support
> GCOV_PROFILE?  (But as far as I can see, ARCH_HAS_GCOV_PROFILE_ALL
> is enabled in arch/powerpc/Kconfig)
> 
> Anyway, I'll try to reproduce it.

gcc-7.3.0 cross build ld shows below warnings.

  MODPOST vmlinux.o
/opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
  KSYM    .tmp_kallsyms1.o
/opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
  KSYM    .tmp_kallsyms2.o
/opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.
  KSYM    .tmp_kallsyms3.o
  LD      vmlinux
/opt/gcc-7.3.0-nolibc/powerpc64-linux/bin/powerpc64-linux-ld: warning: orphan section `.gnu.hash' from `linker stubs' being placed in section `.gnu.hash'.

But it seems another warning, and I couldn't see your warnings. Could you tell me your gcc version?

Thank you,

-- 
Masami Hiramatsu <mhiramat@kernel.org>
