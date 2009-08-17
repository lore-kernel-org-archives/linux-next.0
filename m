From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the  tree
Date: Mon, 17 Aug 2009 16:50:51 +1000
Message-ID: <20090817165051.765262cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47758 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756898AbZHQGu5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2009 02:50:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>, Jason Baron <jbaron@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in
kernel/trace/trace.h between commit
9ec04da7489d2c9ae01ea6e9b5fa313ccf3d35fb ("net: skb ftracer - Add actual
ftrace code to kernel (v3)") from the net tree and commit
64c12e0444fcc6b75eb49144ba46d43dbdc6bc8f ("tracing: Add individual
syscalls tracepoint id support") from the tip tree.

Just overlapping additions/removals.  I fixed it up (see below) and can
carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/trace/trace.h
index 8a6281b,300ef78..0000000
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@@ -336,12 -317,6 +334,8 @@@ extern void __ftrace_bad_type(void)
  			  TRACE_KMEM_ALLOC);	\
  		IF_ASSIGN(var, ent, struct kmemtrace_free_entry,	\
  			  TRACE_KMEM_FREE);	\
- 		IF_ASSIGN(var, ent, struct syscall_trace_enter,		\
- 			  TRACE_SYSCALL_ENTER);				\
- 		IF_ASSIGN(var, ent, struct syscall_trace_exit,		\
- 			  TRACE_SYSCALL_EXIT);				\
 +		IF_ASSIGN(var, ent, struct trace_skb_event,		\
 +			  TRACE_SKB_SOURCE);				\
  		__ftrace_bad_type();					\
  	} while (0)
  
