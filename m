From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Tue, 7 Apr 2015 10:53:47 +0200
Message-ID: <20150407085347.GH23123@twins.programming.kicks-ass.net>
References: <20150407171858.2ad46594@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:37746 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752832AbbDGIyD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2015 04:54:03 -0400
Content-Disposition: inline
In-Reply-To: <20150407171858.2ad46594@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@plumgrid.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>

On Tue, Apr 07, 2015 at 05:18:58PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> kernel/events/core.c: In function 'perf_event_set_bpf_prog':
> kernel/events/core.c:6732:15: error: 'struct bpf_prog_aux' has no member named 'prog_type'
>   if (prog->aux->prog_type != BPF_PROG_TYPE_KPROBE) {
>                ^
> 
> Caused by commit 2541517c32be ("tracing, perf: Implement BPF programs
> attached to kprobes").
> 
> I have used the tip tree from next-20150402 for today.

Hmm, tip/master builds fine on ppc64 for me, but does something like the
below help?

---
Subject: perf: Fix BPF filter crud

The BPF filter crud got its CONFIG deps wrong, fix it.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 06917d5..1d94b92 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6711,6 +6711,25 @@ static void perf_event_free_filter(struct perf_event *event)
 	ftrace_profile_free_filter(event);
 }
 
+#else /* EVENT_TRACING */
+
+static inline void perf_tp_register(void)
+{
+}
+
+static int perf_event_set_filter(struct perf_event *event, void __user *arg)
+{
+	return -ENOENT;
+}
+
+static void perf_event_free_filter(struct perf_event *event)
+{
+}
+
+#endif /* EVENT_TRACING */
+
+#if defined CONFIG_BPF_EVENTS && defined CONFIG_EVENT_TRACING
+
 static int perf_event_set_bpf_prog(struct perf_event *event, u32 prog_fd)
 {
 	struct bpf_prog *prog;
@@ -6754,20 +6773,7 @@ static void perf_event_free_bpf_prog(struct perf_event *event)
 	}
 }
 
-#else
-
-static inline void perf_tp_register(void)
-{
-}
-
-static int perf_event_set_filter(struct perf_event *event, void __user *arg)
-{
-	return -ENOENT;
-}
-
-static void perf_event_free_filter(struct perf_event *event)
-{
-}
+#else /* BPF_EVENTS && EVENT_TRACING */
 
 static int perf_event_set_bpf_prog(struct perf_event *event, u32 prog_fd)
 {
@@ -6777,7 +6783,8 @@ static int perf_event_set_bpf_prog(struct perf_event *event, u32 prog_fd)
 static void perf_event_free_bpf_prog(struct perf_event *event)
 {
 }
-#endif /* CONFIG_EVENT_TRACING */
+
+#endif /* BPF_EVENTS && EVENT_TRACING */
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 void perf_bp_event(struct perf_event *bp, void *data)
