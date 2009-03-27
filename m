From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tracing/powerpc tree build failure
Date: Fri, 27 Mar 2009 23:08:34 +1100
Message-ID: <20090327230834.93d0221d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44085 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751092AbZC0MIl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Mar 2009 08:08:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org

Hi all,

Today's linux-next build (powerpc allyesconfig) failed like this:

arch/powerpc/kernel/ftrace.c: In function 'prepare_ftrace_return':
arch/powerpc/kernel/ftrace.c:612: warning: passing argument 3 of 'ftrace_push_return_trace' makes pointer from integer without a cast
arch/powerpc/kernel/ftrace.c:612: error: too many arguments to function 'ftrace_push_return_trace'

Caused by commit 5d1a03dc541dc6672e60e57249ed22f40654ca47
("function-graph: moved the timestamp from arch to generic code") from
the tracing tree which (removed an argument from
ftrace_push_return_trace()) interacting with commit
6794c78243bfda020ab184d6d578944f8e90d26c ("powerpc64: port of the
function graph tracer") from the powerpc tree.

I added the following patch and can carry it as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 27 Mar 2009 22:47:58 +1100
Subject: [PATCH] tracing: fixup for ftrace_push_return_trace API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/kernel/ftrace.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/ftrace.c b/arch/powerpc/kernel/ftrace.c
index 5b5d16b..5455943 100644
--- a/arch/powerpc/kernel/ftrace.c
+++ b/arch/powerpc/kernel/ftrace.c
@@ -557,7 +557,6 @@ extern void mod_return_to_handler(void);
 void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 {
 	unsigned long old;
-	unsigned long long calltime;
 	int faulted;
 	struct ftrace_graph_ent trace;
 	unsigned long return_hooker = (unsigned long)&return_to_handler;
@@ -606,10 +605,7 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr)
 		return;
 	}
 
-	calltime = cpu_clock(raw_smp_processor_id());
-
-	if (ftrace_push_return_trace(old, calltime,
-				self_addr, &trace.depth) == -EBUSY) {
+	if (ftrace_push_return_trace(old, self_addr, &trace.depth) == -EBUSY) {
 		*parent = old;
 		return;
 	}
-- 
1.6.2.1
