From: Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 1/2] tracing: Add condition check to RCU lockdep checks
Date: Fri, 06 Feb 2015 15:06:54 -0500
Message-ID: <20150206200800.552335453@goodmis.org>
References: <20150206200653.009919583@goodmis.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline; filename=0001-tracing-Add-condition-check-to-RCU-lockdep-checks.patch
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Sedat Dilek <sedat.dilek@gmail.com>
List-Id: linux-next.vger.kernel.org

From: "Steven Rostedt (Red Hat)" <rostedt@goodmis.org>

The trace_tlb_flush() tracepoint can be called when a CPU is going offline.
When a CPU is offline, RCU is no longer watching that CPU and since the
tracepoint is protected by RCU, it must not be called. To prevent the
tlb_flush tracepoint from being called when the CPU is offline, it was
converted to a TRACE_EVENT_CONDITION where the condition checks if the
CPU is online before calling the tracepoint.

Unfortunately, this was not enough to stop lockdep from complaining about
it. Even though the RCU protected code of the tracepoint will never be
called, the condition is hidden within the tracepoint, and even though the
condition prevents RCU code from being called, the lockdep checks are
outside the tracepoint (this is to test tracepoints even when they are not
enabled).

Even though tracepoints should be checked to be RCU safe when they are not
enabled, the condition should still be considered when checking RCU.

Link: http://lkml.kernel.org/r/CA+icZUUGiGDoL5NU8RuxKzFjoLjEKRtUWx=JB8B9a0EQv-eGzQ@mail.gmail.com

Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 include/linux/tracepoint.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index e08e21e5f601..68a346b8328a 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -173,7 +173,7 @@ extern void syscall_unregfunc(void);
 				TP_PROTO(data_proto),			\
 				TP_ARGS(data_args),			\
 				TP_CONDITION(cond),,);			\
-		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
+		if (IS_ENABLED(CONFIG_LOCKDEP) && cond) {			\
 			rcu_read_lock_sched_notrace();			\
 			rcu_dereference_sched(__tracepoint_##name.funcs);\
 			rcu_read_unlock_sched_notrace();		\
-- 
2.1.4
