From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tip tree
Date: Mon, 18 Apr 2016 13:03:31 +1000
Message-ID: <20160418130331.5d568a8c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi all,

After merging the tip tree, today's linux-next build (powerpc64le perf)
failed like this:

builtin-trace.c: In function 'cmd_trace':
builtin-trace.c:3112:7: error: variable 'max_stack_user_set' set but not used [-Werror=unused-but-set-variable]
  bool max_stack_user_set = true;
       ^

Caused by commit

  056149932602 ("perf trace: Make --(min,max}-stack imply "--call-graph dwarf"")

I added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 18 Apr 2016 12:56:48 +1000
Subject: [PATCH] perf: trace: fix build when HAVE_DWARF_UNWIND_SUPPORT is not set

Fixes: 056149932602 ("perf trace: Make --(min,max}-stack imply "--call-graph dwarf"")

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 tools/perf/builtin-trace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index 026ec0c749b0..48dc23a4f405 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -3109,7 +3109,9 @@ int cmd_trace(int argc, const char **argv, const char *prefix __maybe_unused)
 			"per thread proc mmap processing timeout in ms"),
 	OPT_END()
 	};
+#ifdef HAVE_DWARF_UNWIND_SUPPORT
 	bool max_stack_user_set = true;
+#endif
 	bool mmap_pages_user_set = true;
 	const char * const trace_subcommands[] = { "record", NULL };
 	int err;
@@ -3149,7 +3151,9 @@ int cmd_trace(int argc, const char **argv, const char *prefix __maybe_unused)
 
 	if (trace.max_stack == UINT_MAX) {
 		trace.max_stack = PERF_MAX_STACK_DEPTH;
+#ifdef HAVE_DWARF_UNWIND_SUPPORT
 		max_stack_user_set = false;
+#endif
 	}
 
 #ifdef HAVE_DWARF_UNWIND_SUPPORT
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
