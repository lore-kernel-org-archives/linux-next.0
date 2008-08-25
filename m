From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 13:08:44 +1000
Message-ID: <20080825130844.4d3a4399.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35581 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752878AbYHYDIt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Aug 2008 23:08:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org

Hi all,

Today's linux-next build (x86_64 allmodconfig) failed like this:

kernel/trace/ftrace.c: In function 'ftrace_record_ip':
kernel/trace/ftrace.c:416: error: incompatible type for argument 1 of '_spin_lock_irqsave'
kernel/trace/ftrace.c:433: error: incompatible type for argument 1 of '_spin_lock_irqsave'

(This is after I have disabled CONFIG_FTRACE_MCOUNT_RECORD)

Introduced by commit 6dad8e07f4c10b17b038e84d29f3ca41c2e55cd0 ("ftrace:
add necessary locking for ftrace records").  I have applied the following
patch.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Aug 2008 13:06:46 +1000
Subject: [PATCH] ftrace: fix locking when CONFIG_FTRACE_MCOUNT_RECORD is not set

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/trace/ftrace.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index dcc8f6b..2bc3eb5 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -161,8 +161,8 @@ static int __unregister_ftrace_function(struct ftrace_ops *ops)
  * not recorded via the compilation.
  */
 static DEFINE_SPINLOCK(ftrace_hash_lock);
-#define ftrace_hash_lock(flags)	  spin_lock_irqsave(ftrace_hash_lock, flags)
-#define ftrace_hash_unlock(flags) spin_lock_irqsave(ftrace_hash_lock, flags)
+#define ftrace_hash_lock(flags)	  spin_lock_irqsave(&ftrace_hash_lock, flags)
+#define ftrace_hash_unlock(flags) spin_lock_irqsave(&ftrace_hash_lock, flags)
 #else
 /* This is protected via the ftrace_lock with MCOUNT_RECORD. */
 #define ftrace_hash_lock(flags)   do { (void)flags; } while (0)
-- 
1.5.6.3
