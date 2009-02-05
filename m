From: Ingo Molnar <mingo@elte.hu>
Subject: [tip:core/printk] printk: introduce printk_once()
Date: Thu, 5 Feb 2009 14:04:20 +0100
Message-ID: <20090205130420.GA10525@elte.hu>
References: <1233829109-23358-1-git-send-email-trenn@suse.de> <1233829109-23358-2-git-send-email-trenn@suse.de> <20090205120203.GA8799@elte.hu> <200902051327.16852.trenn@suse.de> <20090205124234.GD8799@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:59245 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754750AbZBENEd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 08:04:33 -0500
Content-Disposition: inline
In-Reply-To: <20090205124234.GD8799@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> printk_once() would be nice indeed - it's a frequent construct.

Something like the patch below?

	Ingo

---------------->
Author:     Ingo Molnar <mingo@elte.hu>
AuthorDate: Thu, 5 Feb 2009 13:45:43 +0100
Commit:     Ingo Molnar <mingo@elte.hu>
CommitDate: Thu, 5 Feb 2009 13:52:29 +0100

printk: introduce printk_once()

This pattern shows up frequently in the kernel:

  static int once = 1;
  ...

		if (once) {
			once = 0;
			printk(KERN_ERR "message\n");
		}
  ...

So add a printk_once() helper macro that reduces this to a single line
of:

		printk_once(KERN_ERR "message\n");

It works analogously to WARN_ONCE() & friends. (We use a macro not
an inline because vararg expansion in inlines looks awkward and the
macro is simple enough.)

Signed-off-by: Ingo Molnar <mingo@elte.hu>


---
 include/linux/kernel.h |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 343df9e..3c183d9 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -242,6 +242,19 @@ extern struct ratelimit_state printk_ratelimit_state;
 extern int printk_ratelimit(void);
 extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
 				   unsigned int interval_msec);
+
+/*
+ * Print a one-time message (analogous to WARN_ONCE() et al):
+ */
+#define printk_once(x...) ({			\
+	static int __print_once = 1;		\
+						\
+	if (__print_once) {			\
+		__print_once = 0;		\
+		printk(x);			\
+	}					\
+})
+
 #else
 static inline int vprintk(const char *s, va_list args)
 	__attribute__ ((format (printf, 1, 0)));
@@ -253,6 +266,10 @@ static inline int printk_ratelimit(void) { return 0; }
 static inline bool printk_timed_ratelimit(unsigned long *caller_jiffies, \
 					  unsigned int interval_msec)	\
 		{ return false; }
+
+/* No effect, but we still get type checking even in the !PRINTK case: */
+#define printk_once(x...) printk(x)
+
 #endif
 
 extern int printk_needs_cpu(int cpu);
