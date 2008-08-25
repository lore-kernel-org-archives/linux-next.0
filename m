From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Mon, 25 Aug 2008 08:11:01 +0200
Message-ID: <20080825061101.GA22790@elte.hu>
References: <20080825130844.4d3a4399.sfr@canb.auug.org.au> <20080825060529.GA14993@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:38978 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750734AbYHYGLW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Aug 2008 02:11:22 -0400
Content-Disposition: inline
In-Reply-To: <20080825060529.GA14993@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>


* Ingo Molnar <mingo@elte.hu> wrote:

> > kernel/trace/ftrace.c:416: error: incompatible type for argument 1 of '_spin_lock_irqsave'
> > kernel/trace/ftrace.c:433: error: incompatible type for argument 1 of '_spin_lock_irqsave'
> > 
> > (This is after I have disabled CONFIG_FTRACE_MCOUNT_RECORD)
> 
> hm, how have you disabled it? It's not an interactive option and it's 
> always enabled when CONFIG_DYNAMIC_FTRACE is enabled. (that's how that 
> build failure never got discovered)

ah, i see the other thread now, about binutils version dependency. I've 
applied your fix as per the commit below.

	Ingo

>From b2528d2a50942e9d546d3c2e29cde89336053a03 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Aug 2008 13:08:44 +1000
Subject: [PATCH] ftrace: fix build failure

After disabling FTRACE_MCOUNT_RECORD via a patch, a dormant build
failure surfaced:

 kernel/trace/ftrace.c: In function 'ftrace_record_ip':
 kernel/trace/ftrace.c:416: error: incompatible type for argument 1 of '_spin_lock_irqsave'
 kernel/trace/ftrace.c:433: error: incompatible type for argument 1 of '_spin_lock_irqsave'

Introduced by commit 6dad8e07f4c10b17b038e84d29f3ca41c2e55cd0 ("ftrace:
add necessary locking for ftrace records").

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ingo Molnar <mingo@elte.hu>
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
