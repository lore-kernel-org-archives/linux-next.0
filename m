From: Joe Perches <joe@perches.com>
Subject: [PATCH 2/3] include/linux/logging.h: Reduce data usage of printk_once
Date: Thu, 10 Sep 2009 20:29:41 -0700
Message-ID: <0657138fc813c32c20a38949b5646f4c61790cad.1252639196.git.joe@perches.com>
References: <cover.1252639195.git.joe@perches.com>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753943AbZIKD3p@vger.kernel.org>
In-Reply-To: <cover.1252639195.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>
List-Id: linux-next.vger.kernel.org

Use bool for int
Don't initialize __printk_once, invert test

Signed-off-by: Joe Perches <joe@perches.com>
---
 include/linux/logging.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/logging.h b/include/linux/logging.h
index 361d5ed..d76ccfa 100644
--- a/include/linux/logging.h
+++ b/include/linux/logging.h
@@ -91,10 +91,10 @@ extern bool printk_timed_ratelimit(unsigned long *caller_jiffies,
  */
 #define printk_once(fmt, ...) \
 ({						\
-	static int __print_once = 1;		\
+	static bool __print_once;		\
 						\
-	if (__print_once) {			\
-		__print_once = 0;		\
+	if (!__print_once) {			\
+		__print_once = true;		\
 		printk(fmt, ##__VA_ARGS__);	\
 	}					\
 })
-- 
1.6.3.1.10.g659a0.dirty
