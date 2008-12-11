From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree
Date: Thu, 11 Dec 2008 11:41:54 +1100
Message-ID: <20081211114154.5d420ff5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48632 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753158AbYLKAmD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Dec 2008 19:42:03 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Hugh Dickins <hugh@veritas.com>, Frederic Weisbecker <fweisbec@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in
include/linux/ftrace.h between commit
9c24624727f6d6c460e45762a408ca5f5b9b8ef2 ("KSYM_SYMBOL_LEN fixes") from
Linus' tree and commit 3f5ec13696fd4a33bde42f385406cbb1d3cc96fd
("tracing/fastboot: move boot tracer structs and funcs into their own
header") from the ftrace tree.

The latter moved some code that the former fixed.  I fixed it up as best
I could (see below - I used the ftrace tree version of
include/linux/ftrace.h), but it should be checked and a merge with Linus'
tree done to resolve this conflict.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/include/trace/boot.h b/include/trace/boot.h
index 6b54537..3ec58b4 100644
--- a/include/trace/boot.h
+++ b/include/trace/boot.h
@@ -9,7 +9,7 @@
  */
 struct boot_trace_call {
 	pid_t			caller;
-	char			func[KSYM_NAME_LEN];
+	char			func[KSYM_SYMBOL_LEN];
 };
 
 /*
@@ -17,7 +17,7 @@ struct boot_trace_call {
  * while it returns.
  */
 struct boot_trace_ret {
-	char			func[KSYM_NAME_LEN];
+	char			func[KSYM_SYMBOL_LEN];
 	int				result;
 	unsigned long long	duration;		/* nsecs */
 };
