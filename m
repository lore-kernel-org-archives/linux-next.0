From: Tejun Heo <tj@kernel.org>
Subject: [PATCH] this_cpu: Use this_cpu_xx in trace_functions_graph.c
Date: Tue, 13 Oct 2009 23:29:24 +0900
Message-ID: <4AD48EC4.8040701@kernel.org>
References: <20091013144812.bdb376aa.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:59051 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760007AbZJMOad (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 13 Oct 2009 10:30:33 -0400
In-Reply-To: <20091013144812.bdb376aa.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

ftrace_cpu_disabled usage in trace_functions_graph.c were left out
during this_cpu_xx conversion in commit 9288f99a causing compile
failure.  Convert them.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Lameter <cl@linux-foundation.org>
---
This patch has been committed to percpu#for-next.  Thanks.

 kernel/trace/trace_functions_graph.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index 45e6c01..90a6daa 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -176,7 +176,7 @@ static int __trace_graph_entry(struct trace_array *tr,
 	struct ring_buffer *buffer = tr->buffer;
 	struct ftrace_graph_ent_entry *entry;

-	if (unlikely(local_read(&__get_cpu_var(ftrace_cpu_disabled))))
+	if (unlikely(__this_cpu_read(per_cpu_var(ftrace_cpu_disabled))))
 		return 0;

 	event = trace_buffer_lock_reserve(buffer, TRACE_GRAPH_ENT,
@@ -240,7 +240,7 @@ static void __trace_graph_return(struct trace_array *tr,
 	struct ring_buffer *buffer = tr->buffer;
 	struct ftrace_graph_ret_entry *entry;

-	if (unlikely(local_read(&__get_cpu_var(ftrace_cpu_disabled))))
+	if (unlikely(__this_cpu_read(per_cpu_var(ftrace_cpu_disabled))))
 		return;

 	event = trace_buffer_lock_reserve(buffer, TRACE_GRAPH_RET,
-- 
1.6.4.2
