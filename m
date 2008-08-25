From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  tree build failure
Date: Mon, 25 Aug 2008 20:33:33 +1000
Message-ID: <20080825203333.e63a024a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56779 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753773AbYHYKdj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 06:33:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

Hi all,

Today's linux-next build (powerpc allyesconfig) failed like this:

kernel/trace/ftrace.c:317: error: redefinition of 'ftrace_release'
include/linux/ftrace.h:207: error: previous definition of 'ftrace_release' was here

Introduced by commit 61e679bf257baf9a089641999cf618e92f07b5dd ("ftrace:
remove old pointers to mcount").

I applied the following patch.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Aug 2008 20:28:31 +1000
Subject: [PATCH] ftrace: protect the definition of ftrace_release

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/trace/ftrace.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 2bc3eb5..094170a 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -314,6 +314,7 @@ static void ftrace_free_rec(struct dyn_ftrace *rec)
 	rec->flags |= FTRACE_FL_FREE;
 }
 
+#ifdef CONFIG_FTRACE_MCOUNT_RECORD
 void ftrace_release(void *start, unsigned long size)
 {
 	struct dyn_ftrace *rec;
@@ -339,6 +340,7 @@ void ftrace_release(void *start, unsigned long size)
 	spin_unlock(&ftrace_lock);
 
 }
+#endif /* CONFIG_FTRACE_MCOUNT_RECORD */
 
 static struct dyn_ftrace *ftrace_alloc_dyn_node(unsigned long ip)
 {
-- 
1.5.6.3
