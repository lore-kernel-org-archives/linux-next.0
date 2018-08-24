From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warnings from the build of Linus' tree
Date: Fri, 24 Aug 2018 14:46:16 +0200
Message-ID: <CAK8P3a0LXxq8tgsz9YL3hT47dB6nKeBdip3gFA5w0dgRGDwCMQ@mail.gmail.com>
References: <20180824133206.4218c2e5@canb.auug.org.au> <20180824172053.20fa197294f51496dcec5605@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180824172053.20fa197294f51496dcec5605@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Steven Rostedt <rostedt@goodmis.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 24, 2018 at 10:23 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> On Fri, 24 Aug 2018 13:32:06 +1000
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > Hi all,
> >
> > After merging the origin tree, today's linux-next build (powerpc
> > allyesconfig) produced these warnings:
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

Thje same commit causes a link failure on ARM with a randconfig
kernel (see https://pastebin.com/KspjpyKG for the .config):

`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_clock.o: defined in discarded section `.text.exit'
of kernel/trace/trace_clock.o
`_GLOBAL__sub_D_00100_1_trace_clock_local' referenced in section
`.fini_array.00100' of kernel/trace/trace_clock.o: defined in
discarded section `.text.exit' of kernel/trace/trace_clock.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/ftrace.o: defined in discarded section `.text.exit' of
kernel/trace/ftrace.o
`_GLOBAL__sub_D_00100_1_function_trace_op' referenced in section
`.fini_array.00100' of kernel/trace/ftrace.o: defined in discarded
section `.text.exit' of kernel/trace/ftrace.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/ring_buffer.o: defined in discarded section `.text.exit'
of kernel/trace/ring_buffer.o
`_GLOBAL__sub_D_00100_1_ring_buffer_print_entry_header' referenced in
section `.fini_array.00100' of kernel/trace/ring_buffer.o: defined in
discarded section `.text.exit' of kernel/trace/ring_buffer.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/ring_buffer_benchmark.o: defined in discarded section
`.text.exit' of kernel/trace/ring_buffer_benchmark.o
`_GLOBAL__sub_D_00100_1_ring_buffer_benchmark.c' referenced in section
`.fini_array.00100' of kernel/trace/ring_buffer_benchmark.o: defined
in discarded section `.text.exit' of
kernel/trace/ring_buffer_benchmark.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace.o: defined in discarded section `.text.exit' of
kernel/trace/trace.o
`_GLOBAL__sub_D_00100_1_ns2usecs' referenced in section
`.fini_array.00100' of kernel/trace/trace.o: defined in discarded
section `.text.exit' of kernel/trace/trace.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_output.o: defined in discarded section `.text.exit'
of kernel/trace/trace_output.o
`_GLOBAL__sub_D_00100_1_trace_event_sem' referenced in section
`.fini_array.00100' of kernel/trace/trace_output.o: defined in
discarded section `.text.exit' of kernel/trace/trace_output.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_seq.o: defined in discarded section `.text.exit' of
kernel/trace/trace_seq.o
`_GLOBAL__sub_D_00100_1_trace_print_seq' referenced in section
`.fini_array.00100' of kernel/trace/trace_seq.o: defined in discarded
section `.text.exit' of kernel/trace/trace_seq.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_stat.o: defined in discarded section `.text.exit'
of kernel/trace/trace_stat.o
`_GLOBAL__sub_D_00100_1_register_stat_tracer' referenced in section
`.fini_array.00100' of kernel/trace/trace_stat.o: defined in discarded
section `.text.exit' of kernel/trace/trace_stat.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_printk.o: defined in discarded section `.text.exit'
of kernel/trace/trace_printk.o
`_GLOBAL__sub_D_00100_1_trace_printk_control' referenced in section
`.fini_array.00100' of kernel/trace/trace_printk.o: defined in
discarded section `.text.exit' of kernel/trace/trace_printk.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_sched_switch.o: defined in discarded section
`.text.exit' of kernel/trace/trace_sched_switch.o
`_GLOBAL__sub_D_00100_1_tracing_start_cmdline_record' referenced in
section `.fini_array.00100' of kernel/trace/trace_sched_switch.o:
defined in discarded section `.text.exit' of
kernel/trace/trace_sched_switch.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_functions.o: defined in discarded section
`.text.exit' of kernel/trace/trace_functions.o
`_GLOBAL__sub_D_00100_1_ftrace_create_function_files' referenced in
section `.fini_array.00100' of kernel/trace/trace_functions.o: defined
in discarded section `.text.exit' of kernel/trace/trace_functions.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_preemptirq.o: defined in discarded section
`.text.exit' of kernel/trace/trace_preemptirq.o
`_GLOBAL__sub_D_00100_1___tracepoint_irq_disable' referenced in
section `.fini_array.00100' of kernel/trace/trace_preemptirq.o:
defined in discarded section `.text.exit' of
kernel/trace/trace_preemptirq.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_irqsoff.o: defined in discarded section
`.text.exit' of kernel/trace/trace_irqsoff.o
`_GLOBAL__sub_D_00100_1_start_critical_timings' referenced in section
`.fini_array.00100' of kernel/trace/trace_irqsoff.o: defined in
discarded section `.text.exit' of kernel/trace/trace_irqsoff.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_sched_wakeup.o: defined in discarded section
`.text.exit' of kernel/trace/trace_sched_wakeup.o
`_GLOBAL__sub_D_00100_1_trace_sched_wakeup.c' referenced in section
`.fini_array.00100' of kernel/trace/trace_sched_wakeup.o: defined in
discarded section `.text.exit' of kernel/trace/trace_sched_wakeup.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_hwlat.o: defined in discarded section `.text.exit'
of kernel/trace/trace_hwlat.o
`_GLOBAL__sub_D_00100_1_trace_hwlat_callback' referenced in section
`.fini_array.00100' of kernel/trace/trace_hwlat.o: defined in
discarded section `.text.exit' of kernel/trace/trace_hwlat.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_nop.o: defined in discarded section `.text.exit' of
kernel/trace/trace_nop.o
`_GLOBAL__sub_D_00100_1_nop_trace' referenced in section
`.fini_array.00100' of kernel/trace/trace_nop.o: defined in discarded
section `.text.exit' of kernel/trace/trace_nop.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_stack.o: defined in discarded section `.text.exit'
of kernel/trace/trace_stack.o
`_GLOBAL__sub_D_00100_1_stack_trace_max' referenced in section
`.fini_array.00100' of kernel/trace/trace_stack.o: defined in
discarded section `.text.exit' of kernel/trace/trace_stack.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_branch.o: defined in discarded section `.text.exit'
of kernel/trace/trace_branch.o
`_GLOBAL__sub_D_00100_1_enable_branch_tracing' referenced in section
`.fini_array.00100' of kernel/trace/trace_branch.o: defined in
discarded section `.text.exit' of kernel/trace/trace_branch.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_events.o: defined in discarded section `.text.exit'
of kernel/trace/trace_events.o
`_GLOBAL__sub_D_00100_1_event_mutex' referenced in section
`.fini_array.00100' of kernel/trace/trace_events.o: defined in
discarded section `.text.exit' of kernel/trace/trace_events.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_export.o: defined in discarded section `.text.exit'
of kernel/trace/trace_export.o
`_GLOBAL__sub_D_00100_1_ftrace_event_is_function' referenced in
section `.fini_array.00100' of kernel/trace/trace_export.o: defined in
discarded section `.text.exit' of kernel/trace/trace_export.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_event_perf.o: defined in discarded section
`.text.exit' of kernel/trace/trace_event_perf.o
`_GLOBAL__sub_D_00100_1_perf_trace_init' referenced in section
`.fini_array.00100' of kernel/trace/trace_event_perf.o: defined in
discarded section `.text.exit' of kernel/trace/trace_event_perf.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_events_filter.o: defined in discarded section
`.text.exit' of kernel/trace/trace_events_filter.o
`_GLOBAL__sub_D_00100_1_filter_parse_regex' referenced in section
`.fini_array.00100' of kernel/trace/trace_events_filter.o: defined in
discarded section `.text.exit' of kernel/trace/trace_events_filter.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_events_trigger.o: defined in discarded section
`.text.exit' of kernel/trace/trace_events_trigger.o
`_GLOBAL__sub_D_00100_1_trigger_data_free' referenced in section
`.fini_array.00100' of kernel/trace/trace_events_trigger.o: defined in
discarded section `.text.exit' of kernel/trace/trace_events_trigger.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/power-traces.o: defined in discarded section `.text.exit'
of kernel/trace/power-traces.o
`_GLOBAL__sub_D_00100_1___tracepoint_cpu_idle' referenced in section
`.fini_array.00100' of kernel/trace/power-traces.o: defined in
discarded section `.text.exit' of kernel/trace/power-traces.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/rpm-traces.o: defined in discarded section `.text.exit'
of kernel/trace/rpm-traces.o
`_GLOBAL__sub_D_00100_1___tracepoint_rpm_suspend' referenced in
section `.fini_array.00100' of kernel/trace/rpm-traces.o: defined in
discarded section `.text.exit' of kernel/trace/rpm-traces.o
`.text.exit' referenced in section `.ARM.exidx.text.exit' of
kernel/trace/trace_benchmark.o: defined in discarded section
`.text.exit' of kernel/trace/trace_benchmark.o
`_GLOBAL__sub_D_00100_1___tracepoint_benchmark_event' referenced in
section `.fini_array.00100' of kernel/trace/trace_benchmark.o: defined
in discarded section `.text.exit' of kernel/trace/trace_benchmark.o
